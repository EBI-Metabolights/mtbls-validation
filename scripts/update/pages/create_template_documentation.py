from pathlib import Path

from pydantic import BaseModel

from scripts import models as models
from scripts.update.pages.utils import (
    find_rule,
    get_controls,
    get_template_settings,
    get_templates,
)
from scripts.utils import escape, zip_file


class OntologyTerm(BaseModel):
    source_ref: str = ""
    term_accession: str = ""
    term: str = ""


def create_control_list_documentation(
    controls: dict[str, list[models.FieldValueValidation]],
    templates: dict[str, list[models.IsaTableFileTemplate]],
    isa_file_type: str,
    control_lists_root_path: Path,
    common_headers: list[str],
    template_settings: models.TemplateSettings,
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

            # print(f"- {template_name}: {target_path}")
            target_path.parent.mkdir(parents=True, exist_ok=True)
            create_md_file(
                controls,
                isa_file_type,
                common_headers,
                template_name,
                [x.column_header for x in template.headers],
                template.version,
                target_path,
                template_settings,
            )


def create_md_file(
    controls: dict[str, list[models.FieldValueValidation]],
    isa_file_type: str,
    common_headers: list[str],
    template_name: str,
    template_headers: list[str],
    template_version: str,
    target_path: Path,
    template_settings: models.TemplateSettings,
):
    versions = template_settings.versions
    if template_version not in template_settings.active_template_versions:
        return
    for version in template_settings.active_template_versions:
        version_template = versions.get(version)
        for file_type, active_templates in [
            ("Assay File", version_template.active_assay_file_templates),
            ("Sample File", version_template.active_sample_file_templates),
            ("MAF File", version_template.active_assignment_file_templates),
            (
                "Investigation File",
                version_template.active_investigation_file_templates,
            ),
        ]:
            if isa_file_type == file_type and template_name not in active_templates:
                return

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
            pattern = (
                rule.constraints.get(
                    models.ConstraintType.PATTERN,
                    models.FieldConstraint(
                        constraint="",
                        error_message="",
                        enforcement_level=models.EnforcementLevel.NOT_APPLICABLE,
                    ),
                )
                if rule.constraints
                else None
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
                        + rule.selection_criteria.study_created_before.isoformat()
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
            if pattern and pattern.constraint:
                f.write(f"| Pattern | <code>{pattern.constraint}</code> |\n")
                f.write(f"| Pattern Message | {escape(pattern.error_message)} |\n")
                f.write(
                    f"| Pattern Enforcement Level | {escape(pattern.enforcement_level)} |\n",
                )
            is_any_ontology_rule = (
                rule.validation_type == models.OntologyValidationType.ANY_ONTOLOGY_TERM
            )
            is_selected_terms_rule = (
                rule.validation_type
                == models.OntologyValidationType.SELECTED_ONTOLOGY_TERM
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


def create_file_structure_documentation(
    assay_file_templates: dict[str, list[models.IsaTableFileTemplate]],
    sample_file_templates: dict[str, list[models.IsaTableFileTemplate]],
    assignment_file_templates: dict[str, list[models.IsaTableFileTemplate]],
    assay_controls: dict[str, list[models.FieldValueValidation]],
    sample_controls: dict[str, list[models.FieldValueValidation]],
    controls_root_path: Path,
    template_settings: models.TemplateSettings = None,
):
    pairs = [
        (sample_file_templates, "sample-file-structure", sample_controls),
        (assay_file_templates, "assay-file-structure", assay_controls),
        (assignment_file_templates, "maf-file-structure", {}),
    ]
    for templates, folder, controls in pairs:
        # for name, templates in file_content.items():
        parent_folder = folder.removesuffix("-structure")
        for name, template_list in templates.items():
            for template in template_list:
                version = template.version

                versions = template_settings.versions
                if version not in template_settings.active_template_versions:
                    continue
                version_template = versions.get(version)
                for file_type, active_templates in [
                    (
                        "assay-file-structure",
                        version_template.active_assay_file_templates,
                    ),
                    (
                        "sample-file-structure",
                        version_template.active_sample_file_templates,
                    ),
                    (
                        "maf-file-structure",
                        version_template.active_assignment_file_templates,
                    ),
                ]:
                    if folder == file_type and name not in active_templates:
                        continue

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
                        section_header = (
                            f"MAF File Default Structure for {name} Assay v{version}"
                        )
                        template_file_name = f"maf-file/{name}/m_template-{name}-v{version}_metabolite_profiling_v2_maf.tsv"

                    elif folder == "sample-file-structure":
                        section_header = (
                            f"{name} Sample File Default Structure v{version}"
                        )
                        template_file_name = (
                            f"sample-file/{name}/s_template-{name}-v{version}.txt"
                        )
                    else:
                        section_header = (
                            f"{name} Assay File Default Structure v{version}"
                        )
                        template_file_name = f"assay-file/{name}/a_template-{name}-metabolite_profiling-v{version}.txt"
                    templates_folder = Path("docs/template-files")
                    template_path = templates_folder / Path(template_file_name)
                    zip_template_path = Path(f"{str(template_path)}.zip")
                    # f.write("---\n")
                    # f.write("hide:\n")
                    # f.write("- navigation\n")
                    # f.write("---\n")
                    f.write(f"# {section_header}\n\n")
                    zip_link_relative = str(zip_template_path).removeprefix("docs/")
                    zip_file_link = f"[zip file](../../../{zip_link_relative})"

                    txt_link_relative = str(template_path).removeprefix("docs/")
                    if folder == "maf-file-structure":
                        txt_file_link = f"[tsv file](../../../{txt_link_relative})"
                    else:
                        txt_file_link = f"[txt file](../../../{txt_link_relative})"
                    f.write(
                        f"Download file template as {zip_file_link} or {txt_file_link}\n\n"
                    )
                    f.write(
                        '| Header  | Column Structure  | Constraints | <div style="width: 300px">Description</div> | <div style="width: 100px">Examples</div> |\n'
                        "|--------|-------------------|----------|-------------|----------\n"
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
                        if item.column_structure == "ONTOLOGY_COLUMN":
                            template_headers.append(("Term Source REF", ""))
                            template_headers.append(("Term Accession Number", ""))
                        elif item.column_structure == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY":
                            template_headers.append(("Unit", ""))
                            template_headers.append(("Term Source REF", ""))
                            template_headers.append(("Term Accession Number", ""))
                        control_page = None
                        if header in controls:
                            control_list = controls.get(header)
                            rule = find_rule(control_list, name, version)
                            if rule:
                                link = (
                                    header.replace(" ", "-")
                                    .lower()
                                    .replace("]", "")
                                    .replace("[", "")
                                )
                                blank_link = '{:target="_blank"}'
                                # if folder == "sample-file-structure":
                                control_list_folder = folder.replace(
                                    "-structure", "-control-lists"
                                )
                                control_page_name = f"{name}-v{version}.md"

                                control_page = (
                                    f"[Controls](../../../{str(controls_root_path)}"
                                    f"/{control_list_folder}"
                                    f"/{name}"
                                    f"/{control_page_name}"
                                    f"#{link})"
                                    f"{blank_link}"
                                )
                        constraints = []
                        if item.required:
                            constraints.append("*Required*")
                        if item.min_length is not None and item.min_length > 0:
                            constraints.append(f"MinLength: {item.min_length}")
                        if item.max_length is not None and item.max_length > 0:
                            constraints.append(f"MaxLength: {item.max_length}")
                        if item.default_value is not None:
                            constraints.append(
                                escape(f"Default: {str(item.default_value)}")
                            )
                        if control_page:
                            if constraints:
                                constraints.append("")
                            constraints.append(control_page)

                        constraints_str = "<br/>".join(constraints)
                        f.write(
                            # f"| {idx + 1} "
                            f"| {item.column_header} "
                            f"| {item.column_structure.lower().replace('_', ' ')} "
                            f"| {constraints_str} "
                            # f"| {item.required} "
                            # f"| {item.min_length if item.min_length is not None and item.min_length > 0 else '-'} "
                            # f"| {item.max_length if item.max_length is not None and item.max_length > 0 else '-'} "
                            f"| {item.description if item.description else ''} "
                            f"| {'<br/>'.join(item.examples) if item.examples else ''} "
                            # f"| {controlled_terms} "
                            # f"| {str(item.default_value) if item.default_value is not None else ''}"
                            "|\n"
                        )

                    template_path.parent.mkdir(parents=True, exist_ok=True)
                    with template_path.open("w") as fw:
                        fw.write("\t".join([x[0] for x in template_headers]))
                        fw.write("\n")
                        fw.write("\t".join([x[1] for x in template_headers]))
                        fw.write("\n")
                    zip_file(str(template_path), str(zip_template_path))


def create_control_and_template_pages(template_settings: models.TemplateSettings):
    maf_file_templates = get_templates("assignmentFileHeaderTemplates")
    maf_common_fields = {"__default__": "Common", "Unit": "Unit"}
    maf_controls = get_controls("assignmentFileControls", maf_common_fields)

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
    maf_file_templates = get_templates("assignmentFileHeaderTemplates")

    docs_path = Path("docs")
    control_lists_root_path = Path("prioritised-control-lists")

    create_control_list_documentation(
        assay_controls,
        assay_file_templates,
        "Assay File",
        docs_path / control_lists_root_path,
        list(assay_common_fields.values()),
        template_settings=template_settings,
    )
    create_control_list_documentation(
        sample_controls,
        sample_file_templates,
        "Sample File",
        docs_path / control_lists_root_path,
        list(sample_common_fields.values()),
        template_settings=template_settings,
    )
    create_control_list_documentation(
        maf_controls,
        maf_file_templates,
        "MAF File",
        docs_path / control_lists_root_path,
        list(maf_common_fields.values()),
        template_settings=template_settings,
    )

    investigation_fields = [
        x for x in investigation_controls.keys() if x not in investigation_common_fields
    ]
    for version in template_settings.active_template_versions:
        template = template_settings.versions.get(version)
        for template_name in template.active_investigation_file_templates:
            target_root_path = (
                docs_path
                / control_lists_root_path
                / Path(f"investigation-file-control-lists/{template_name}")
            )
            target_root_path.mkdir(parents=True, exist_ok=True)
            target_path = target_root_path / Path(f"{template_name}-v{version}.md")
            create_md_file(
                investigation_controls,
                "Investigation File",
                list(investigation_common_fields.values()),
                template_name,
                investigation_fields,
                version,
                target_path,
                template_settings,
            )
    create_file_structure_documentation(
        assay_file_templates,
        sample_file_templates,
        maf_file_templates,
        assay_controls,
        sample_controls,
        control_lists_root_path,
        template_settings,
    )


if __name__ == "__main__":
    template_settings = get_template_settings()
    create_control_and_template_pages(template_settings)
