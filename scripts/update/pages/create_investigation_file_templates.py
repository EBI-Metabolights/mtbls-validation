from pathlib import Path

from scripts.update.pages.utils import get_investigation_file_templates
from scripts.utils import zip_file


def create_investigation_file_templates():
    templates = get_investigation_file_templates()
    for name, template_list in templates.items():
        target_root_path = Path(f"docs/template-files/investigation-file/{name}")
        target_root_path.mkdir(parents=True, exist_ok=True)
        for template in template_list:
            rows = []
            for section in template.sections:
                rows.append(f"{section.name}")
                if section.fields:
                    rows.extend(
                        [
                            f"{x}\t{section.default_field_values.get(x, '')}"
                            for x in section.fields
                        ]
                    )
                if section.default_comments:
                    rows.extend(
                        [
                            f"{x}\t{section.default_comment_values.get(x, '')}"
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
