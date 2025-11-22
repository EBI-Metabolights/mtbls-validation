package metabolights.validation.v2.rules.phase2.violations

import rego.v1

import data.metabolights.validation.v2.rules.phase1.definitions as def1
import data.metabolights.validation.v2.rules.phase2.definitions as def
import data.metabolights.validation.v2.utils.functions as f

# #########################################################################################################
# #########################################################################################################
# # SAMPLES SHEET GENERAL VALIDATION RULES
# #########################################################################################################
# #########################################################################################################

# METADATA
# title: Values with trailing or leading spaces in sample file.
# description: Values in sample file should not start or end with space characters.
# custom:
#  rule_id: rule_s_200_090_001_01
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_001_01 contains result if {
	some file_name, samples_sheet in input.samples
	some column_index, column_name in samples_sheet.table.columns
	some _, header in samples_sheet.table.headers
	header.columnIndex == column_index

	# input.samples[fileName].table.columns[columnIndex]
	column_header := header.columnHeader

	# columnName := input.samples[fileName].table.columns[columnIndex]
	# samples_sheet.table.headers[t].columnIndex == columnIndex
	# columnHeader := input.samples[fileName].table.headers[t].columnHeader
	violated_values := [sprintf("[row: %03v, value:'%v']", [x, y]) |
		some j, value in samples_sheet.table.data[column_name]
		count(value) > 0
		count(value) != count(trim_space(value))
		x := (samples_sheet.table.rowOffset + j) + 1
		y := value
	]

	# source := file_name; fileColumnHeader := columnHeader; fileColumnIndex := column_index + 1
	result := f.format_with_values(rego.metadata.rule(), file_name, column_index + 1, column_header, violated_values)
}

# METADATA
# title: Ontology Term Source REF not referenced in investigation file.
# description: All ontology Term Source REFs should be referenced in ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_s_200_090_002_03
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_03 contains result if {
	input.samples[fileName].table.headers[columnIndex]

	result := f.term_source_ref_not_in_source_references_list(rego.metadata.rule(), input.samples, fileName, columnIndex, def.ONTOLOGY_SOURCE_REFERENCE_NAMES, def.ONTOLOGY_SOURCE_REFERENCE_NAMES_STR)
}

# METADATA
# title: Ontology Term Source REF defined for empty ontology terms.
# description: Select ontology terms and/or change ontology Term Source REF.
# custom:
#  rule_id: rule_s_200_090_002_04
#  type: ERROR
#  priority: MEDIUM
#  section: samples.general
rule_s_200_090_002_04 contains result if {
	some file_name, sheet in input.samples
	some header_index, header in sheet.table.headers
	result := f.term_source_ref_is_defined_for_empty_term(rego.metadata.rule(), input.samples, file_name, header_index)
}

# METADATA
# title: Ontology Term Source REF defined for empty unit ontology terms.
# description: Select unit ontology terms and/or change ontology Term Source REF.
# custom:
#  rule_id: rule_s_200_090_002_06
#  type: WARNING
#  priority: MEDIUM
#  section: samples.general
rule_s_200_090_002_06 contains result if {
	input.samples[fileName].table.headers[columnIndex]
	result := f.term_source_ref_is_defined_for_empty_unit(rego.metadata.rule(), input.samples, fileName, columnIndex)
}

# METADATA
# title: Value is not in the required ontologies or controlled lists associated with this column
# description: A term MUST be selected from the required ontologies or controlled lists associated with this column.
# custom:
#  rule_id: rule_s_200_090_002_09
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_09 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls
	some file_name, file_table in input.samples
	some column_index, header in input.samples[file_name].table.headers
	selected_validation_types = {
		"ontology-term-in-selected-ontologies",
		"child-ontology-term",
		"any-ontology-term",
		"selected-ontology-term",
	}
	enforcement_levels = {"required"}
	control_lists[header.columnHeader]

	result := f.check_rule_by_enforcement_level(
		rego.metadata.rule(),
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		def1.STUDY_SAMPLE_TEMPLATE_NAME,
		"sample",
		file_table.table,
		file_name,
		column_index,
		selected_validation_types,
		enforcement_levels,
		control_lists,
		header.columnHeader,
	)
}

# METADATA
# title: Value is not in the predefined ontologies or controlled lists associated with this column
# description: A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column.
# custom:
#  rule_id: rule_s_200_090_002_10
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_10 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls
	some file_name, file_table in input.samples
	some column_index, header in input.samples[file_name].table.headers
	selected_validation_types = {
		"ontology-term-in-selected-ontologies",
		"child-ontology-term",
		"any-ontology-term",
		"selected-ontology-term",
	}
	enforcement_levels = {"recommended", "optional"}
	control_lists[header.columnHeader]

	# header.columnStructure in {"ONTOLOGY_COLUMN", "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"}
	result := f.check_rule_by_enforcement_level(
		rego.metadata.rule(),
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		def1.STUDY_SAMPLE_TEMPLATE_NAME,
		"sample",
		file_table.table,
		file_name,
		column_index,
		selected_validation_types,
		enforcement_levels,
		control_lists,
		header.columnHeader,
	)
}

# METADATA
# title: Factor value is not in the predefined ontologies or controlled lists associated with this column
# description: A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column.
# custom:
#  rule_id: rule_s_200_090_002_11
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_11 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls
	some file_name, file_table in input.samples
	some column_index, header in input.samples[file_name].table.headers
	not control_lists[header.columnHeader]
	enforcement_levels = {"required", "recommended", "optional"}
	selected_validation_types = {
		"ontology-term-in-selected-ontologies",
		"child-ontology-term",
		"any-ontology-term",
		"selected-ontology-term",
	}
	startswith(header.columnHeader, "Factor Value[")
	result := f.check_rule_by_enforcement_level(
		rego.metadata.rule(),
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		def1.STUDY_SAMPLE_TEMPLATE_NAME,
		"sample",
		file_table.table,
		file_name,
		column_index,
		selected_validation_types,
		enforcement_levels,
		control_lists,
		"__default_factor_value__",
	)
}

# METADATA
# title: Characteristic value is not in the predefined ontologies or controlled lists associated with this column
# description: A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column.
# custom:
#  rule_id: rule_s_200_090_002_12
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_12 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls
	some file_name, file_table in input.samples
	some column_index, header in input.samples[file_name].table.headers
	not control_lists[header.columnHeader]
	startswith(header.columnHeader, "Characteristics[")

	# header.columnStructure == "ONTOLOGY_COLUMN"
	selected_validation_types = {
		"ontology-term-in-selected-ontologies",
		"child-ontology-term",
		"any-ontology-term",
		"selected-ontology-term",
	}
	enforcement_levels = {"required", "recommended", "optional"}

	result := f.check_rule_by_enforcement_level(
		rego.metadata.rule(),
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		def1.STUDY_SAMPLE_TEMPLATE_NAME,
		"sample",
		file_table.table,
		file_name,
		column_index,
		selected_validation_types,
		enforcement_levels,
		control_lists,
		"__default_characteristic__",
	)
}

# METADATA
# title: The value does not match the required pattern.
# description: The column value MUST have a valid pattern value.
# custom:
#  rule_id: rule_s_200_090_002_13
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_13 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls
	some file_name, file_table in input.samples
	some column_index, header in input.samples[file_name].table.headers
	control_lists[header.columnHeader]
	enforcement_levels = {"required"}
	result := f.term_value_has_invalid_pattern(
		rego.metadata.rule(),
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		def1.STUDY_SAMPLE_TEMPLATE_NAME,
		"sample",
		file_table.table,
		file_name,
		column_index,
		enforcement_levels,
		control_lists,
		header.columnHeader,
	)
}

# METADATA
# title: The value does not match the recommended pattern.
# description: The column value SHOULD have a valid pattern value.
# custom:
#  rule_id: rule_s_200_090_002_14
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_14 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls
	some file_name, file_table in input.samples
	some column_index, header in input.samples[file_name].table.headers
	control_lists[header.columnHeader]
	enforcement_levels = {"recommended", "optional"}
	result := f.term_value_has_invalid_pattern(
		rego.metadata.rule(),
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		def1.STUDY_SAMPLE_TEMPLATE_NAME,
		"sample",
		file_table.table,
		file_name,
		column_index,
		enforcement_levels,
		control_lists,
		header.columnHeader,
	)
}

# METADATA
# title: Term Accession Number length of ontology terms less than 3 characters.
# description: Term Accession Number of ontology terms should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_s_200_090_003_01
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_003_01 contains result if {
	input.samples[fileName].table.headers[columnIndex]
	result := f.accession_number_min_length_check_for_term(rego.metadata.rule(), input.samples, fileName, columnIndex, 3)
}

# METADATA
# title: Term Accession Number length of unit ontology terms less than 3 characters.
# description: Term Accession Number of unit ontology terms should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_s_200_090_003_02
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_003_02 contains result if {
	input.samples[fileName].table.headers[columnIndex]
	result := f.accession_number_min_length_check_for_unit(rego.metadata.rule(), input.samples, fileName, columnIndex, 3)
}

# METADATA
# title: Term Accession Number defined for empty ontology terms.
# description: Select ontology terms and/or change ontology Term Accession Number.
# custom:
#  rule_id: rule_s_200_090_003_03
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_003_03 contains result if {
	some filename, sample_file in input.samples
	some idx, header in sample_file.table.headers

	# input.samples[fileName].table.headers[columnIndex]
	result := f.accession_number_is_defined_for_empty_term(rego.metadata.rule(), input.samples, filename, idx)
}

# METADATA
# title: Term Accession Number defined for empty unit ontology terms.
# description: Select unit ontology terms and/or change ontology Term Accession Number.
# custom:
#  rule_id: rule_s_200_090_003_04
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_003_04 contains result if {
	input.samples[fileName].table.headers[columnIndex]
	result := f.accession_number_is_defined_for_empty_unit(rego.metadata.rule(), input.samples, fileName, columnIndex)
}

# METADATA
# title: Empty value is found in a required column.
# description: Complete all values in required columns.
# custom:
#  rule_id: rule_s_200_090_004_01
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_004_01 contains result if {
	some file_name, _ in input.samples
	row_offset := input.samples[file_name].table.rowOffset
	template := data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_STUDY_SAMPLE_FILE_TEMPLATE
	required_template_headers := {x |
		some header in template.headers
		header.required == true
		header.minLength > 0
		x := header.columnHeader
	}
	required_enforcement_headers = {header |
		some sample_header in input.samples[file_name].table.headers
		rule := def1.get_sample_field_validation(def1.__SAMPLE_RULES__, sample_header.columnHeader)
		rule.termEnforcementLevel == "required"
		header := sample_header.columnHeader
	}
	required_headers := required_template_headers | required_enforcement_headers
	some sample_header in input.samples[file_name].table.headers
	column_header := sample_header.columnHeader
	sample_header.columnHeader in required_headers

	column_index := sample_header.columnIndex
	column_name := input.samples[file_name].table.columns[column_index]
	violated_values := f.empty_value_check(input.samples, file_name, column_name, row_offset)

	result := f.format_with_values(rego.metadata.rule(), file_name, column_index + 1, column_header, violated_values)
}

# METADATA
# title: Values do not meet minimum length requirement.
# description: Each row should have a value equal or greater than the minimum length.
# custom:
#  rule_id: rule_s_200_090_004_02
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_004_02 contains result if {
	some file_name, _ in input.samples
	template := data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_STUDY_SAMPLE_FILE_TEMPLATE
	some header in template.headers
	source := input.samples

	row_offset := source[file_name].table.rowOffset
	header.minLength > 0
	some sample_header in source[file_name].table.headers
	sample_header.columnHeader == header.columnHeader

	violated_values := f.min_length_check(source, file_name, sample_header.columnName, header.minLength, row_offset)

	result := f.format_with_desc(rego.metadata.rule(), file_name, sample_header.columnIndex, sample_header.columnHeader, violated_values, "Minimum value length for this column", header.minLength)
}

# METADATA
# title: Values do not meet maximum length requirement.
# description: Each row should have a value equal or less than the maximum length.
# custom:
#  rule_id: rule_s_200_090_004_03
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_004_03 contains result if {
	some file_name, _ in input.samples
	template := data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_STUDY_SAMPLE_FILE_TEMPLATE
	some header in template.headers
	source := input.samples

	row_offset := source[file_name].table.rowOffset
	header.maxLength > 0
	some sample_header in source[file_name].table.headers
	sample_header.columnHeader == header.columnHeader
	violated_values := f.max_length_check(source, file_name, sample_header.columnName, header.maxLength, row_offset)

	result := f.format_with_desc(rego.metadata.rule(), file_name, sample_header.columnIndex, sample_header.columnHeader, violated_values, "Minimum value length for this column", header.minLength)
}

# METADATA
# title: Values for Protocol REF column not valid in sample file.
# description: All rows should be filled with the same value (case sensitive).
# custom:
#  rule_id: rule_s_200_090_005_01
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_005_01 contains result if {
	file_column_header := "Protocol REF"
	some file_name, sheet in input.samples
	headers := [header | some header in sheet.table.headers; header.columnHeader == file_column_header]
	some t, header in headers
	template := data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_STUDY_SAMPLE_FILE_TEMPLATE
	column_index := header.columnIndex
	default_values = [header.defaultValue |
		some header in template.headers
		startswith(header.columnHeader, "Protocol REF")
	]

	default_value = default_values[t]
	default_value_str := sprintf("'%v'", [default_value])
	column_name := input.samples[file_name].table.columns[column_index]
	row_offset := input.samples[file_name].table.rowOffset
	violated_values := f.protocol_ref_column_value_check(input.samples, file_name, column_name, default_value, row_offset)

	result := f.format_with_desc(rego.metadata.rule(), file_name, column_index + 1, header.columnHeader, violated_values, "Expected value", default_value_str)
}

# METADATA
# title: The value appears in the list of unexpected values for this column.
# description: Select an alternative term or value that meets the requirement.
# custom:
#  rule_id: rule_s_200_090_007_01
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_007_01 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls
	some file_name, file_table in input.samples
	some column_index, header in input.samples[file_name].table.headers

	control_lists[header.columnHeader]
	selected_validation_types = {
		"selected-ontology-term",
		"any-ontology-term",
		"child-ontology-term",
		"ontology-term-in-selected-ontologies",
		"check-only-constraints",
	}
	enforcement_levels = {"required"}
	result := f.check_unexpected_value(
		rego.metadata.rule(),
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		def1.STUDY_SAMPLE_TEMPLATE_NAME,
		"sample",
		file_table.table,
		file_name,
		column_index,
		selected_validation_types,
		enforcement_levels,
		control_lists,
		header.columnHeader,
	)
}

# METADATA
# title: The value appears in the list of not-recommended values for this column.
# description: Select an alternative value that meets the requirement or leave it empty (if it is not required).
# custom:
#  rule_id: rule_s_200_090_007_02
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_007_02 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls
	some file_name, file_table in input.samples
	some column_index, header in input.samples[file_name].table.headers

	control_lists[header.columnHeader]
	selected_validation_types = {
		"selected-ontology-term",
		"any-ontology-term",
		"child-ontology-term",
		"ontology-term-in-selected-ontologies",
		"check-only-constraints",
	}
	enforcement_levels = {"recommended", "optional"}
	result := f.check_unexpected_value(
		rego.metadata.rule(),
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		def1.STUDY_SAMPLE_TEMPLATE_NAME,
		"sample",
		file_table.table,
		file_name,
		column_index,
		selected_validation_types,
		enforcement_levels,
		control_lists,
		header.columnHeader,
	)
}

# METADATA
# title: The value appears in the list of default unexpected values.
# description: Select an alternative term or value that meets the requirement.
# custom:
#  rule_id: rule_s_200_090_007_03
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_007_03 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls

	some file_name, file_table in input.samples
	some column_index, header in input.samples[file_name].table.headers

	selected_validation_types = {
		"selected-ontology-term",
		"any-ontology-term",
		"child-ontology-term",
		"ontology-term-in-selected-ontologies",
		"check-only-constraints",
	}

	enforcement_levels = {"required"}

	result := f.check_unexpected_value(
		rego.metadata.rule(),
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		def1.STUDY_SAMPLE_TEMPLATE_NAME,
		"sample",
		file_table.table,
		file_name,
		column_index,
		selected_validation_types,
		enforcement_levels,
		control_lists,
		"__default__",
	)
}

# METADATA
# title: The value appears in the list of default not-recommended values.
# description: Select an alternative value that meets the requirement or leave it empty (if it is not required).
# custom:
#  rule_id: rule_s_200_090_007_04
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_007_04 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls

	some file_name, file_table in input.samples
	some column_index, header in input.samples[file_name].table.headers

	selected_validation_types = {
		"selected-ontology-term",
		"any-ontology-term",
		"child-ontology-term",
		"ontology-term-in-selected-ontologies",
		"check-only-constraints",
	}
	enforcement_levels = {"recommended", "optional"}
	result := f.check_unexpected_value(
		rego.metadata.rule(),
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		def1.STUDY_SAMPLE_TEMPLATE_NAME,
		"sample",
		file_table.table,
		file_name,
		column_index,
		selected_validation_types,
		enforcement_levels,
		control_lists,
		"__default__",
	)
}

# #########################################################################################################
# # SAMPLES SHEET SOURCE SECTION VALIDATION RULES
# #########################################################################################################

# METADATA
# title: User defined Characteristics column is empty.
# description: At least one value should be defined in Characteristics column.
# custom:
#  rule_id: rule_s_200_100_002_01
#  type: ERROR
#  priority: HIGH
#  section: samples.source
rule_s_200_100_002_01 contains result if {
	some file_name, sheet in input.samples
	some header in sheet.table.headers

	row_offset := sheet.table.rowOffset
	startswith(header.columnHeader, "Characteristics[")

	template := data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_STUDY_SAMPLE_FILE_TEMPLATE
	default_headers := {t_header.columnHeader |
		some t_header in template.headers
		startswith(t_header.columnHeader, "Characteristics[")
	}
	not header.columnHeader in default_headers
	column_name := input.samples[fileName].table.columns[header.columnIndex]
	violated_values := {sprintf("['%v', column index: %v]", [header.columnHeader, header.columnIndex]) |
		vals := {x |
			some x in input.samples[fileName].table.data[column_name]
			count(trim_space(x)) > 0
		}
		count(vals) == 0
	}

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Term Accession Number of the user defined characteristics ontology terms is empty.
# description: We highly recommend to define accession number of the selected term.
# custom:
#  rule_id: rule_s_200_100_002_04
#  type: WARNING
#  priority: MEDIUM
#  section: samples.source
rule_s_200_100_002_04 contains result if {
	searchHeader := "Term Accession Number"
	header := input.samples[fileName].table.headers[columnIndex]
	header.columnStructure == "ONTOLOGY_COLUMN"

	columnName := header.columnName
	columnHeader := header.columnHeader
	startswith(columnHeader, "Characteristics[")

	not columnHeader in def._SAMPLES_DEFAULT_CHARACTERISTICS_HEADERS

	row_offset := input.samples[fileName].table.rowOffset

	accession_number_column_index := header.columnIndex + 2
	accession_number_column_name := input.samples[fileName].table.columns[accession_number_column_index]

	count(input.samples[fileName].table.data[columnName]) > 0
	violatedValues = {sprintf("Row: %v", [y]) |
		some j
		count(input.samples[fileName].table.data[columnName][j]) > 0
		count(input.samples[fileName].table.data[accession_number_column_name][j]) == 0
		y := (j + row_offset) + 1
	}
	count(violatedValues) > 0
	fileColumnHeader := sprintf("%v (of %v)", [searchHeader, columnHeader])
	sourceFile := fileName
	fileColumnIndex := accession_number_column_index + 1
	result := f.format_with_values(rego.metadata.rule(), sourceFile, fileColumnIndex, fileColumnHeader, violatedValues)
}

# #########################################################################################################
# #########################################################################################################
# # SAMPLES SHEET SAMPLES COLLECTION PROTOCOL REF COLUMN VALIDATION RULES
# #########################################################################################################
# #########################################################################################################

# METADATA
# title: Sample name values are not unique in sample file.
# description: All sample names should be unique in sample file.
# custom:
#  rule_id: rule_s_200_200_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.sampleCollection
rule_s_200_200_001_01 contains result if {
	some file_name, _ in input.samples

	row_count := input.samples[file_name].table.totalRowCount
	sample_names := {trimmed_name |
		some sample_name in input.samples[file_name].sampleNames
		trimmed_name := trim_space(sample_name)
		count(trimmed_name) > 0
	}
	count(sample_names) != row_count
	msg := sprintf("Number of rows: %v. Number of unique sample names is %v in '%v'.", [row_count, count(sample_names), file_name])

	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: Values for Sample Name column not in any assay file.
# description: Each sample name should be referenced at least one time in assay files.
# custom:
#  rule_id: rule_s_200_200_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: samples.sampleCollection
rule_s_200_200_001_02 contains result if {
	column_header := "Sample Name"
	some file_name, sample in input.samples
	some header in sample.table.headers
	header.columnHeader == column_header

	column_index := header.columnIndex

	column_name := sample.table.columns[column_index]
	row_offset = sample.table.rowOffset

	assay_file_sample_names := {sample_name |
		some _, assay in input.assays
		some sample_name in assay.sampleNames
	}

	# values := assayFileSamples
	values := {sprintf("[row: %03v, file name: '%v']", [row, value]) |
		some idx, value in sample.table.data[column_name]
		not value in assay_file_sample_names
		row := (idx + 1) + row_offset
	}

	sourceFile := file_name
	fileColumnHeader := column_header
	fileColumnIndex := column_index + 1
	result := f.format_with_values(rego.metadata.rule(), sourceFile, fileColumnIndex, fileColumnHeader, values)
}

# METADATA
# title: There are empty values in Factor Value column.
# description: Factor values should be defined for each row.
# custom:
#  rule_id: rule_s_200_200_002_01
#  type: WARNING
#  priority: HIGH
#  section: samples.sampleCollection
rule_s_200_200_002_01 contains result if {
	input.samples[fileName].table.headers[i]
	header := input.samples[fileName].table.headers[i]

	startswith(header.columnHeader, "Factor Value")
	columnIndex := header.columnIndex
	columnName := input.samples[fileName].table.columns[columnIndex]
	rowOffset = input.samples[fileName].table.rowOffset

	non_empty_columns := {sprintf("['%v', column index: %v]", [header.columnHeader, header.columnIndex]) |
		startswith(header.columnHeader, "Factor Value[")

		vals := {x |
			some x in input.samples[fileName].table.data[columnName]
			count(trim_space(x)) > 0
		}
		count(vals) > 0
	}
	count(non_empty_columns) > 0
	violatedValues := f.empty_value_check(input.samples, fileName, columnName, rowOffset)
	sourceFile := fileName
	fileColumnIndex := columnIndex + 1
	fileColumnHeader := header.columnHeader
	result := f.format_with_values(rego.metadata.rule(), sourceFile, fileColumnIndex, fileColumnHeader, violatedValues)
}

# METADATA
# title: Factor Value column not complete.
# description: At least two values must be defined in Factor Value column.
# custom:
#  rule_id: rule_s_200_200_002_02
#  type: ERROR
#  priority: HIGH
#  section: samples.sampleCollection
rule_s_200_200_002_02 contains result if {
	some file_name, sheet in input.samples
	some _, header in sheet.table.headers
	column_name := input.samples[file_name].table.columns[header.columnIndex]
	violated_values := {sprintf("['%v', column index: %v]", [header.columnHeader, header.columnIndex]) |
		startswith(header.columnHeader, "Factor Value[")
		vals := {x |
			some x in sheet.table.data[column_name]
			count(trim_space(x)) > 0
		}
		count(vals) < 2
	}

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}
