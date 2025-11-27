import json
from pathlib import Path

import jsonschema
from pydantic import BaseModel

from scripts import models as models
from scripts.utils import DateEncoder


class IsaTableFileTemplates(BaseModel):
    data: dict[str, list[models.IsaTableFileTemplate]] = {}


class IsaInvestigationFileTemplates(BaseModel):
    data: dict[str, list[models.InvestigationFileTemplate]] = {}


class StudyProtocolTemplateData(BaseModel):
    data: dict[str, list[models.StudyProtocolTemplate]] = {}


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

    schema = models.InvestigationFileTemplate.model_json_schema(by_alias=True)
    control_folder = (
        "validation/metabolights/validation/v2/templates/investigationFileTemplates"
    )
    files = Path(control_folder).rglob("*.json")
    for file in files:
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            file_content_data = IsaInvestigationFileTemplates()
            file_content_data.data[key] = []
            for x in input_data:
                jsonschema.validate(x, schema)
                data = models.InvestigationFileTemplate.model_validate(x, by_alias=True)
                file_content_data.data[key].append(data)

            file_obj = file_content_data.model_dump(by_alias=True)

            with file.open("w") as f:
                json.dump(file_obj.get("data", ""), f, indent=4, cls=DateEncoder)

    schema = models.StudyProtocolTemplate.model_json_schema(by_alias=True)
    control_folder = "validation/metabolights/validation/v2/templates/protocolTemplates"
    files = Path(control_folder).rglob("*.json")
    for file in files:
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            file_content_data = StudyProtocolTemplateData()
            file_content_data.data[key] = []
            for x in input_data:
                jsonschema.validate(x, schema)
                data = models.StudyProtocolTemplate.model_validate(x, by_alias=True)
                file_content_data.data[key].append(data)

            file_obj = file_content_data.model_dump(by_alias=True)

            with file.open("w") as f:
                json.dump(file_obj.get("data", ""), f, indent=4, cls=DateEncoder)

    schema = models.TemplateSettings.model_json_schema(by_alias=True)
    control_folder = "validation/metabolights/validation/v2/templates/configuration"
    files = Path(control_folder).rglob("*.json")
    for file in files:
        file_content = json.loads(file.read_text())
        try:
            jsonschema.validate(file_content, schema)
        except Exception as ex:
            raise ex
        data = models.TemplateSettings.model_validate(file_content, by_alias=True)

        file_obj = data.model_dump(by_alias=True)

        with file.open("w") as f:
            json.dump(file_obj, f, indent=4, cls=DateEncoder)


if __name__ == "__main__":
    update_template_json_files()
