## v2.2.2 (2026-10-15)

### Fix

- **missing-version-ci**: version information is not managed by cicd.

## v2.2.1 (2026-10-15)

### Feat

- new validation rule to check and find all unreferenced/ unexpected files in study folder

### Fix

- update created_at timestamps and enhance assay validation rules
- update version numbers and descriptions in JSON and markdown files
- update description for retention_time column in MS.json and all_templates.json
- update description for retention_time column in MS.json
- dependency update
- json schema error
- scope Column model controls to correct assay template types
- configuration updates
- unit test errors
- remove Column Type column name check
- column model for LC-MS v2
- mhd enabled control list for column type
- GC-MS parameter default values
- control list updates for mhd enabled studies
- cell-type descriptor update
- new validation error for publication abstract content
- convert orcid id and ror id optional
- configuration update
- schema error
- protocol description check
- performer and date columns will be ignored
- ontology term validation returns invalid format
- created_at field is added
- allowedPlaceholders
- add additional validation for any-ontology-term values
- DOI and pubmed id validation rule errors
- column order error is generated even if it is valid.
- json file renaming
- update validation schema to v1.1
- do not allow derived files not in mtbls list if raw file is not defined
- raw and derived file extension updates
- rule_f_400_090_002_01 will filter empty rows
- study status is updated: PROVISIONAL, PRIVATE states are now valid.
- README file table layout update
- rule_f_400_100_001_02 ser fid and acqus files are exception now.
- Sample Name and Source Name columns are required (Min Length is 3). Ion source and Mass analyzer parameters are optional for FS-MS. At least two factor value is required in sample sheet. FIA-MS column template fix

### Refactor

- sample file templates and metadata file versioning.
