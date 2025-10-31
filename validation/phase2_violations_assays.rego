package metabolights.validation.v2.phase2.violations

import data.metabolights.validation.v2.functions as f
import rego.v1

import data.metabolights.validation.v2.phase2.definitions as def
import data.metabolights.validation.v2.phase1.definitions as def1

import data.metabolights.validation.v2.templates

# import input.samples
import input.assays

# #########################################################################################################
# #########################################################################################################
# # ASSAY SHEET GENERAL VALIDATION RULES
# #########################################################################################################
# #########################################################################################################

# METADATA
# title: Values with trailing or leading spaces in assay file.
# description: Values in assay file should not start or end with space characters.
# custom:
#  rule_id: rule_a_200_090_001_01
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_001_01 contains result if {
	some file_name, sheet in input.assays
	some column_index, column_name in sheet.table.columns
	some _, header in sheet.table.headers
	header.columnIndex == column_index

	violated_values := [sprintf("[row: %03v, value:'%v']", [x, y]) |
		some j, value in sheet.table.data[column_name]
		count(value) > 0
		count(value) != count(trim_space(value))
		x := (sheet.table.rowOffset + j) + 1
		y := value
	]

	# source := file_name; fileColumnHeader := columnHeader; fileColumnIndex := column_index + 1
	result := f.format_with_values(rego.metadata.rule(), file_name, column_index + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Ontology Term Source REF is not selected from the prioritised ontologies.
# description: Select a term from one of the prioritised sources where possible.
# custom:
#  rule_id: rule_a_200_090_002_01
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_01 contains result if {
	some file_name, file_table in input.assays
	some column_index, header in file_table.table.headers
	control_lists := data.metabolights.validation.v2.controls.assayFileControls
	control_lists[header.columnHeader]
	selected_validation_types = {"any-ontology-term"}
	template_name := file_table.assayTechnique.name
	result := f.term_source_ref_not_valid(
		rego.metadata.rule(), 
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		template_name,
		"assay",
		file_table.table, 
		file_name, 
		column_index, 
		selected_validation_types,
		control_lists,
		header.columnHeader,
		"Prioritised ontologies"
		)
}

# METADATA
# title: Ontology Term Source REF is not selected from the default prioritised ontologies.
# description: Select a term from one of the prioritised sources where possible.
# custom:
#  rule_id: rule_a_200_090_002_02
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_02 contains result if {
	some file_name, file_table in input.assays
	some column_index, header in file_table.table.headers
	control_lists := data.metabolights.validation.v2.controls.assayFileControls
	not control_lists[header.columnHeader]
	selected_validation_types = {"any-ontology-term", "child-ontology-term", "ontology-term-in-selected-ontologies"}
	template_name := file_table.assayTechnique.name
	result := f.term_source_ref_not_valid(
		rego.metadata.rule(), 
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		template_name,
		"assay",
		file_table.table, 
		file_name, 
		column_index, 
		selected_validation_types,
		control_lists,
		"__default__",
		"Prioritised default ontologies"
		)
}

# METADATA
# title: Ontology Term Source REF not referenced in investigation file.
# description: All ontology Term Source REFs should be referenced in ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_a_200_090_002_03
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_03 contains result if {
	some file_name, sheet in input.assays
	some header_index, _ in sheet.table.headers
	ontology_source_references := {ref.sourceName | some ref in input.investigation.ontologySourceReferences.references}
	ontology_source_references_str := concat(", ", ontology_source_references)
	result := f.term_source_ref_not_in_source_references_list(rego.metadata.rule(), assays, file_name, header_index, ontology_source_references, ontology_source_references_str)
}

# METADATA
# title: Ontology Term Source REF defined for empty ontology terms.
# description: Select ontology terms and/or change ontology Term Source REF.
# custom:
#  rule_id: rule_a_200_090_002_04
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_04 contains result if {
	some file_name, sheet in input.assays
	some header_index, _ in sheet.table.headers
	result := f.term_source_ref_is_defined_for_empty_term(rego.metadata.rule(), assays, file_name, header_index)
}

# METADATA
# title: Ontology Term Source REF of Unit is not selected from the prioritised ontologies.
# description: Select a unit term from one of the prioritised sources where possible.
# custom:
#  rule_id: rule_a_200_090_002_05
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_05 contains result if {
	control_lists := data.metabolights.validation.v2.controls.sampleFileControls
	some file_name, file_table in input.assays
	some column_index, header in file_table.table.headers
	header.columnStructure == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"
	selected_validation_types = {"any-ontology-term"}
	template_name := file_table.assayTechnique.name
	result := f.term_source_ref_for_unit_not_valid(
		rego.metadata.rule(), 
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		template_name,
		"assay",
		file_table.table, 
		file_name, 
		column_index, 
		selected_validation_types,
		control_lists,
		"Unit",
		"Prioritised default Unit ontologies"
		)


}

# METADATA
# title: Ontology Term Source REF defined for empty unit ontology terms.
# description: Select unit ontology terms and/or change ontology Term Source REF.
# custom:
#  rule_id: rule_a_200_090_002_06
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_06 contains result if {
	some file_name, sheet in input.assays
	some header_index, _ in sheet.table.headers
	result := f.term_source_ref_is_defined_for_empty_unit(rego.metadata.rule(), assays, file_name, header_index)
}

# METADATA
# title: Term is not in the control list.
# description: The term MUST be in the selected ontology terms.
# custom:
#  rule_id: rule_a_200_090_002_09
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_09 contains result if {
	control_lists := data.metabolights.validation.v2.controls.assayFileControls
	some file_name, file_table in input.assays
	some column_index, header in input.assays[file_name].table.headers
	selected_validation_types = {"selected-ontology-term"}
	control_lists[header.columnHeader]
	header.columnStructure == "ONTOLOGY_COLUMN"
	template_name := file_table.assayTechnique.name
	# print(header.columnHeader, template_name)
	result := f.ontology_term_not_in_selected_terms(
		rego.metadata.rule(), 
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		template_name,
		"assay",
		file_table.table, 
		file_name, 
		column_index, 
		selected_validation_types,
		control_lists,
		header.columnHeader,
		"Controlled terms"
		)
}


# METADATA
# title: Value is not in the control list.
# description: The value MUST be in the selected values.
# custom:
#  rule_id: rule_a_200_090_002_10
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_10 contains result if {
	control_lists := data.metabolights.validation.v2.controls.assayFileControls
	some file_name, file_table in input.assays
	some column_index, header in input.assays[file_name].table.headers
	selected_validation_types = {"selected-ontology-term"}
	control_lists[header.columnHeader]
	header.columnStructure == "SINGLE_COLUMN"
	template_name := file_table.assayTechnique.name
	# print(header.columnHeader, template_name)
	result := f.term_value_not_in_selected_terms(
		rego.metadata.rule(), 
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		template_name,
		"assay",
		file_table.table, 
		file_name, 
		column_index, 
		selected_validation_types,
		control_lists,
		header.columnHeader,
		"Controlled terms"
		)
}


# METADATA
# title: Term is not in the selected ontologies.
# description: The term MUST be defined in the the selected ontologies.
# custom:
#  rule_id: rule_a_200_090_002_13
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_13 contains result if {
	control_lists := data.metabolights.validation.v2.controls.assayFileControls
	some file_name, file_table in input.assays
	some column_index, header in input.assays[file_name].table.headers
	selected_validation_types = {"ontology-term-in-selected-ontologies"}
	control_lists[header.columnHeader]
	header.columnStructure == "ONTOLOGY_COLUMN"
	template_name := file_table.assayTechnique.name
	result := f.term_source_ref_not_valid(
		rego.metadata.rule(), 
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		template_name,
		"assay",
		file_table.table, 
		file_name, 
		column_index, 
		selected_validation_types,
		control_lists,
		header.columnHeader,
		"Valid ontologies "
		)
}

# METADATA
# title: Term is not a child of of the selected ontology terms.
# description: The term MUST be a child of the selected ontology terms.
# custom:
#  rule_id: rule_a_200_090_002_14
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_14 contains result if {
	control_lists := data.metabolights.validation.v2.controls.assayFileControls
	some file_name, file_table in input.assays
	some column_index, header in input.assays[file_name].table.headers
	selected_validation_types = {"child-ontology-term"}
	control_lists[header.columnHeader]
	header.columnStructure == "ONTOLOGY_COLUMN"
	template_name := file_table.assayTechnique.name

	result := f.term_source_ref_not_valid(
		rego.metadata.rule(), 
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		template_name,
		"assay",
		file_table.table, 
		file_name, 
		column_index, 
		selected_validation_types,
		control_lists,
		header.columnHeader,
		"Valid ontologies"
		)
}

# METADATA
# title: Value has not a valid pattern.
# description: The column value must have a valid pattern value.
# custom:
#  rule_id: rule_a_200_090_002_15
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_15 contains result if {
	control_lists := data.metabolights.validation.v2.controls.assayFileControls
	some file_name, file_table in input.assays
	some column_index, header in input.assays[file_name].table.headers
	selected_validation_types = {"selected-ontology-term"}
	control_lists[header.columnHeader]
	template_name := file_table.assayTechnique.name
	# print(header.columnHeader, template_name)
	result := f.term_value_has_invalid_pattern(
		rego.metadata.rule(), 
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		template_name,
		"assay",
		file_table.table, 
		file_name, 
		column_index, 
		selected_validation_types,
		control_lists,
		header.columnHeader,
		"Expected pattern"
		)
}

# METADATA
# title: Value has not a valid pattern.
# description: The column value must have a valid pattern value.
# custom:
#  rule_id: rule_a_200_090_002_16
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_16 contains result if {
control_lists := data.metabolights.validation.v2.controls.assayFileControls
	some file_name, file_table in input.assays
	some column_index, header in file_table.table.headers
	selected_validation_types = {"selected-ontology-term", "any-ontology-term", "child-ontology-term", "ontology-term-in-selected-ontologies"}
	control_lists[header.columnHeader]
	header.columnStructure in {"ONTOLOGY_COLUMN", "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"}
	template_name := file_table.assayTechnique.name
	result := f.ontology_term_has_unexpected_value(
		rego.metadata.rule(), 
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		template_name,
		"assay",
		file_table.table, 
		file_name, 
		column_index, 
		selected_validation_types,
		control_lists,
		header.columnHeader,
		"Do not use these unexpected terms"
		)
}


# METADATA
# title: Value has not a valid pattern.
# description: The column value must have a valid pattern value.
# custom:
#  rule_id: rule_a_200_090_002_17
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_17 contains result if {
control_lists := data.metabolights.validation.v2.controls.assayFileControls
	some file_name, file_table in input.assays
	some column_index, header in file_table.table.headers
	selected_validation_types = {"selected-ontology-term", "any-ontology-term", "child-ontology-term", "ontology-term-in-selected-ontologies"}
	control_lists[header.columnHeader]
	header.columnStructure in {"ONTOLOGY_COLUMN", "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"}
	template_name := file_table.assayTechnique.name
	result := f.ontology_term_has_unexpected_value(
		rego.metadata.rule(), 
		def1.STUDY_CATEGORY,
		def1.STUDY_TEMPLATE_VERSION,
		def1.STUDY_CREATED_AT,
		template_name,
		"assay",
		file_table.table, 
		file_name, 
		column_index, 
		selected_validation_types,
		control_lists,
		"__default__",
		"Do not use these unexpected terms"
		)
}
# METADATA
# title: Term Accession Number length of ontology terms less than 3 characters.
# description: Term Accession Number of ontology terms should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_a_200_090_003_01
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_003_01 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	result := f.accession_number_min_length_check_for_term(rego.metadata.rule(), assays, file_name, header_index, 3)
}

# METADATA
# title: Term Accession number length of unit ontology terms less than 3 characters.
# description: Term Accession Number of unit ontology terms should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_a_200_090_003_02
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_003_02 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	result := f.accession_number_min_length_check_for_unit(rego.metadata.rule(), assays, file_name, header_index, 3)
}

# METADATA
# title: Term Accession Number defined for empty ontology terms.
# description: Select ontology terms and/or change ontology Term Accession Number.
# custom:
#  rule_id: rule_a_200_090_003_03
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_003_03 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	result := f.accession_number_is_defined_for_empty_term(rego.metadata.rule(), assays, file_name, header_index)
}

# METADATA
# title: Term Accession Number defined for empty unit ontology terms.
# description: Select unit ontology terms and/or change ontology Term Accession Number.
# custom:
#  rule_id: rule_a_200_090_003_04
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_003_04 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	result := f.accession_number_is_defined_for_empty_unit(rego.metadata.rule(), assays, file_name, header_index)
}

# METADATA
# title: Required columns have empty values in assay file.
# description: All required column values should be defined in assay file.
# custom:
#  rule_id: rule_a_200_090_004_01
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_004_01 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	row_offset := sheet.table.rowOffset
	assay_technique := sheet.assayTechnique.name
	template_list := data.metabolights.validation.v2.templates.assayFileHeaderTemplates[assay_technique]

	some template in template_list
	template.version == data.metabolights.validation.v2.phase1.definitions.STUDY_TEMPLATE_VERSION
	some template_header in template.headers
	template_header.required == true

	header.columnHeader == template_header.columnHeader
	column_name := sheet.table.columns[header.columnIndex]
	violated_values := f.empty_value_check(assays, file_name, column_name, row_offset)

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Values do not meet minimum length requirement.
# description: Each row should have a value equal or greater than the minimum length.
# custom:
#  rule_id: rule_a_200_090_004_02
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_004_02 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	row_offset := sheet.table.rowOffset
	assay_technique := sheet.assayTechnique.name
	template_list := data.metabolights.validation.v2.templates.assayFileHeaderTemplates[assay_technique]

	some template in template_list
	template.version == data.metabolights.validation.v2.phase1.definitions.STUDY_TEMPLATE_VERSION
	some template_header in template.headers
	template_header.minLength > 0

	header.columnHeader == template_header.columnHeader
	column_name := sheet.table.columns[header.columnIndex]
	violated_values := f.min_length_check(assays, file_name, column_name, template_header.minLength, row_offset)
	result := f.format_with_desc(rego.metadata.rule(), file_name, header.columnIndex + 1, template_header.columnHeader, violated_values, "Required minimum value length for this column", template_header.minLength)
}

# METADATA
# title: Values do not meet maximum length requirement.
# description: Each row should have a value equal or less than the maximum length.
# custom:
#  rule_id: rule_a_200_090_004_03
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_004_03 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	row_offset := sheet.table.rowOffset
	assay_technique := sheet.assayTechnique.name
	template_list := data.metabolights.validation.v2.templates.assayFileHeaderTemplates[assay_technique]

	some template in template_list
	template.version == data.metabolights.validation.v2.phase1.definitions.STUDY_TEMPLATE_VERSION
	some template_header in template.headers
	template_header.maxLength > 0

	header.columnHeader == template_header.columnHeader
	column_name := sheet.table.columns[header.columnIndex]
	violated_values := f.max_length_check(assays, file_name, column_name, template_header.maxLength, row_offset)
	result := f.format_with_desc(rego.metadata.rule(), file_name, header.columnIndex + 1, template_header.columnHeader, violated_values, "Required minimum value length for this column", template_header.maxLength)
}

# METADATA
# title: Values for Protocol REF column not valid in assay file.
# description: All rows should be filled with the same value (case sensitive).
# custom:
#  rule_id: rule_a_200_090_005_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule_a_200_090_005_01 contains result if {
	some file_name, sheet in input.assays

	template_protocol_headers := [template_header.defaultValue |
		assay_technique := sheet.assayTechnique.name
		template_list := data.metabolights.validation.v2.templates.assayFileHeaderTemplates[assay_technique]
		some template in template_list
		template.version == data.metabolights.validation.v2.phase1.definitions.STUDY_TEMPLATE_VERSION
		some template_header in template.headers
		template_header.columnCategory == "Protocol"
	]

	count(template_protocol_headers) > 0

	protocol_headers := [header |
		some _, header in sheet.table.headers
		header.columnCategory == "Protocol"
	]

	some protocol_order, header in protocol_headers
	default_value := template_protocol_headers[protocol_order]

	row_offset := sheet.table.rowOffset

	column_index := header.columnIndex
	column_header := header.columnHeader
	column_name := header.columnName

	default_value_str := sprintf("'%v' at column: %v (protocol order: %v)", [default_value, column_index + 1, protocol_order + 1])

	violated_values := f.protocol_ref_column_value_check(assays, file_name, column_name, default_value, row_offset)

	result := f.format_with_desc(rego.metadata.rule(), file_name, header.columnIndex + 1, column_header, violated_values, "Expected value", default_value_str)
}

# METADATA
# title: Invalid column value.
# description: Some column values are not allowed. Please use valid ontology term or controlled vocabulary.
# custom:
#  rule_id: rule_a_200_090_006_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.general
rule_a_200_090_006_01 contains result if {
	some file_name, sheet in input.assays
	some header in sheet.table.headers

	column_index := header.columnIndex

	column_name := sheet.table.columns[column_index]
	row_offset := sheet.table.rowOffset

	unexpected_terms := {term |
		some name, black_list_control in data.metabolights.validation.v2.blackLists.assayColumns
		name == header.columnHeader

		some term in black_list_control.unexpectedTerms
	}
	count(unexpected_terms) > 0
	violated_values := f.in_control_list_check(input.assays, file_name, column_name, unexpected_terms, row_offset)

	count(violated_values) > 0
	result := f.format_with_values(rego.metadata.rule(), file_name, column_index + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Values for Sample Name column not in sample file.
# description: All Sample Name column values should be defined in sample file.
# custom:
#  rule_id: rule_a_200_100_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule_a_200_100_001_01 contains result if {
	some file_name, sheet in input.assays
	some _, sample_sheet in input.samples

	some header_index, header in sheet.table.headers
	sample_names := sample_sheet.sampleNames
	header.columnHeader == "Sample Name"

	row_offset := sheet.table.rowOffset
	violated_values := [x |
		some j, value in sheet.table.data[header.columnName]
		not value in sample_names
		x := sprintf("[row: %03v, sample name: '%v']", [(row_offset + j) + 1, value])
	]

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Values for Sample Name column not unique in assay file.
# description: Often Sample Name column values will be unique.
# custom:
#  rule_id: rule_a_200_100_001_02
#  type: WARNING
#  priority: MEDIUM
#  section: assays.general
rule_a_200_100_001_02 contains result if {
	some file_name, sheet in input.assays
	some _, sample_sheet in input.samples
	some header_index, header in sheet.table.headers
	header.columnHeader == "Sample Name"

	column_index := header.columnIndex
	column_name := header.columnName

	row_count := count(sheet.table.data[column_name])
	row_count > 0

	sample_names := {value | some value in sheet.table.data[column_name]; count(trim_space(value)) > 0}
	count(sample_names) != row_count
	msg := sprintf("Sample names are not unique in the assay file. Number of sample names: %v, row count: %v", [count(sample_names), row_count])
	result := f.format_with_values(rego.metadata.rule(), file_name, column_index + 1, header.columnHeader, [msg])
}

# METADATA
# title: Metabolite assignment file name not correct pattern in assay file.
# description: Metabolite assignment file name must start with 'm_' and have extension '.tsv'.
# custom:
#  rule_id: rule_a_200_200_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.metabolite_identification
rule_a_200_200_001_01 contains result if {
	pattern := `^m_.+\.tsv$`
	assays[assayFileName]
	columnHeader := "Metabolite Assignment File"

	rowOffset := assays[assayFileName].table.rowOffset
	assays[assayFileName].table.headers[index].columnHeader == columnHeader
	columnIndex := assays[assayFileName].table.headers[index].columnIndex
	columnName := assays[assayFileName].table.headers[index].columnName
	violatedValues := [x |
		some j
		value := assays[assayFileName].table.data[columnName][j]
		count(value) > 0
		not regex.match(pattern, value)
		x := sprintf("[row: %03v, name: '%v']", [(rowOffset + j) + 1, value])
	]
	sourceFile := assayFileName
	fileColumnHeader := columnHeader
	fileColumnIndex := columnIndex + 1
	result := f.format_with_values(rego.metadata.rule(), sourceFile, fileColumnIndex, fileColumnHeader, violatedValues)
}

# METADATA
# title: Metabolite assignment file name contains invalid characters in assay file.
# description: Use only .-_A-Za-z0-9 characters for an metabolite assignment file name in assay file.
# custom:
#  rule_id: rule_a_200_200_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: assays.metabolite_identification
rule_a_200_200_001_02 contains result if {
	pattern := `^m_.+\.tsv$`
	assays[assayFileName]
	columnHeader := "Metabolite Assignment File"

	assays[assayFileName].table.headers[index].columnHeader == columnHeader
	columnIndex := assays[assayFileName].table.headers[index].columnIndex
	columnName := assays[assayFileName].table.headers[index].columnName
	assignment_files := {assignment_file |
		some assignment_file in assays[assayFileName].table.data[columnName]
	}

	violated_values := {sprintf("[%v invalid characters: %v]", [assignment_file, matches_str]) |
		some assignment_file in assignment_files
		matches = regex.find_n("[^A-Za-z0-9/._-]", assignment_file, -1)
		count(matches) > 0
		matches_set := {match | some match in matches}
		matches_str := concat(" ", matches_set)
	}

	sourceFile := assayFileName
	fileColumnHeader := columnHeader
	fileColumnIndex := columnIndex + 1
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, violated_values)
}

# METADATA
# title: Both 'Raw Spectral Data File' and 'Derived Spectral Data File' not in assay file.
# description: Raw data files or Derived data files must be defined in assay file.
# custom:
#  rule_id: rule_a_200_300_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.mass_spectrometry
rule_a_200_300_001_01 contains result if {
	some file_name, sheet in input.assays
	sheet.assayTechnique.mainTechnique == "MS"
	file_colum_headers := {"Derived Spectral Data File", "Raw Spectral Data File"}

	column_names := {sheet_header.columnName |
		some _, sheet_header in sheet.table.headers
		sheet_header.columnHeader in file_colum_headers
	}
	some _, header in sheet.table.headers
	header.columnHeader == "Raw Spectral Data File"
	total_coumn_count := count(column_names)
	row_offset := sheet.table.rowOffset
	violated_values := {sprintf("[row: %03v]", [row_index]) |
		some row, value in sheet.table.data[header.columnHeader]
		total_emtpy_count := count({violated_column |
			some violated_column in column_names
			count(trim_space(sheet.table.data[violated_column][row])) == 0
		})
		total_emtpy_count == total_coumn_count

		row_index := (row + 1) + row_offset
	}
	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Derived Spectral Data File' is defined but 'Raw Spectral Data File' is empty in assay file.
# description: Derived Spectral Data File is defined without Raw Spectral Data File. We recommend to upload raw file and reference it.
# custom:
#  rule_id: rule_a_200_300_001_02
#  type: WARNING
#  priority: HIGH
#  section: assays.mass_spectrometry
rule_a_200_300_001_02 contains result if {
	some file_name, sheet in input.assays
	sheet.assayTechnique.mainTechnique == "MS"
	file_colum_headers := {"Derived Spectral Data File"}

	derived_file_column_names := {sheet_header.columnName |
		some _, sheet_header in sheet.table.headers
		sheet_header.columnHeader in file_colum_headers
	}
	some _, header in sheet.table.headers
	header.columnHeader == "Raw Spectral Data File"

	row_offset := sheet.table.rowOffset
	raw_column_name = "Raw Spectral Data File"
	violated_values := {sprintf("[row: %03v]", [row_index]) |
		some row, value in sheet.table.data[raw_column_name]

		count(trim_space(value)) == 0
		derived_files := {val |
			some column_name in derived_file_column_names
			val := sheet.table.data[column_name][row]
			count(trim_space(val)) > 0
		}
		count(derived_files) > 0
		row_index := (row + 1) + row_offset
	}

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Values for Raw Spectral Data File column not correct extension in assay file.
# description: All Raw Spectral Data File column values should have extension found in control list.
# custom:
#  rule_id: rule_a_200_300_001_03
#  type: ERROR
#  priority: HIGH
#  section: assays.mass_spectrometry
rule_a_200_300_001_03 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	header.columnHeader == "Raw Spectral Data File"
	row_offset := sheet.table.rowOffset
	column_index := header.columnIndex
	column_name := header.columnName

	values := {sprintf("[row: %03v, file name: '%v']", [row, name]) |
		some i, name in sheet.table.data[column_name]
		count(name) > 0
		extensions := f.extension(name, def.CL_RAW_FILE_EXTENSIONS)
		count(extensions) == 0
		row := (i + 1) + row_offset
	}

	result := f.format_with_desc(rego.metadata.rule(), file_name, column_index + 1, header.columnHeader, values, "Expected extensions", def.CL_RAW_FILE_EXTENSIONS_STR)
}

# METADATA
# title: Values for MS Assay Name column not unique in assay file.
# description: All MS Assay Name column values should be unique.
# custom:
#  rule_id: rule_a_200_300_002_01
#  type: WARNING
#  priority: CRITICAL
#  section: assays.mass_spectrometry
rule_a_200_300_002_01 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers

	sheet.assayTechnique.mainTechnique == "MS"
	header.columnHeader == "MS Assay Name"
	assay_names := {assay_name |
		some _, assay_name in sheet.table.data[header.columnName]
		count(trim_space(assay_name)) > 0
	}
	row_count := count(sheet.table.data[header.columnName])
	count(assay_names) != row_count
	msg := sprintf("MS Assay Name values are not unique in the assay file. Number of assay names: %v, row count: %v", [count(assay_names), row_count])

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, [msg])
}

# METADATA
# title: Scan Polarity column values are not same as assay file name.
# description: Values for Scan Polarity column is not same as assay file name.
# custom:
#  rule_id: rule_a_200_300_003_01
#  type: WARNING
#  priority: CRITICAL
#  section: assays.mass_spectrometry
rule_a_200_300_003_01 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	header.columnHeader == "Parameter Value[Scan polarity]"
	column_name := header.columnName
	scan_polarities = {x |
		some x in sheet.table.data[column_name]
	}
	
	count(scan_polarities) == 1
	some scan_polarity in scan_polarities
	matches := { x | 
		some x in {"positive", "negative", "alternating"}
		startswith(scan_polarity, x)
		contains(file_name, scan_polarity)
	}
	count(matches) == 0
	desc := sprintf("Assay scan polarity values are '%v' but it does not match with assay filename", [scan_polarity])
	result := f.format_with_file_description_and_values(rego.metadata.rule(), file_name, desc, scan_polarities)
}

# METADATA
# title: Scan Polarity column values are not unique.
# description: Define only one scan polarity value in each assay file.
# custom:
#  rule_id: rule_a_200_300_003_02
#  type: ERROR
#  priority: CRITICAL
#  section: assays.mass_spectrometry
rule_a_200_300_003_02 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	header.columnHeader == "Parameter Value[Scan polarity]"
	column_name := header.columnName
	scan_polarities = {x |
		some x in sheet.table.data[column_name]
		count(x) > 0
	}
	count(scan_polarities) > 1

	result := f.format_with_file_description_and_values(rego.metadata.rule(), file_name, "There are multiple scan polarity values in Parameter Value[Scan polarity] column.", scan_polarities)
}

# METADATA
# title: Derived Spectral Data Files, Acquisition Parameter Data File and Free Induction Decay Data File values are empty in NMR assays.
# description: At least one file should be defined in Derived Spectral Data Files, Free Induction Decay Data File or Acquisition Parameter Data File columns.
# custom:
#  rule_id: rule_a_200_400_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.nmr_assay
rule_a_200_400_001_01 contains result if {
	some file_name, sheet in input.assays
	sheet.assayTechnique.mainTechnique == "NMR"
	file_colum_headers := {"Free Induction Decay Data File", "Derived Spectral Data File", "Acquisition Parameter Data File"}

	derived_file_column_names := {sheet_header.columnName |
		some _, sheet_header in sheet.table.headers
		sheet_header.columnHeader in file_colum_headers
	}
	some _, header in sheet.table.headers
	header.columnHeader == "Derived Spectral Data File"

	row_offset := sheet.table.rowOffset
	values := sheet.table.data["Free Induction Decay Data File"]

	violated_values := {sprintf("[row: %03v]", [row_index]) |
		some row, _ in values
		derived_files := {val |
			some column_name in derived_file_column_names
			val := sheet.table.data[column_name][row]
			count(trim_space(val)) > 0
		}
		count(derived_files) == 0
		row_index := (row + 1) + row_offset
	}

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Values for NMR Assay Name column not unique in assay file.
# description: All NMR Assay Name column values should be unique.
# custom:
#  rule_id: rule_a_200_400_002_01
#  type: WARNING
#  priority: CRITICAL
#  section: assays.nmr_assay
rule_a_200_400_002_01 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers

	sheet.assayTechnique.mainTechnique == "NMR"
	header.columnHeader == "NMR Assay Name"
	assay_names := {assay_name |
		some _, assay_name in sheet.table.data[header.columnName]
		count(trim_space(assay_name)) > 0
	}
	row_count := count(sheet.table.data[header.columnName])
	count(assay_names) != row_count
	msg := sprintf("NMR Assay Name values are not unique in the assay file. Number of assay names: %v, row count: %v", [count(assay_names), row_count])

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, [msg])
}

# METADATA
# title: Values for Derived Spectral Data File column not correct extension in assay file.
# description: All Derived Spectral Data File column values should have extension found in control list.
# custom:
#  rule_id: rule_a_200_500_001_01
#  type: ERROR
#  priority: HIGH
#  section: assays.data_transformation
rule_a_200_500_001_01 contains result if {
	some file_name, sheet in input.assays
	some _, sample_sheet in input.samples
	some header_index, header in sheet.table.headers
	startswith(header.columnHeader, "Derived Spectral Data File")
	raw_data_file_column_name = "Raw Spectral Data File"
	row_offset := sheet.table.rowOffset
	column_index := header.columnIndex
	column_name := header.columnName

	values := {sprintf("[row: %03v, file name: '%v']", [row, name]) |
		some i, name in sheet.table.data[column_name]
		raw_file_name = sheet.table.data[raw_data_file_column_name][i]
		count(trim_space(raw_file_name)) == 0
		count(name) > 0
		extensions := f.extension(name, def.CL_DERIVED_FILE_EXTENSIONS)
		count(extensions) == 0
		row := (i + 1) + row_offset
	}
	count(values) > 0
	result := f.format_with_desc(rego.metadata.rule(), file_name, column_index + 1, header.columnHeader, values, "Expected extensions", def.CL_DERIVED_FILE_EXTENSIONS_STR)
}

# METADATA
# title: Column Type column values are not same as assay file name.
# description: if all values in Column Type are in a control list, technique name defined in control list should be in assay file name.
# custom:
#  rule_id: rule_a_200_600_001_01
#  type: WARNING
#  priority: CRITICAL
#  section: assays.chromatography
rule_a_200_600_001_01 contains result if {
	some file_name, sheet in input.assays
	some header_index, header in sheet.table.headers
	header.columnHeader == "Parameter Value[Column type]"
	column_name := header.columnName
	column_types = {x |
		some x in sheet.table.data[column_name]
	}

	count(column_types) == 1
	some column_type_name in column_types
	count(column_type_name) > 0
	column_type_label := replace(lower(column_type_name), " ", "-")
	matches := {x |
		some x in {"hilic", "reverse-phase", "normal-phase"}
		column_type_label == x
		contains(file_name, x)
	}
	count(matches) == 0
	desc := sprintf("column type in filename does not match with the value '%v' in column Parameter Value[Column type]", [column_type_label])
	result := f.format_with_file_description_and_values(rego.metadata.rule(), file_name, desc ,column_types)
}
