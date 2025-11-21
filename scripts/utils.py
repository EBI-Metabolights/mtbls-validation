from typing import Union
import pandas as pd


def read_excel_rows(file_path, sheet_name="Sheet1"):
    try:
        # Read the Excel file
        df = pd.read_excel(file_path, sheet_name=sheet_name)
        return df

    except Exception as e:
        print(f"Error reading Excel file: {e}")
        return None


def get_rules(
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


def get_unit_tests_methods(
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
