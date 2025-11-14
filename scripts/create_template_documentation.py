import json
from pathlib import Path
from typing import Any, OrderedDict, Tuple, Union

from pydantic import BaseModel


class OntologyTerm(BaseModel):
    source_ref: str = ""
    term_accession: str = ""
    term: str = ""


def create_recommended_assay_control_lists() -> OrderedDict[
    str, OrderedDict[str, list[OntologyTerm]]
]:
    templates_path = "validation/metabolights/validation/v2/controlLists/assayColumns"
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
            control_list = file_content[name]["terms"]
            terms = [
                OntologyTerm(
                    term=x["term"],
                    source_ref=x["termSourceRef"],
                    term_accession=x["termAccessionNumber"],
                )
                for x in control_list
            ]
            terms.sort(key=lambda x: x.term + x.source_ref)
            recommended_terms[name] = terms
            column_attributes[name] = (
                file_content[name]["ontologies"],
                file_content[name]["additionalOntologies"],
                file_content[name]["additionalTerms"],
            )

        fw.write(f"# {title} Prioritised Control Lists Terms\n")
        sorted_fields = [(key, value) for key, value in recommended_terms.items()]
        sorted_fields.sort(key=lambda x: x[0])

        for name, terms in sorted_fields:
            fw.write(f"\n### {name}\n\n")
            fw.write("\n#### Configuration \n\n")
            fw.write(
                "| Parameter | Value  |\n"
                "|--------|--------|\n"
                f"| Prioritised Ontologies | {', '.join(column_attributes[name][0])}|\n"
                f"| Additional Ontologies Allowed | {column_attributes[name][1]}|\n"
                f"| Additional Terms Allowed | {column_attributes[name][2]}|\n"
                "\n"
            )

            fw.write("\n#### Terms \n\n")
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
    assay_controlled_terms: OrderedDict[str, OrderedDict[str, list[OntologyTerm]]],
    sample_controlled_terms: OrderedDict[str, list[OntologyTerm]],
):
    templates_path = "validation/metabolights/validation/v2/templates"
    sample_file_templates = [
        str(x)
        for x in Path(f"{templates_path}/sampleFileHeaderTemplates").rglob("*.json")
    ]
    assay_file_templates = [
        str(x)
        for x in Path(f"{templates_path}/assayFileHeaderTemplates").rglob("*.json")
    ]
    assignment_file_templates = [
        str(x)
        for x in Path(f"{templates_path}/assignmentFileHeaderTemplates").rglob("*.json")
    ]

    pairs = [
        (sample_file_templates, "sample-file-structure"),
        (assay_file_templates, "assay-file-structure"),
        (assignment_file_templates, "maf-file-structure"),
    ]
    for file_paths, folder in pairs:
        for file in file_paths:
            file_path = Path(file)
            with file_path.open() as f:
                file_content = json.load(f)

            for name, templates in file_content.items():
                parent_folder = folder.removesuffix("-structure")
                for template in templates:
                    version = template.get("version", "default")
                    headers = template.get("headers", [])
                    doc_file_name = (
                        f"{parent_folder}-{name}-{version.replace('.', '_')}.md"
                    )
                    target_path = Path(
                        f"docs/file-structures/{folder}/{version.replace('.', '_')}/{doc_file_name}"
                    )
                    template_headers: list[tuple[str, str]] = []
                    target_path.parent.mkdir(parents=True, exist_ok=True)
                    template_file_name = ""
                    with target_path.open("w") as f:
                        if folder == "maf-file-structure":
                            header = f"MAF File Default Structure for {name} Assay v{version}"
                            template_file_name = f"maf-file/{version.replace('.', '_')}/m_template-{name}-{version.replace('.', '_')}_metabolite_profiling_v2_maf.tsv"

                        elif folder == "sample-file-structure":
                            header = f"{name} Sample File Default Structure v{version}"
                            template_file_name = f"sample-file/{version.replace('.', '_')}/s_template-{name}-{version.replace('.', '_')}.txt"
                        else:
                            header = f"{name} Assay File Default Structure v{version}"
                            template_file_name = f"assay-file/{version.replace('.', '_')}/a_template-{name}-{version.replace('.', '_')}-metabolite_profiling.txt"
                        f.write(f"# {header}\n\n")
                        f.write(
                            "| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |\n"
                            "|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|\n"
                        )
                        for idx, item in enumerate(headers):
                            header = item["columnHeader"]

                            template_headers.append(
                                (
                                    header,
                                    item["defaultValue"]
                                    if "defaultValue" in item and item["defaultValue"]
                                    else "",
                                )
                            )
                            if "columnStructure" in item:
                                if item["columnStructure"] == "ONTOLOGY_COLUMN":
                                    template_headers.append(("Term Source REF", ""))
                                    template_headers.append(
                                        ("Term Accession Number", "")
                                    )
                                elif (
                                    item["columnStructure"]
                                    == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"
                                ):
                                    template_headers.append(("Unit", ""))
                                    template_headers.append(("Term Source REF", ""))
                                    template_headers.append(
                                        ("Term Accession Number", "")
                                    )

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
                            controlled_terms = f"[Controlled Terms](../../../docs/prioritised-control-lists/{control_list_folder}/{version.replace('.', '_')}/{doc_file_name}#{link})"

                            f.write(
                                f"| {idx + 1} "
                                f"| {item['columnHeader']} "
                                f"| {item['columnStructure'].lower().replace('_', ' ')} "
                                f"| {item['required']} "
                                f"| {item['minLength'] if item['minLength'] > 0 else '-'} "
                                f"| {item['maxLength'] if item['maxLength'] > 0 else '-'} "
                                f"| {item['description'] if 'description' in item else ''} "
                                f"| {', '.join(item['examples']) if 'examples' in item else ''} "
                                f"| {controlled_terms} "
                                f"| {item['defaultValue'] if item['defaultValue'] else ''}"
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
    assay_controlled_terms = create_recommended_assay_control_lists()

    templates_path = (
        "validation/metabolights/validation/v2/controlLists/investigationFile"
    )
    file_name = "investigation-file"
    title = "Investigation File"
    create_recommended_control_lists(
        templates_path=templates_path, file_name=file_name, title=title
    )
    templates_path = "validation/metabolights/validation/v2/controlLists/sampleColumns"
    file_name = "sample-file"
    title = "Sample File"
    sample_controlled_terms = create_recommended_control_lists(
        templates_path=templates_path, file_name=file_name, title=title
    )

    templates_path = "validation/metabolights/validation/v2/controlLists/unitColumns"
    file_name = "unit-columns"
    title = "Unit Columns"
    create_recommended_control_lists(
        templates_path=templates_path, file_name=file_name, title=title
    )

    create_file_structure_documentation(
        assay_controlled_terms=assay_controlled_terms,
        sample_controlled_terms=sample_controlled_terms,
    )
