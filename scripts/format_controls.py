from datetime import datetime
import json
from pathlib import Path
import re
from typing import Any, OrderedDict
from pydantic import BaseModel
from pydantic.alias_generators import to_snake
from scripts import control_list_models as models


class FileContent(BaseModel):
    data: dict[str, list[models.FieldValueValidation]] = {}


class DateEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.isoformat()
        return super().default(obj)


def update_controls():
    control_folder = "validation/metabolights/validation/v2/controls"
    files = Path(control_folder).rglob("*.json")
    controls = models.ValidationControls()
    for file in files:
        name = file.parent.name
        camel_case_name = to_snake(name)
        if not hasattr(controls, camel_case_name):
            continue
        file_content_data = FileContent()
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            file_content_data.data[key] = []
            for x in input_data:
                data = models.FieldValueValidation.model_validate(x, by_alias=True)
                parents = data.allowed_parent_ontology_terms
                if parents:
                    if parents.exclude_by_label_pattern:
                        for pattern in parents.exclude_by_label_pattern:
                            # raise error if not valid pattern format
                            re.match(pattern, "test")

                file_content_data.data[key].append(data)
        file_obj = file_content_data.model_dump(by_alias=True)

        with file.open("w") as f:
            json.dump(file_obj.get("data", ""), f, indent=4, cls=DateEncoder)


if __name__ == "__main__":
    update_controls()