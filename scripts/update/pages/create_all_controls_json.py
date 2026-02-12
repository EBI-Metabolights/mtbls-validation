import json
from pathlib import Path

from pydantic.alias_generators import to_snake

from scripts import models as models


def create_all_controls_json():
    control_folder = "validation/metabolights/validation/v2/controls"
    files = Path(control_folder).rglob("*.json")
    controls = models.ValidationControls()
    rule_names: dict[str, list[str]] = {}
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
                field_validation = models.FieldValueValidation.model_validate(x)
                # for rule_name in .rule_name:
                # if field_validation.rule_name in rule_names:
                #     raise ValueError(
                #         f"Duplicate rule name {field_validation.rule_name} in {file}"
                #     )
                if field_validation.rule_name not in rule_names:
                    rule_names[field_validation.rule_name] = []
                rule_names[field_validation.rule_name].append(file)
                controls_dict[key].append(field_validation)
    error = False
    for rule_name, files in rule_names.items():
        if len(files) > 1:
            error = True
            print(f"Duplicate rule name {rule_name} in files: {files}")
    raise ValueError("Duplicate rule names found") if error else None
    controls_json = controls.model_dump_json(by_alias=True, indent=4)

    Path("docs/json").mkdir(exist_ok=True, parents=True)
    Path("docs/json/all_controls.json").write_text(controls_json)


if __name__ == "__main__":
    create_all_controls_json()
