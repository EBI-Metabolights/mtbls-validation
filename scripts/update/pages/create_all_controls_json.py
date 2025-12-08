import json
from pathlib import Path

from pydantic.alias_generators import to_snake

from scripts import models as models


def create_all_controls_json():
    control_folder = "validation/metabolights/validation/v2/controls"
    files = Path(control_folder).rglob("*.json")
    controls = models.ValidationControls()
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

    controls_json = controls.model_dump_json(by_alias=True, indent=4)

    Path("docs/json").mkdir(exist_ok=True, parents=True)
    Path("docs/json/all_controls.json").write_text(controls_json)


if __name__ == "__main__":
    create_all_controls_json()
