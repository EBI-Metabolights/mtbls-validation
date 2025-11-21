from pathlib import Path
import re
import shutil


if __name__ == "__main__":
    tests_root_path = "validation/tests"

    templates_path = "validation/metabolights/validation/v2/controlLists/assayColumns"
    for x in list(Path(f"{tests_root_path}").rglob("*_test.rego")):
        lines = x.read_text().splitlines()
        if len(lines) > 1 and "# Unit tests for rule" in lines[1]:
            match = re.match(r".*Unit tests for (rule_.*).*", lines[1])
            if match:
                group = match.groups()[0]
                if not x.name.startswith(group):
                    new_path = x.parent / Path(f"{group}_test.rego")
                    shutil.move(x, new_path)
                    print(x, new_path)
