import shutil
from pathlib import Path

from scripts.update.pages.utils import get_investigation_file_templates
from scripts.utils import zip_file


def serialize_investigation_value(value: str | list[str] | list[list[str]]):
    if not value:
        return ""
    if isinstance(value, str):
        return value.strip()
    if isinstance(value, list):
        vals = value
        if isinstance(value[0], list):
            vals = []
            for val in value:
                vals.append(";".join([str(x) if x else "" for x in val]))

        return "\t".join([str(x) if x else "" for x in vals])
    return str(value)


def create_investigation_file_templates():
    templates = get_investigation_file_templates()
    root_path = Path("docs/template-files/investigation-file")
    shutil.rmtree(root_path, ignore_errors=True)
    for name, template_list in templates.items():
        target_root_path = root_path / Path(name)
        target_root_path.mkdir(parents=True, exist_ok=True)

        for template in template_list:
            rows = []
            for section in template.sections:
                rows.append(f"{section.name}")
                field_values = section.default_field_values
                comment_values = section.default_comment_values
                if section.fields:
                    rows.extend(
                        [
                            f"{x}\t"
                            f"{serialize_investigation_value(field_values.get(x, ''))}"
                            for x in section.fields
                        ]
                    )
                if section.default_comments:
                    rows.extend(
                        [
                            f"Comment[{x}]\t"
                            f"{serialize_investigation_value(comment_values.get(x, ''))}"
                            for x in section.default_comments
                        ]
                    )

            file_path = target_root_path / Path(
                f"i_Investigation-{name}-v{template.version}.txt"
            )
            with file_path.open("w") as f:
                f.write("\n".join(rows))

            zip_file(str(file_path), str(file_path) + ".zip")


if __name__ == "__main__":
    create_investigation_file_templates()
