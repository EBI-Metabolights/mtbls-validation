import json
from pathlib import Path
from pydantic.alias_generators import to_snake
from scripts import control_list_models as models

if __name__ == "__main__":
    control_folder = "validation/metabolights/validation/v2/controls"
    files = Path(control_folder).rglob("*.json")
    validation_configuration = models.ValidationConfiguration()
    controls = models.ValidationControls()
    validation_configuration.controls = controls
    for file in files:
        name = file.parent.name
        camel_case_name = to_snake(name)
        if not hasattr(controls, camel_case_name):
            continue
        controls_dict = getattr(controls, camel_case_name)
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            controls_dict[key] = []
            for x in input_data:
                controls_dict[key].append(models.FieldValueValidation.model_validate(x))
    template_folder = "validation/metabolights/validation/v2/templates"

    files = Path(template_folder).rglob("*.json")
    templates = models.FileTemplates()
    validation_configuration.templates = templates
    for file in files:
        name = file.parent.name
        if to_snake(file.name).startswith("ontology_source_reference_templates"):
            file_content = json.loads(file.read_text())
            key = file.stem
            reference_templates = {
                k: models.OntologySourceReferenceTemplate.model_validate(v, by_alias=True)
                for k, v in file_content.get(key, {}).items()
            }
            templates.ontology_source_reference_templates = reference_templates
            continue
        camel_case_name = to_snake(name)
        if not hasattr(templates, camel_case_name):
            continue

        if any([x for x in ["assay", "sample", "assignment"] if name.startswith(x)]):
            base_type: type[models.StudyBaseModel] = models.IsaTableFileTemplate
        elif name.startswith("protocol"):
            base_type: type[models.StudyBaseModel] = models.StudyProtocolTemplate

        templates_dict: dict[str, list[base_type]] = getattr(templates, camel_case_name)
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            templates_dict[key] = []
            for x in input_data:
                templates_dict[key].append(base_type.model_validate(x))

    all_controls = validation_configuration.model_dump_json(by_alias=True, indent=4)

    Path("x_all_controls.json").write_text(all_controls)

    pass
