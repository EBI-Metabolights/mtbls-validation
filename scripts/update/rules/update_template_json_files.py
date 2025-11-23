import json
from pathlib import Path

import jsonschema
from pydantic import BaseModel

from scripts import models as models
from scripts.utils import DateEncoder


class IsaTableFileTemplates(BaseModel):
    data: dict[str, list[models.IsaTableFileTemplate]] = {}


def update_template_json_files():
    sub_folders = [
        "assayFileHeaderTemplates",
        "assignmentFileHeaderTemplates",
        "sampleFileHeaderTemplates",
    ]

    schema = models.IsaTableFileTemplate.model_json_schema(by_alias=True)
    for subfolder in sub_folders:
        control_folder = f"validation/metabolights/validation/v2/templates/{subfolder}"
        files = Path(control_folder).rglob("*.json")
        for file in files:
            file_content = json.loads(file.read_text())
            for key, input_data in file_content.items():
                file_content_data = IsaTableFileTemplates()
                file_content_data.data[key] = []
                for x in input_data:
                    jsonschema.validate(x, schema)
                    data = models.IsaTableFileTemplate.model_validate(x, by_alias=True)
                    file_content_data.data[key].append(data)

                file_obj = file_content_data.model_dump(by_alias=True)

                with file.open("w") as f:
                    json.dump(file_obj.get("data", ""), f, indent=4, cls=DateEncoder)


if __name__ == "__main__":
    update_template_json_files()
