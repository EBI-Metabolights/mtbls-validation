import json
from pathlib import Path

import jsonschema

from scripts import models as models


def get_controls(subfolder: str, key_labels: None | dict[str, str] = None):
    if not key_labels:
        key_labels = {}
    control_schema = models.FieldValueValidation.model_json_schema(by_alias=True)
    control_folder = f"validation/metabolights/validation/v2/controls/{subfolder}"
    files = Path(control_folder).rglob("*.json")
    controls: dict[str, list[models.FieldValueValidation]] = {}

    for file in files:
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            label = key_labels.get(key) or key
            controls[label] = []
            for x in input_data:
                jsonschema.validate(x, control_schema)
                data = models.FieldValueValidation.model_validate(x, by_alias=True)
                controls[label].append(data)

    return controls


def get_templates(subfolder: str, key_labels: None | dict[str, str] = None):
    if not key_labels:
        key_labels = {}
    schema = models.IsaTableFileTemplate.model_json_schema(by_alias=True)
    control_folder = f"validation/metabolights/validation/v2/templates/{subfolder}"
    files = Path(control_folder).rglob("*.json")
    templates: dict[str, list[models.IsaTableFileTemplate]] = {}

    for file in files:
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            label = key_labels.get(key) or key
            templates[label] = []
            for x in input_data:
                jsonschema.validate(x, schema)
                data = models.IsaTableFileTemplate.model_validate(x, by_alias=True)
                templates[label].append(data)

    return templates


def get_investigation_file_templates(key_labels: None | dict[str, str] = None):
    if not key_labels:
        key_labels = {}
    schema = models.InvestigationFileTemplate.model_json_schema(by_alias=True)
    control_folder = (
        "validation/metabolights/validation/v2/templates/investigationFileTemplates"
    )
    files = Path(control_folder).rglob("*.json")
    templates: dict[str, list[models.InvestigationFileTemplate]] = {}

    for file in files:
        file_content = json.loads(file.read_text())
        for key, input_data in file_content.items():
            label = key_labels.get(key) or key
            templates[label] = []
            for x in input_data:
                jsonschema.validate(x, schema)
                data = models.InvestigationFileTemplate.model_validate(x, by_alias=True)
                templates[label].append(data)

    return templates


def find_rule(
    control_list: list[models.FieldValueValidation],
    template_name: str,
    template_version: str,
):
    for control in control_list:
        names = control.selection_criteria.isa_file_template_name_filter
        versions = control.selection_criteria.isa_file_template_name_filter
        in_filter = all(
            [
                not names or any([True for x in names if x == template_name]),
                not versions or any([True for x in versions if x == template_version]),
            ]
        )
        return control if in_filter else None
