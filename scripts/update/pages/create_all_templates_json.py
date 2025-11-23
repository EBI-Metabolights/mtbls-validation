import json
from pathlib import Path

from pydantic.alias_generators import to_snake

from scripts import models as models


def create_all_templates_json():
    template_folder = "validation/metabolights/validation/v2/templates"

    files = Path(template_folder).rglob("*.json")
    templates = models.FileTemplates()
    for file in files:
        name = file.parent.name
        if to_snake(file.name).startswith("ontology_source_reference_templates"):
            file_content = json.loads(file.read_text())
            key = file.stem
            reference_templates = {
                k: models.OntologySourceReferenceTemplate.model_validate(
                    v, by_alias=True
                )
                for k, v in file_content.get(key, {}).items()
            }
            templates.ontology_source_reference_templates = reference_templates
            continue

        camel_case_name = to_snake(name)
        if not hasattr(templates, camel_case_name):
            continue

        if any([x for x in ["assay", "sample", "assignment"] if name.startswith(x)]):
            base_type: type[models.StudyBaseModel] = models.IsaTableFileTemplate
        elif name.startswith("investigation"):
            base_type: type[models.StudyBaseModel] = models.InvestigationFileTemplate
        elif name.startswith("protocol"):
            base_type: type[models.StudyBaseModel] = models.StudyProtocolTemplate

        templates_dict: dict[str, list[base_type]] = getattr(templates, camel_case_name)
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            templates_dict[key] = []
            for x in input_data:
                templates_dict[key].append(base_type.model_validate(x))

    templates_json = templates.model_dump_json(by_alias=True, indent=4)
    Path("docs/json").mkdir(exist_ok=True, parents=True)
    Path("docs/json/all_templates.json").write_text(templates_json)


if __name__ == "__main__":
    create_all_templates_json()
