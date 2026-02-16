import json
import logging
import re
from pathlib import Path
from typing import Any, OrderedDict

import httpx
import jsonschema
from pydantic import BaseModel

from scripts import models as models
from scripts.utils import DateEncoder

logger = logging.getLogger(__name__)


class IsaTableFileTemplates(BaseModel):
    data: dict[str, list[models.IsaTableFileTemplate]] = {}


class IsaInvestigationFileTemplates(BaseModel):
    data: dict[str, list[models.InvestigationFileTemplate]] = {}


class StudyProtocolTemplateData(BaseModel):
    data: dict[str, list[models.StudyProtocolTemplate]] = {}


class OntologySourceReferences(models.StudyBaseModel):
    ontology_source_reference_templates: dict[
        str, models.OntologySourceReferenceTemplate
    ] = {}
    other_source_reference_templates: dict[
        str, models.OntologySourceReferenceTemplate
    ] = {}


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
                    counter = 0
                    for header in data.headers:
                        if header.default_column_index != counter:
                            logger.warning(
                                "Default column index %s"
                                " is not equal to expected %s in file %s "
                                "for header %s. It will be updated to %s.",
                                header.default_column_index,
                                counter,
                                file,
                                header.column_header,
                                counter,
                            )
                        header.default_column_index = counter

                        if header.column_structure == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY":
                            counter += 4
                        elif header.column_structure == "ONTOLOGY_COLUMN":
                            counter += 3
                        elif header.column_structure == "SINGLE_COLUMN":
                            counter += 1
                        else:
                            raise ValueError(
                                f"Unknown column structure {header.column_structure} in file {file}"
                            )

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
                protocols_set = set(data.protocols)
                definitions_set = set(data.protocol_definitions.keys())
                if len(protocols_set.union(definitions_set)) != len(protocols_set):
                    raise ValueError(file.name, protocols_set, definitions_set)
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

    schema = OntologySourceReferences.model_json_schema(by_alias=True)
    json_file = "validation/metabolights/validation/v2/templates/ontologySourceReferenceTemplates.json"
    file = Path(json_file)
    file_content: dict[str, Any] = json.loads(file.read_text())
    jsonschema.validate(file_content, schema)

    refs = OntologySourceReferences.model_validate(file_content, by_alias=True)
    ols_ontologies = fetch_ols_ontologies()
    if ols_ontologies:
        for key, value in ols_ontologies.ontology_source_reference_templates.items():
            refs.ontology_source_reference_templates[key] = value
    ordered_dict = OrderedDict()
    ontology_list = [k for k in refs.ontology_source_reference_templates.keys()]
    ontology_list.extend([k for k in refs.other_source_reference_templates.keys()])
    ontology_list.sort()
    for item in ontology_list:
        if item in refs.ontology_source_reference_templates:
            ordered_dict[item] = refs.ontology_source_reference_templates[item]
        else:
            ordered_dict[item] = refs.other_source_reference_templates[item]

    refs.ontology_source_reference_templates = ordered_dict
    file_obj = refs.model_dump(by_alias=True)
    with file.open("w") as f:
        json.dump(
            refs.model_dump(by_alias=True),
            f,
            indent=4,
            cls=DateEncoder,
        )


def fetch_ols_ontologies() -> None | OntologySourceReferences:
    params = {"lang": "en", "size": 10000}
    headers = {"accept": "application/json"}
    url = "https://www.ebi.ac.uk/ols4/api/ontologies"
    refs = OntologySourceReferences()
    try:
        response = httpx.get(url, params=params, headers=headers)
        json_data = response.json()
        ontologies = json_data.get("_embedded", {}).get("ontologies")
        ontology_configs = [x.get("config", {}) for x in ontologies]
        for ontology in ontology_configs:
            prefix = ontology.get("preferredPrefix", "") or ""
            namespace = ontology.get("namespace", "") or ""
            title = ontology.get("title", "") or ""
            file_location = ontology.get("fileLocation", "") or ""
            file_location = file_location if file_location.startswith("http") else ""
            iri = ontology.get("versionIri", "") or ""
            description = ontology.get("description", "") or ""
            version = ontology.get("version", "") or ""
            source_name = prefix or namespace.upper()
            if not prefix:
                logger.warning(
                    "OLS ontology has no preferred prefix for namespace %s. "
                    "Uppercase version of namespace '%s' will be used.",
                    namespace,
                    namespace.upper(),
                )
            match = re.match(r"[A-Za-z0-9_-]+", source_name)
            if not match:
                logger.warning(
                    "OLS ontology source name has an expected name. "
                    "This ontology source will be ignored.",
                    namespace.upper(),
                )
                continue
            refs.ontology_source_reference_templates[source_name] = (
                models.OntologySourceReferenceTemplate(
                    source_name=source_name,
                    source_file=file_location or iri,
                    source_version=str(version),
                    source_description=title,
                    source_details=description,
                )
            )
        return refs
    except Exception as ex:
        logger.error("Ontologies are not fetched from OLS: %s", ex)
    return None


if __name__ == "__main__":
    update_template_json_files()
