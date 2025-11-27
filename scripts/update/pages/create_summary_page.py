from pathlib import Path

from scripts import models
from scripts.models import IsaTableFileTemplate
from scripts.update.pages.utils import (
    get_controls,
    get_investigation_file_templates,
    get_template_settings,
    get_templates,
)


def create_index_md_file(template_settings: models.TemplateSettings):
    assay_common_fields = {"__default__": "Default for All Fields", "Unit": "Unit"}

    assay_controls = get_controls("assayFileControls", assay_common_fields)
    investigation_common_fields = {"__default__": "Common", "Unit": "Unit"}
    investigation_controls = get_controls(
        "investigationFileControls", investigation_common_fields
    )
    investigation_file_templates = get_investigation_file_templates()
    assay_file_templates = get_templates("assayFileHeaderTemplates")
    sample_file_templates = get_templates("sampleFileHeaderTemplates")
    sample_common_fields: dict[str, str] = {
        "__default__": "Common",
        "__default_factor_value__": "Factor Value (Common)",
        "__default_characteristic__": "Characteristic (Common)",
        "Unit": "Unit",
    }
    sample_controls = get_controls("sampleFileControls", sample_common_fields)
    maf_file_templates = get_templates("assignmentFileHeaderTemplates")

    def assay_filename_fn(template_name, version):
        return f"a_template-{template_name}-metabolite_profiling-v{version}.txt"

    def maf_filename_fn(template_name, version):
        return f"m_template-{template_name}-v{version}_metabolite_profiling_v2_maf.tsv"

    def sample_filename_fn(template_name, version):
        return f"s_template-{template_name}-v{version}.txt"

    def investigation_filename_fn(template_name, version):
        return f"i_Investigation-{template_name}-v{version}.txt"

    summary_file = Path("docs/index.md")
    with summary_file.open("w") as f:
        f.write("# MetaboLights Validation Framework\n\n")

        f.write(
            "Download the latest [MetaboLights Validation OPA bundle](bundle.tar.gz)\n\n"
        )
        f.write(
            "Download the latest [Validation rules as JSON](json/all_rules.json)\n\n"
        )
        f.write("Download the latest [Controls as JSON](json/all_controls.json)\n\n")
        f.write("Download the latest [Templates as JSON](json/all_templates.json)\n\n")

        for (
            file_type,
            file_type_short,
            templates,
            controls,
            template_filename_fn,
        ) in [
            (
                "Investigation File",
                "investigation-file",
                investigation_file_templates,
                investigation_controls,
                investigation_filename_fn,
            ),
            (
                "Sample File",
                "sample-file",
                sample_file_templates,
                sample_controls,
                sample_filename_fn,
            ),
            (
                "Assay File",
                "assay-file",
                assay_file_templates,
                assay_controls,
                assay_filename_fn,
            ),
            (
                "Metabolite (MAF) File",
                "maf-file",
                maf_file_templates,
                {},
                maf_filename_fn,
            ),
        ]:
            f.write(f"## {file_type} Templates & Controls \n\n")
            v1_table = []
            v2_table = []
            v1_table.append(f"{file_type} Templates & Controls v1.0\n\n")
            v1_table.append(
                "| Template Name | File Structure | Template File | Controls |\n"
            )
            v1_table.append(
                "|-------------|--------------|--------------|--------------|\n"
            )
            v2_table.append(f"{file_type} Templates & Controls v2.0\n\n")
            v2_table.append(
                "| Template Name | File Structure | Template File | Controls |\n"
            )
            v2_table.append(
                "|-------------|--------------|--------------|--------------|\n"
            )

            root_path = Path("prioritised-control-lists") / Path(
                f"{file_type_short}-control-lists"
            )
            structure_root_path = Path("file-structures") / Path(
                f"{file_type_short}-structure"
            )
            template_root_path = Path("template-files") / Path(file_type_short)
            blank_link = '{:target="_blank"}'
            items = [(k, v) for k, v in templates.items()]
            items.sort(key=lambda x: [x[0]])
            for template_name, template_list in items:
                control_url_base = root_path / Path(template_name)
                structure_url_base = structure_root_path / Path(template_name)
                template_url_base = template_root_path / Path(template_name)
                links = []
                file_structures = []
                file_templates_zip = []
                file_templates_txt = []
                for template in template_list:
                    links.append(
                        f"[{template_name}-v{template.version} Control]"
                        f"({control_url_base}/{template_name}-v{template.version}.md)"
                    )
                    file_structures.append(
                        f"[{template_name}-v{template.version} Structure]"
                        f"({structure_url_base}/{file_type_short}-{template_name}-v{template.version}.md)"
                    )
                    file_templates_txt.append(
                        f"[{template_name}-v{template.version} Template (txt)]"
                        f"({template_url_base}/{template_filename_fn(template_name, template.version)}){blank_link}"
                    )
                    file_templates_zip.append(
                        f"[{template_name}-v{template.version} Template (zip)]"
                        f"({template_url_base}/{template_filename_fn(template_name, template.version)}.zip){blank_link}"
                    )

                v1_table.append(
                    "|".join(
                        [
                            template_name,
                            file_structures[0]
                            if isinstance(template, IsaTableFileTemplate)
                            else "-",
                            f"{file_templates_zip[0]}<br/>{file_templates_txt[0]}",
                            links[0] if controls else "-",
                        ]
                    )
                    + "\n"
                )
                v2_table.append(
                    "|".join(
                        [
                            template_name,
                            file_structures[1]
                            if isinstance(template, IsaTableFileTemplate)
                            else "-",
                            f"{file_templates_zip[1]}<br/>{file_templates_txt[1]}",
                            links[1] if controls else "-",
                        ]
                    )
                    + "\n"
                )
            v1_table.append("\n")
            v2_table.append("\n")
            if "1.0" in template_settings.active_template_versions:
                f.writelines(v1_table)
            if "2.0" in template_settings.active_template_versions:
                f.writelines(v2_table)


if __name__ == "__main__":
    template_settings = get_template_settings()
    create_index_md_file(template_settings)
