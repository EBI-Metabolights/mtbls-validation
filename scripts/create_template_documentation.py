import json
from pathlib import Path
import re
from typing import Any, OrderedDict, Tuple, Union

import jsonschema
from pydantic import BaseModel
from scripts import control_list_models as models
from pydantic.alias_generators import to_snake


class OntologyTerm(BaseModel):
    source_ref: str = ""
    term_accession: str = ""
    term: str = ""


def get_controls(subfolder: str, key_labels: None | dict[str, str] = None):
    if not key_labels:
        key_labels = {}
    control_schema = models.FieldValueValidation.model_json_schema(by_alias=True)
    control_folder = f"validation/metabolights/validation/v2/controls/{subfolder}"
    files = Path(control_folder).rglob("*.json")
    controls: dict[str, list[models.FieldValueValidation]] = {}

    for file in files:
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            label = key_labels.get(key) or key
            controls[label] = []
            for x in input_data:
                jsonschema.validate(x, control_schema)
                data = models.FieldValueValidation.model_validate(x, by_alias=True)
                controls[label].append(data)

    return controls


def get_templates(subfolder: str, key_labels: None | dict[str, str] = None):
    if not key_labels:
        key_labels = {}
    schema = models.IsaTableFileTemplate.model_json_schema(by_alias=True)
    control_folder = f"validation/metabolights/validation/v2/templates/{subfolder}"
    files = Path(control_folder).rglob("*.json")
    templates: dict[str, list[models.IsaTableFileTemplate]] = {}

    for file in files:
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            label = key_labels.get(key) or key
            templates[label] = []
            for x in input_data:
                jsonschema.validate(x, schema)
                data = models.IsaTableFileTemplate.model_validate(x, by_alias=True)
                templates[label].append(data)

    return templates


def escape(text: str) -> str:
    if not text:
        return ""
    # Characters with special meaning in Markdown
    md_chars = r"\`*_{}[]()#+-.!|"
    # Escape each character with a backslash
    return re.sub(f"([{re.escape(md_chars)}])", r"\\\1", text)


def find_rule(
    control_list: list[models.FieldValueValidation],
    template_name: str,
    template_version: str,
):
    for control in control_list:
        names = control.selection_criteria.isa_file_template_name_filter
        versions = control.selection_criteria.isa_file_template_name_filter
        in_filter = all(
            [
                not names or any([True for x in names if x == template_name]),
                not versions or any([True for x in versions if x == template_version]),
            ]
        )
        return control if in_filter else None


def create_control_list_documentation(
    controls: dict[str, list[models.FieldValueValidation]],
    templates: dict[str, list[models.IsaTableFileTemplate]],
    isa_file_type: str,
    control_lists_root_path: str,
    common_headers: list[str] = None,
):
    folder_path = control_lists_root_path / Path(
        isa_file_type.lower().replace(" ", "-") + "-control-lists"
    )
    folder_path.mkdir(parents=True, exist_ok=True)

    for template_name, template_list in templates.items():
        folder_name = f"{template_name.replace('_', '-')}"
        for template in template_list:
            target_path = (
                folder_path
                / Path(template_name)
                / f"{folder_name}-v{template.version}.md"
            )
            target_path.parent.mkdir(parents=True, exist_ok=True)
            create_md_file(
                controls,
                isa_file_type,
                common_headers,
                template_name,
                [x.column_header for x in template.headers],
                template.version,
                target_path,
            )


def create_md_file(
    controls: dict[str, list[models.FieldValueValidation]],
    isa_file_type: str,
    common_headers: list[str],
    template_name: str,
    template_headers: list[str],
    template_version: str,
    target_path: Path,
):
    added_fields = set()
    with target_path.open("w") as f:
        f.write(f"# {template_name} - {isa_file_type} Field Controls\n\n")
        headers: list[str] = common_headers.copy() if common_headers else []
        headers.extend(template_headers)

        for param in headers:
            if param not in controls or param in added_fields:
                continue
            added_fields.add(param)
            control_list = controls[param]
            rule = find_rule(control_list, template_name, template_version)
            if not rule:
                continue
            pattern = rule.constraints.get(
                models.ConstraintType.PATTERN,
                models.FieldConstraint(
                    constraint="",
                    error_message="",
                    enforcement_level=models.EnforcementLevel.NOT_APPLICABLE,
                ),
            )
            f.write(f"## {escape(param)}\n\n")
            f.write("| Attribute | Value |\n|---|------|\n")
            f.write(f"| Rule Name | {escape(rule.rule_name)} |\n")
            f.write(f"| Rule Description | {escape(rule.description)} |\n")
            criteria = rule.selection_criteria
            if criteria.study_category_filter:
                f.write(
                    "| Applicable Study Categories | "
                    f"{escape(', '.join([x.value for x in criteria.study_category_filter]))} |\n",
                )
            else:
                f.write("| Applicable Study Categories | All |\n")

            if criteria.isa_file_template_name_filter:
                f.write(
                    f"| Applicable Template Names | "
                    f"{escape(', '.join([x for x in criteria.isa_file_template_name_filter]))} |\n",
                )
            else:
                f.write("| Applicable Template Names | All |\n")
            if criteria.template_version_filter:
                f.write(
                    "| Applicable Template Versions | "
                    f"{escape(', '.join([x for x in criteria.template_version_filter]))} |\n",
                )
            else:
                f.write("| Applicable Template Versions | All |\n")

            date_filter = []
            if rule.selection_criteria.study_created_before:
                date_filter.append(
                    escape(
                        "Created before: "
                        + rule.selection_criteria.study_created_at_or_after.isoformat()
                    )
                )
            if rule.selection_criteria.study_created_at_or_after:
                date_filter.append(
                    escape(
                        "Created at or after: "
                        + rule.selection_criteria.study_created_at_or_after.isoformat()
                    )
                )
            date_filter = ", ".join(date_filter)
            if date_filter:
                f.write(
                    "| Applicable Only for The Studies | "
                    f"{escape(', '.join([x for x in date_filter]))} |\n",
                )

            f.write(f"| Validation Type | {rule.validation_type} |\n")
            if pattern.constraint:
                f.write(f"| Pattern | {escape(pattern.constraint)} |\n")
                f.write(f"| Pattern Message | {escape(pattern.error_message)} |\n")
                f.write(
                    f"| Pattern Enforcement Level | {escape(pattern.enforcement_level)} |\n",
                )
            is_any_ontology_rule = (
                rule.validation_type == models.ValidationType.ANY_ONTOLOGY_TERM
            )
            is_selected_terms_rule = (
                rule.validation_type == models.ValidationType.SELECTED_ONTOLOGY_TERM
            )
            if rule.ontologies:
                label = (
                    "Recommended Ontologies [Ordered]"
                    if is_any_ontology_rule
                    else "Ontologies [Ordered]"
                )
                f.write(f"| {label} | {escape(', '.join(rule.ontologies))} |\n")
            if (
                rule.allowed_parent_ontology_terms
                and rule.allowed_parent_ontology_terms.parents
            ):
                parent_rule = rule.allowed_parent_ontology_terms
                f.write(
                    "| Allowed Parent Ontology Terms | "
                    f"{escape(', '.join([str(x) for x in parent_rule.parents]))} |\n",
                )
                if parent_rule.exclude_by_label_pattern:
                    f.write(
                        "| Allowed Parent Ontology Term Exceptions | "
                        f"{escape(', '.join(parent_rule.exclude_by_label_pattern))} |\n",
                    )
            if rule.allowed_placeholders:
                f.write(
                    "| Allowed Placeholders | "
                    f"{escape(', '.join([str(x) for x in rule.allowed_placeholders]))} |\n",
                )
            if rule.allowed_other_sources:
                f.write(
                    f"| Allowed Other Sources | "
                    f"{escape(', '.join([str(x) for x in rule.allowed_other_sources]))} |\n",
                )
            if rule.allowed_missing_ontology_terms:
                f.write(
                    "| Allowed Missing Terms | "
                    f"{escape(', '.join([str(x) for x in rule.allowed_missing_ontology_terms]))} |\n",
                )
            if rule.unexpected_terms:
                f.write(
                    "| Unexpected Terms | "
                    f"{escape(', '.join(rule.unexpected_terms))} |\n",
                )
                f.write(
                    "| Unexpected Term Enforcement Level | "
                    f"{escape(rule.unexpected_term_enforcement_level)} |\n",
                )

            if rule.terms or rule.allowed_parent_ontology_terms:
                f.write(
                    "| Ontology Term Enforcement Level | "
                    f"{escape(rule.term_enforcement_level)} |\n",
                )
            f.write("\n")

            if rule.terms:
                if is_selected_terms_rule:
                    f.write("### Terms\n\n")
                else:
                    f.write("### Recommended Terms\n\n")

                f.write(
                    "| # |Term  | Term Source  | Term Accession |\n"
                    "|---|------|--------------|----------------|\n"
                )
                for idx, item in enumerate(rule.terms):
                    f.write(
                        f"| {idx + 1} "
                        f"| {escape(item.term)} "
                        f"| {escape(item.term_source_ref)} "
                        f"| {escape(item.term_accession_number)} "
                        "|\n",
                    )
                f.write("\n")


def create_recommended_assay_control_lists() -> OrderedDict[
    str, OrderedDict[str, list[OntologyTerm]]
]:
    templates_path = (
        "validation/metabolights/validation/v2/controlLists/assayFileControls"
    )
    assay_file_templates = [str(x) for x in Path(f"{templates_path}").rglob("*.json")]
    recommended_terms_path = "docs/prioritised-control-lists"
    recommended_terms: OrderedDict[str, OrderedDict[str, list[OntologyTerm]]] = (
        OrderedDict()
    )

    for file in assay_file_templates:
        file_path = Path(file)
        with file_path.open() as f:
            file_content = json.load(f)

        for name, template in file_content.items():
            control_lists = template["controlList"]
            for control_list in control_lists:
                techniques = control_list["techniques"]
                values = control_list["values"]
                terms = [
                    OntologyTerm(
                        term=x["term"],
                        source_ref=x["termSourceRef"],
                        term_accession=x["termAccessionNumber"],
                    )
                    for x in values
                ]
                terms.sort(key=lambda x: x.term + x.source_ref)
                column_name = name
                for technique in techniques:
                    if technique not in recommended_terms:
                        recommended_terms[technique] = OrderedDict()

                    recommended_terms[technique][column_name] = terms

    target_parent_path = Path(f"{recommended_terms_path}/assay-file-control-lists")

    target_parent_path.mkdir(parents=True, exist_ok=True)
    for technique, column_terms in recommended_terms.items():
        target_path = target_parent_path / Path(f"{technique.lower()}.md")

        with target_path.open("w") as f:
            f.write(f"# {technique} Assay File Prioritised Control Lists Terms\n")
            sorted_column_terms = [(key, value) for key, value in column_terms.items()]
            sorted_column_terms.sort(key=lambda x: x[0])
            for column_name, terms in sorted_column_terms:
                f.write(f"\n### {column_name} Column\n\n")
                f.write(
                    "| # |Term  | Term Source  | Term Accession |\n"
                    "|---|------|--------------|----------------|\n"
                )
                for idx, item in enumerate(terms):
                    f.write(
                        f"| {idx + 1} "
                        f"| {item.term} "
                        f"| {item.source_ref} "
                        f"| {item.term_accession} "
                        "|\n"
                    )
    return recommended_terms


def create_recommended_control_lists(
    templates_path: str,
    title: Union[None, str] = None,
    file_name: Union[None, str] = None,
) -> OrderedDict[str, list[OntologyTerm]]:
    field_control_list_path = [str(x) for x in Path(f"{templates_path}").glob("*.json")]

    recommended_terms_path = "docs/prioritised-control-lists"
    target_parent_path = Path(f"{recommended_terms_path}/{file_name}-control-lists")
    target_parent_path.mkdir(parents=True, exist_ok=True)
    recommended_terms: OrderedDict[str, list[OntologyTerm]] = OrderedDict()
    target_path = target_parent_path / Path(f"{file_name}.md")
    column_attributes: OrderedDict[str, Tuple[Any, bool, bool]] = OrderedDict()
    with target_path.open("w") as fw:
        for file in field_control_list_path:
            file_path = Path(file)
            with file_path.open() as f:
                file_content = json.load(f)
            name = list(file_content.keys())[0]
            control_lists = file_content[name]
            fw.write(f"# {title} Prioritised Control Lists Terms\n")

            for control_list in control_lists:
                # control_list = file_content[name]["terms"]
                terms = [
                    OntologyTerm(
                        term=x["term"],
                        source_ref=x["termSourceRef"],
                        term_accession=x["termAccessionNumber"],
                    )
                    for x in control_list.get("terms", [])
                ]
                terms.sort(key=lambda x: x.term + x.source_ref)
                recommended_terms[name] = terms
                # column_attributes[name] = (
                #     control_list.get("ontologies", []),
                #     file_content[name]["additionalOntologies"],
                #     file_content[name]["additionalTerms"],
                # )
                fw.write(f"## {control_list.get('ruleName', '')}\n")

                sorted_fields = [
                    (key, value) for key, value in recommended_terms.items()
                ]
                sorted_fields.sort(key=lambda x: x[0])
                fw.write(f"\n#### {name}\n\n")
                for name, terms in sorted_fields:
                    fw.write(f"\n#### {name}\n\n")
                    fw.write("\n##### Configuration \n\n")
                    fw.write(
                        "| Parameter | Value  |\n"
                        "|--------|--------|\n"
                        f"| Ontologies | {', '.join(control_list.get('ontologies', []))}|\n"
                        f"| Unexpected Terms | {', '.join(control_list.get('unexpectedTerms', []))}|\n"
                        f"| Unexpected Term Enforcement Level | {control_list.get('unexpectedTermEnforcementLevel', 'not-applicable')}|\n"
                        f"| Term Enforcement Level | {control_list.get('termEnforcementLevel', 'not-applicable')}|\n"
                        "\n"
                    )

                    fw.write("\n##### Terms \n\n")
                    fw.write(
                        "| # |Term  | Term Source  | Term Accession |\n"
                        "|---|------|--------------|----------------|\n"
                    )
                    for idx, item in enumerate(terms):
                        fw.write(
                            f"| {idx + 1} "
                            f"| {item.term} "
                            f"| {item.source_ref} "
                            f"| {item.term_accession} "
                            "|\n"
                        )
    return recommended_terms


def create_file_structure_documentation(
    assay_file_templates: dict[str, list[models.IsaTableFileTemplate]],
    sample_file_templates: dict[str, list[models.IsaTableFileTemplate]],
    assignment_file_templates: dict[str, list[models.IsaTableFileTemplate]],
    assay_controls: dict[str, dict[str, list[models.FieldValueValidation]]],
    sample_controls: dict[str, dict[str, list[models.FieldValueValidation]]],
):
    # templates_path = "validation/metabolights/validation/v2/templates"
    # sample_file_templates = [
    #     str(x)
    #     for x in Path(f"{templates_path}/sampleFileHeaderTemplates").rglob("*.json")
    # ]
    # assay_file_templates = [
    #     str(x)
    #     for x in Path(f"{templates_path}/assayFileHeaderTemplates").rglob("*.json")
    # ]
    # assignment_file_templates = [
    #     str(x)
    #     for x in Path(f"{templates_path}/assignmentFileHeaderTemplates").rglob("*.json")
    # ]

    pairs = [
        (sample_file_templates, "sample-file-structure"),
        (assay_file_templates, "assay-file-structure"),
        (assignment_file_templates, "maf-file-structure"),
    ]
    for templates, folder in pairs:
        # for name, templates in file_content.items():
        parent_folder = folder.removesuffix("-structure")
        for name, template_list in templates.items():
            for template in template_list:
                version = template.version
                headers = template.headers
                doc_file_name = f"{parent_folder}-{name}-v{version}.md"
                target_path = Path(
                    f"docs/file-structures/{folder}/{name}/{doc_file_name}"
                )
                template_headers: list[tuple[str, str]] = []
                target_path.parent.mkdir(parents=True, exist_ok=True)
                template_file_name = ""
                with target_path.open("w") as f:
                    if folder == "maf-file-structure":
                        header = (
                            f"MAF File Default Structure for {name} Assay v{version}"
                        )
                        template_file_name = f"maf-file/{name}/m_template-{name}-v{version}_metabolite_profiling_v2_maf.tsv"

                    elif folder == "sample-file-structure":
                        header = f"{name.capitalize()} Sample File Default Structure v{version}"
                        template_file_name = (
                            f"sample-file/{name}/s_template-{name}-v{version}.txt"
                        )
                    else:
                        header = f"{name.capitalize()} Assay File Default Structure v{version}"
                        template_file_name = f"assay-file/{name}/a_template-{name}-v{version}-metabolite_profiling.txt"
                    f.write(f"# {header}\n\n")
                    f.write(
                        "| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |\n"
                        "|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|\n"
                    )
                    for idx, item in enumerate(headers):
                        header = item.column_header

                        template_headers.append(
                            (
                                header,
                                item.default_value
                                if item.default_value is not None
                                else "",
                            )
                        )
                        if item.column_structure:
                            if item.column_structure == "ONTOLOGY_COLUMN":
                                template_headers.append(("Term Source REF", ""))
                                template_headers.append(("Term Accession Number", ""))
                            elif (
                                item.column_structure
                                == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"
                            ):
                                template_headers.append(("Unit", ""))
                                template_headers.append(("Term Source REF", ""))
                                template_headers.append(("Term Accession Number", ""))

                        # controlled_terms = ""
                        # link = ""
                        # # if (
                        # #     header in sample_controlled_terms
                        # #     and folder == "sample-file-structure"
                        # # ):
                        # #     link = (
                        # #         header.replace(" ", "-")
                        # #         .lower()
                        # #         .replace("]", "")
                        # #         .replace("[", "")
                        # #     )
                        # #     controlled_terms = f"[Controlled Terms](../../../docs/prioritised-control-lists/sample-file-control-lists/{version.replace(".", "_")}sample-file.md#{link})"
                        # # elif (
                        # #     name in assay_controlled_terms
                        # #     and header in assay_controlled_terms[name]
                        # #     and folder == "assay-file-structure"
                        # # ):
                        link = (
                            f"{header} Column".replace(" ", "-")
                            .lower()
                            .replace("]", "")
                            .replace("[", "")
                        )

                        control_list_folder = folder.replace(
                            "-file-structure", "-control-lists"
                        )
                        controlled_terms = f"[Controlled Terms](../../../docs/prioritised-control-lists2/{control_list_folder}/v{name}/{doc_file_name}#{link})"

                        f.write(
                            f"| {idx + 1} "
                            f"| {item.column_header} "
                            f"| {item.column_structure.lower().replace('_', ' ')} "
                            f"| {item.required} "
                            f"| {item.min_length if item.min_length is not None and item.min_length > 0 else '-'} "
                            f"| {item.max_length if item.max_length is not None and item.max_length > 0 else '-'} "
                            f"| {item.description if item.description else ''} "
                            f"| {', '.join(item.examples) if item.examples else ''} "
                            f"| {controlled_terms} "
                            f"| {str(item.default_value) if item.default_value is not None else ''}"
                            "|\n"
                        )
                    templates_folder = Path("docs/templates")
                    template_path = templates_folder / Path(template_file_name)
                    template_path.parent.mkdir(parents=True, exist_ok=True)
                    with template_path.open("w") as fw:
                        fw.write("\t".join([x[0] for x in template_headers]))
                        fw.write("\n")
                        fw.write("\t".join([x[1] for x in template_headers]))
                        fw.write("\n")


if __name__ == "__main__":
    maf_file_templates = get_templates("assignmentFileHeaderTemplates")
    assay_file_templates = get_templates("assayFileHeaderTemplates")
    assay_common_fields = {"__default__": "Common", "Unit": "Unit"}
    assay_controls = get_controls("assayFileControls", assay_common_fields)

    investigation_common_fields = {"__default__": "Common", "Unit": "Unit"}
    investigation_controls = get_controls(
        "investigationFileControls", {"__default__": "Common"}
    )
    sample_common_fields: dict[str, str] = {
        "__default__": "Common",
        "__default_factor_value__": "Factor Value (Common)",
        "__default_characteristic__": "Characteristic (Common)",
        "Unit": "Unit",
    }
    sample_controls = get_controls("sampleFileControls", sample_common_fields)
    sample_file_templates = get_templates("sampleFileHeaderTemplates")

    control_lists_root_path = Path("docs/prioritised-control-lists2")
    create_control_list_documentation(
        assay_controls,
        assay_file_templates,
        "Assay File",
        control_lists_root_path,
        list(assay_common_fields.values()),
    )
    create_control_list_documentation(
        sample_controls,
        sample_file_templates,
        "Sample File",
        control_lists_root_path,
        list(sample_common_fields.values()),
    )
    investigation_fields = [
        x for x in investigation_controls.keys() if x not in investigation_common_fields
    ]
    for version in ["1.0", "2.0"]:
        target_root_path = control_lists_root_path / Path(
            "investigation-file-control-lists/minimum"
        )
        target_root_path.mkdir(parents=True, exist_ok=True)
        target_path = target_root_path / Path(f"minimum-v{version}.md")
        create_md_file(
            investigation_controls,
            "Investigation File",
            list(investigation_common_fields.values()),
            "Minimum",
            investigation_fields,
            version,
            target_path,
        )
    create_file_structure_documentation(
        assay_file_templates,
        sample_file_templates,
        maf_file_templates,
        assay_controls,
        sample_controls,
    )

    pass
if __name__ == "__main__2":
    assay_controlled_terms = create_recommended_assay_control_lists()

    templates_path = (
        "validation/metabolights/validation/v2/controls/investigationFileControls"
    )
    file_name = "investigation-file"
    title = "Investigation File"
    create_recommended_control_lists(
        templates_path=templates_path, file_name=file_name, title=title
    )
    templates_path = (
        "validation/metabolights/validation/v2/controlLists/sampleFileControls"
    )
    file_name = "sample-file"
    title = "Sample File"
    sample_controlled_terms = create_recommended_control_lists(
        templates_path=templates_path, file_name=file_name, title=title
    )

    # templates_path = "validation/metabolights/validation/v2/controlLists/unitColumns"
    # file_name = "unit-columns"
    # title = "Unit Columns"
    # create_recommended_control_lists(
    #     templates_path=templates_path, file_name=file_name, title=title
    # )

    create_file_structure_documentation(
        assay_controlled_terms=assay_controlled_terms,
        sample_controlled_terms=sample_controlled_terms,
    )
