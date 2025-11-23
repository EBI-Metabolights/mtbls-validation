import json
import pathlib

import jsonschema
from metabolights_utils.models.metabolights import get_study_model_schema, model

from scripts.update.test_data.files.assay_01 import assay_file
from scripts.update.test_data.files.assignment_01 import assignment_file
from scripts.update.test_data.files.investigation_01 import investigation_file
from scripts.update.test_data.files.sample_01 import sample_file

minimum_01 = model.MetabolightsStudyModel(
    investigation_file_path="i_Investigation.txt",
    investigation=investigation_file,
    samples={
        sample_file.file_path: sample_file,
    },
    assays={
        assay_file.file_path: assay_file,
    },
    metabolite_assignments={assignment_file.file_path: assignment_file},
    study_db_metadata=model.StudyDBMetadata(
        study_id="REQ2025111188888",
        submission_date="2025-10-10",
        first_public_date="2025-11-11",
        status=model.StudyStatus.SUBMITTED,
        curation_request=model.CurationRequest.NO_CURATION,
        reserved_submission_id="REQ2025111188888",
        template_version="1.0",
        study_category=model.StudyCategory.OTHER,
        sample_template="minimum",
        created_at="2025-10-09",
    ),
    study_folder_metadata=model.StudyFolderMetadata(
        files={
            sample_file.file_path: model.StudyFileDescriptor(
                file_path=sample_file.file_path,
                base_name=sample_file.file_path,
                parent_directory="",
                extension=".txt",
                size_in_bytes=1000,
            ),
            assay_file.file_path: model.StudyFileDescriptor(
                file_path=assay_file.file_path,
                base_name=assay_file.file_path,
                parent_directory="",
                extension=".txt",
                size_in_bytes=1000,
            ),
            assignment_file.file_path: model.StudyFileDescriptor(
                file_path=assignment_file.file_path,
                base_name=assignment_file.file_path,
                parent_directory="",
                extension=".tsv",
                size_in_bytes=1000,
            ),
            "FILES/raw1.raw": model.StudyFileDescriptor(
                file_path="FILES/raw1.raw",
                base_name="raw1.raw",
                parent_directory="FILES",
                extension=".raw",
                size_in_bytes=1000,
            ),
            "FILES/raw2.raw": model.StudyFileDescriptor(
                file_path="FILES/raw2.raw",
                base_name="raw2.raw",
                parent_directory="FILES",
                extension=".raw",
                size_in_bytes=1000,
            ),
            "FILES/raw3raw": model.StudyFileDescriptor(
                file_path="FILES/raw3.raw",
                base_name="raw3.raw",
                parent_directory="FILES",
                extension=".raw",
                size_in_bytes=1000,
            ),
        }
    ),
    has_db_metadata=True,
    has_assay_table_data=True,
    has_assignment_table_data=True,
    has_folder_metadata=True,
    has_investigation_data=True,
    has_sample_table_data=True,
)
test_data_root_path = "validation/tests/data/inputs/"

empty_study = model.MetabolightsStudyModel()

schema = get_study_model_schema()

for file, file_path in [
    (empty_study, f"{test_data_root_path}/empty/empty.json"),
    (minimum_01, f"{test_data_root_path}/minimum_01/minimum_01.json"),
]:
    file_dict = file.model_dump(by_alias=True)
    jsonschema.validate(file_dict, schema)
    pathlib.Path(file_path).write_text(json.dumps(file_dict, indent=4))
