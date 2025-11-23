import json
import re
from pathlib import Path

import jsonschema
from pydantic import BaseModel
from pydantic.alias_generators import to_snake

from scripts import models as models
from scripts.utils import DateEncoder


class FieldValueValidationFiles(BaseModel):
    data: dict[str, list[models.FieldValueValidation]] = {}


def update_control_list_json_files():
    control_schema = models.FieldValueValidation.model_json_schema(by_alias=True)
    control_folder = "validation/metabolights/validation/v2/controls"
    files = Path(control_folder).rglob("*.json")
    controls = models.ValidationControls()
    for file in files:
        name = file.parent.name
        camel_case_name = to_snake(name)
        if not hasattr(controls, camel_case_name):
            continue
        file_content_data = FieldValueValidationFiles()
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            file_content_data.data[key] = []
            for x in input_data:
                jsonschema.validate(x, control_schema)
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

        test_rules_folder = "validation/tests/data/inputs/rules"
        files = Path(test_rules_folder).rglob("*.json")
        for file in list(files):
            file_content = json.loads(file.read_text())
            jsonschema.validate(file_content, control_schema)
            data = models.FieldValueValidation.model_validate(
                file_content, by_alias=True
            )
            parents = data.allowed_parent_ontology_terms
            if parents:
                if parents.exclude_by_label_pattern:
                    for pattern in parents.exclude_by_label_pattern:
                        # raise error if not valid pattern format
                        re.match(pattern, "test")
            with file.open("w") as f:
                f.write(data.model_dump_json(indent=4, by_alias=True))


if __name__ == "__main__":
    update_control_list_json_files()
