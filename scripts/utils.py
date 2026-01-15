import datetime
import json
import re
import zipfile
from pathlib import Path
from typing import Union

import httpx
import pandas as pd

from scripts.models import OntologyTerm

FIXED_DATE_TIME = (2025, 1, 1, 0, 0, 0)


def zip_file(input_path, zip_path):
    zip_path = Path(zip_path)
    input_path = Path(input_path)
    zi = zipfile.ZipInfo(input_path.name)
    zi.date_time = FIXED_DATE_TIME
    zi.compress_type = zipfile.ZIP_DEFLATED
    zi.external_attr = 0o644 << 16
    content = input_path.read_bytes()
    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as z:
        z.writestr(zi, content)
    return zip_path


class DateEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime.datetime):
            return obj.isoformat()
        return super().default(obj)


def read_excel_rows(file_path, sheet_name="Sheet1"):
    try:
        # Read the Excel file
        df = pd.read_excel(file_path, sheet_name=sheet_name)
        return df

    except Exception as e:
        print(f"Error reading Excel file: {e}")
        return None


def escape(text: str) -> str:
    if not text:
        return ""
    # Characters with special meaning in Markdown
    md_chars = r"\`*_{}[]()#+-.!|"
    # Escape each character with a backslash
    return re.sub(f"([{re.escape(md_chars)}])", r"\\\1", text)


def read_rules_from_excel(
    file_path: str = "MetaboLights-Validations-v2.0.xlsx",
    sheet_names: Union[None, list[str]] = None,
) -> dict[str, pd.Series]:
    if not sheet_names:
        sheet_names = [
            "Input",
            "InvestigationFile",
            "SampleFile",
            "AssayFile",
            "AssignmentFile",
            "DataFiles",
            "Summary",
        ]

    df: Union[pd.DataFrame, None] = None
    for sheet in sheet_names:
        selected_rows = read_excel_rows(file_path, sheet_name=sheet)

        if df is None:
            df = selected_rows
        else:
            df = pd.concat([df, selected_rows], ignore_index=True)

    rules: dict[str, pd.Series] = {}
    if df is None:
        return rules
    df.reindex()
    df = df.fillna("")
    df = df[
        [
            "PHASE",
            "LEVEL",
            "SOURCE",
            "SECTION",
            "SOURCE_COLUMNS",
            "RULE_ID",
            "TYPE",
            "PRIORITY",
            "TITLE",
            "DESCRIPTION",
        ]
    ]
    if df is not None:
        for _, row in df.iterrows():
            rules[row.iloc[5]] = row
    return rules


def get_unit_test_names_methods(
    file_path: str = "MetaboLights-Validations-v2.0.xlsx",
    sheet_names: Union[None, list[str]] = None,
) -> dict[str, pd.Series]:
    if not sheet_names:
        sheet_names = [
            "Input",
            "InvestigationFile",
            "SampleFile",
            "AssayFile",
            "AssignmentFile",
            "DataFiles",
            "Summary",
        ]

    df: Union[pd.DataFrame, None] = None
    for sheet in sheet_names:
        selected_rows = read_excel_rows(file_path, sheet_name=sheet)

        if df is None:
            df = selected_rows
        else:
            df = pd.concat([df, selected_rows], ignore_index=True)
    rules: dict[str, pd.Series] = {}
    if df is None:
        return rules
    df.reindex()
    df = df.fillna("")
    df = df[
        [
            "PHASE",
            "LEVEL",
            "SOURCE",
            "SECTION",
            "SOURCE_COLUMNS",
            "RULE_ID",
            "TYPE",
            "PRIORITY",
            "TITLE",
            "DESCRIPTION",
        ]
    ]
    if df is not None:
        for _, row in df.iterrows():
            rules[row.iloc[5]] = row
    return rules


def search_ols_term(
    keyword: str,
    ontology_filter: None | list[str] = None,
    exact_match_only: bool = True,
    query_fields: None | list[str] = None,
    field_list: None | list[str] = None,
) -> None | OntologyTerm:
    size = 100
    url = "https://www.ebi.ac.uk/ols4/api/search"
    if not query_fields:
        query_fields_str = "label"
    else:
        query_fields_str = ",".join(query_fields)
    if not field_list:
        field_list = [
            "iri",
            "label",
            "ontology_prefix",
            "obo_id",
            "description",
            "type",
            "synonym",
        ]
    params = {
        "q": keyword,
        "fieldList": ",".join(field_list),
        "queryFields": query_fields_str,
        "exact": exact_match_only,
        "obsoletes": False,
        "rows": size,
        "format": "json",
        "lang": "en",
        "type": "class,individual",
    }

    params.update({"start": 0})
    params.update({"ontology": ",".join([x.lower() for x in ontology_filter if x])})
    headers = {"Accept": "application/json"}

    try:
        response = httpx.get(
            url,
            params=params,
            headers=headers,
            timeout=10,
            follow_redirects=True,
        )
        response.raise_for_status()
        result_data = response.json()
        docs = result_data.get("response", {}).get("docs", [])
        if docs:
            # return docs[0].get("iri", None)
            return OntologyTerm(
                term=docs[0].get("label", ""),
                term_source_ref=docs[0].get("ontology_prefix", "") or "",
                term_accession_number=docs[0].get("iri", "") or "",
            )
        return None

    except Exception as ex:
        print(
            f"Ontology search error for [{keyword}, {','.join(ontology_filter)}]: {ex}"
        )


if __name__ == "__main__":
    result = search_ols_term("Mus musculus", ontology_filter=["NCBITaxon"])
    print(result)
