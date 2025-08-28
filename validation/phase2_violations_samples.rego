package metabolights.validation.v2.phase2.violations

import rego.v1

import data.metabolights.validation.v2.functions as f
import data.metabolights.validation.v2.phase2.definitions as def

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
# title: Ontology Term Source REF of ontology terms not in prioritised control list.
# description: Prioritised ontology Term Source REFs should be used for ontology terms in this column if possible.
# custom:
#  rule_id: rule_s_200_090_002_01
#  type: WARNING
#  priority: MEDIUM
#  section: samples.general
rule_s_200_090_002_01 contains result if {
	some file_name, _ in input.samples
	some column_index, header in input.samples[file_name].table.headers

	some template in data.metabolights.validation.v2.templates.sampleFileHeaderTemplates
	template.version == "v1.0"
	control_lists := data.metabolights.validation.v2.controlLists

	result := f.term_source_ref_not_in_control_list(rego.metadata.rule(), input.samples, file_name, column_index, control_lists)
}

# METADATA
# title: Ontology Term Source REF of ontology terms not in prioritised default control list.
# description: Prioritised default ontology Term Source REFs should be used for ontology terms in this column if possible.
# custom:
#  rule_id: rule_s_200_090_002_02
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_02 contains result if {
	some file_name, sheet in input.samples
	some column_index, header in sheet.table.headers
	control_list := data.metabolights.validation.v2.controlLists.prioritisedDefaultTermRefSources

	default_control_list_headers = {header.columnHeader |
		some _, template in data.metabolights.validation.v2.templates.sampleFileHeaderTemplates
		template.version == "v1.0"
		some _, header in template.headers
		some "termSourceRef", _ in header.controlLists
	}
	result := f.term_source_ref_not_in_default_control_list(rego.metadata.rule(), input.samples, file_name, column_index, default_control_list_headers, control_list)
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

	result := f.term_source_ref_not_in_source_references_list(rego.metadata.rule(), input.samples, fileName, columnIndex, def._ONTOLOGY_SOURCE_REFERENCE_NAMES, def._ONTOLOGY_SOURCE_REFERENCE_NAMES_STR)
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

	# sheet.table.headers[columnIndex]
	# print(header.columnIndex)
	result := f.term_source_ref_is_defined_for_empty_term(rego.metadata.rule(), input.samples, file_name, header_index)
}

# METADATA
# title: Ontology Term Source REF for a unit not in prioritised control list.
# description: We highly recommend to use the prioritised ontology Term Source REFs for an unit ontology terms.
# custom:
#  rule_id: rule_s_200_090_002_05
#  type: WARNING
#  priority: MEDIUM
#  section: samples.general
rule_s_200_090_002_05 contains result if {
	input.samples[fileName].table.headers[columnIndex]
	templates := data.metabolights.validation.v2.templates
	templates.sampleFileHeaderTemplates[m].version == "v1.0"

	# template := templates.sampleFileHeaderTemplates[m]
	controlList := data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources
	result := f.term_source_ref_for_unit_not_in_control_list(rego.metadata.rule(), input.samples, fileName, columnIndex, controlList)
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
# title: Term Source REF of ontology terms is empty.
# description: Term Source REF of ontology terms should be defined. A prioritised control list is defined. Review and select from the prioritised control list if possible.
# custom:
#  rule_id: rule_s_200_090_002_07
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_07 contains result if {
	input.samples[fileName].table.headers[columnIndex]
	templates := data.metabolights.validation.v2.templates
	templates.sampleFileHeaderTemplates[m].version == "v1.0"
	template := templates.sampleFileHeaderTemplates[m]
	controlLists := data.metabolights.validation.v2.controlLists

	result := f.term_source_ref_is_empty_for_term(rego.metadata.rule(), input.samples, fileName, columnIndex, template, controlLists)
}

# METADATA
# title: Term Source REF of unit ontology terms is empty.
# description: Term Source REF of unit ontology terms should be defined. A prioritised control list is defined. Review and select from the prioritised control list if possible.
# custom:
#  rule_id: rule_s_200_090_002_08
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_08 contains result if {
	input.samples[fileName].table.headers[columnIndex]
	templates := data.metabolights.validation.v2.templates
	templates.sampleFileHeaderTemplates[m].version == "v1.0"

	# template := templates.sampleFileHeaderTemplates[m]
	controlList := data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources
	result := f.term_source_ref_is_empty_for_unit(rego.metadata.rule(), input.samples, fileName, columnIndex, controlList)
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
	input.samples[fileName].table.headers[columnIndex]
	result := f.accession_number_is_defined_for_empty_term(rego.metadata.rule(), input.samples, fileName, columnIndex)
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
	some _, template in data.metabolights.validation.v2.templates.sampleFileHeaderTemplates
	template.version == "v1.0"
	some header in template.headers
	header.required == true
	header.minLength > 0
	column_header = header.columnHeader

	some sample_header in input.samples[file_name].table.headers
	sample_header.columnHeader == column_header
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
	some _, template in data.metabolights.validation.v2.templates.sampleFileHeaderTemplates
	template.version == "v1.0"
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
	some _, template in data.metabolights.validation.v2.templates.sampleFileHeaderTemplates
	template.version == "v1.0"
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

	column_index := header.columnIndex
	default_values = [header.defaultValue |
		some template in data.metabolights.validation.v2.templates.sampleFileHeaderTemplates
		template.version == "v1.0"
		some header in template.headers
		header.columnCategory == "Protocol"
	]

	default_value = default_values[t]
	default_value_str := sprintf("'%v'", [default_value])
	column_name := input.samples[file_name].table.columns[column_index]
	row_offset := input.samples[file_name].table.rowOffset
	violated_values := f.protocol_ref_column_value_check(input.samples, file_name, column_name, default_value, row_offset)

	result := f.format_with_desc(rego.metadata.rule(), file_name, column_index + 1, header.columnHeader, violated_values, "Expected value", default_value_str)
}


# METADATA
# title: Invalid column value.
# description: Some column values are not allowed. Please use valid ontology term or controlled vocabulary.
# custom:
#  rule_id: rule_s_200_090_006_01
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_006_01 contains result if {
	some file_name, sheet in input.samples
	some header in sheet.table.headers

	column_index := header.columnIndex

	column_name := sheet.table.columns[column_index]
	row_offset := sheet.table.rowOffset
	unexpected_terms := {term | 
		some name, black_list_control in data.metabolights.validation.v2.blackLists.sampleColumns
		name == header.columnHeader
		some term in black_list_control.unexpectedTerms
	}
	count(unexpected_terms) > 0
	violated_values := f.in_control_list_check(input.samples, file_name, column_name, unexpected_terms, row_offset)
	count(violated_values) > 0
	result := f.format_with_values(rego.metadata.rule(), file_name, column_index + 1, header.columnHeader, violated_values)
}

# #########################################################################################################
# # SAMPLES SHEET SOURCE SECTION VALIDATION RULES
# #########################################################################################################

# METADATA
# title: Organism name should not contain colon ( ) characters.
# description: Organism should not contain the actual ontology/taxonomy name, please include just the appropriate taxonomy term.
# custom:
#  rule_id: rule_s_200_100_001_03
#  type: WARNING
#  priority: HIGH
#  section: samples.source
rule_s_200_100_001_03 contains result if {
	file_column_header := "Characteristics[Organism]"
	some file_name, sheet in input.samples
	some header in sheet.table.headers

	header.columnHeader == file_column_header
	column_index := header.columnIndex

	column_name := sheet.table.columns[column_index]
	row_offset := sheet.table.rowOffset
	violated_values := {sprintf("[row: %03v, value: '%v']", [x, y]) |
		some j, value in sheet.table.data[column_name]
		contains(value, ":")
		x := (row_offset + j) + 1
		y := value
	}
	term_ref_sources = {source | some source in data.metabolights.validation.v2.controlLists.prioritisedOrganismRefSources}
	term_ref_sources_str = concat(", ", term_ref_sources)
	result := f.format_with_desc(rego.metadata.rule(), file_name, column_index + 1, header.columnHeader, violated_values, "Prioritized organism ontology reference sources", term_ref_sources_str)
}


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
	header.columnCategory == "Characteristics"

	default_headers := {t_header.columnHeader |
		some template in data.metabolights.validation.v2.templates.sampleFileHeaderTemplates
		template.version == "v1.0"
		some t_header in template.headers
		t_header.columnCategory == "Characteristics"
	}
	not header.columnHeader in default_headers
	column_name := input.samples[fileName].table.columns[header.columnIndex]
	violated_values := {sprintf("['%v', column index: %v]", [header.columnHeader, header.columnIndex]) |
		vals := { x | 
			some x in input.samples[fileName].table.data[column_name]
			count(trim_space(x)) > 0
		}
		count(vals) == 0
	}
	
	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Term Source REF of the user defined characteristics ontology term is not in the priotirised control list.
# description: We highly recommend to use the prioritised ontology Source Refs for the characteristics ontology term.
# custom:
#  rule_id: rule_s_200_100_002_02
#  type: WARNING
#  priority: MEDIUM
#  section: samples.source
rule_s_200_100_002_02 contains result if {
	searchHeader := "Term Source REF"
	
	input.samples[fileName].table.headers[columnIndex].additionalColumns[t] == searchHeader
	input.samples[fileName].table.headers[columnIndex].columnStructure == "ONTOLOGY_COLUMN"
	input.samples[fileName].table.headers[columnIndex].columnCategory == "Characteristics"

	columnName := input.samples[fileName].table.headers[columnIndex].columnName
	columnHeader := input.samples[fileName].table.headers[columnIndex].columnHeader

	not columnHeader in def._SAMPLES_DEFAULT_CHARACTERISTICS_HEADERS
	templates := data.metabolights.validation.v2.templates
	controlList := data.metabolights.validation.v2.controlLists.prioritisedDefaultTermRefSources
	sourceRefColumnIndex := (input.samples[fileName].table.headers[columnIndex].columnIndex + t) + 1
	sourceRefColumnName := input.samples[fileName].table.columns[sourceRefColumnIndex]

	count(input.samples[fileName].table.data[columnName]) > 0
	violatedValues = {sprintf("%v", [y]) |
		some j
		count(input.samples[fileName].table.data[columnName][j]) > 0
		count(input.samples[fileName].table.data[sourceRefColumnName][j]) > 0
		value := input.samples[fileName].table.data[sourceRefColumnName][j]
		not value in controlList
		y := value
	}
	count(violatedValues) > 0
	controlListStr := concat(", ", controlList)
	fileColumnHeader := sprintf("%v (of %v)", [searchHeader, columnHeader])
	sourceFile := fileName
	fileColumnIndex := sourceRefColumnIndex + 1
	result := f.format_with_desc(rego.metadata.rule(), sourceFile, fileColumnIndex, fileColumnHeader, violatedValues, "Prioritized ontology source references for characteristics", controlListStr)
}

# METADATA
# title: Term Source REF of the user defined characteristics ontology terms is empty
# description: We highly recommend to use the prioritised Ontology Source Refs for the characteristics ontology term.
# custom:
#  rule_id: rule_s_200_100_002_03
#  type: WARNING
#  priority: MEDIUM
#  section: samples.source
rule_s_200_100_002_03 contains result if {
	searchHeader := "Term Source REF"
	input.samples[fileName].table.headers[columnIndex].additionalColumns[t] == searchHeader
	input.samples[fileName].table.headers[columnIndex].columnStructure == "ONTOLOGY_COLUMN"
	input.samples[fileName].table.headers[columnIndex].columnCategory == "Characteristics"

	columnName := input.samples[fileName].table.headers[columnIndex].columnName
	columnHeader := input.samples[fileName].table.headers[columnIndex].columnHeader
	templates := data.metabolights.validation.v2.templates
	not columnHeader in def._SAMPLES_DEFAULT_CHARACTERISTICS_HEADERS

	row_offset := input.samples[fileName].table.rowOffset

	sourceRefColumnIndex := (input.samples[fileName].table.headers[columnIndex].columnIndex + t) + 1
	sourceRefColumnName := input.samples[fileName].table.columns[sourceRefColumnIndex]
	controlList := data.metabolights.validation.v2.controlLists.prioritisedDefaultTermRefSources
	count(input.samples[fileName].table.data[columnName]) > 0
	violatedValues = {sprintf("Row: %v", [y]) |
		some j
		count(input.samples[fileName].table.data[columnName][j]) > 0
		count(input.samples[fileName].table.data[sourceRefColumnName][j]) == 0
		y := (j + row_offset) + 1
	}
	count(violatedValues) > 0
	controlListStr := concat(", ", controlList)

	fileColumnHeader := sprintf("%v (of %v)", [searchHeader, columnHeader])
	sourceFile := fileName
	fileColumnIndex := sourceRefColumnIndex + 1
	result := f.format_with_desc(rego.metadata.rule(), sourceFile, fileColumnIndex, fileColumnHeader, violatedValues, "Prioritized ontology source references for characteristics", controlListStr)
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
	input.samples[fileName].table.headers[columnIndex].additionalColumns[t] == searchHeader
	input.samples[fileName].table.headers[columnIndex].columnStructure == "ONTOLOGY_COLUMN"
	input.samples[fileName].table.headers[columnIndex].columnCategory == "Characteristics"

	columnName := input.samples[fileName].table.headers[columnIndex].columnName
	columnHeader := input.samples[fileName].table.headers[columnIndex].columnHeader

	not columnHeader in def._SAMPLES_DEFAULT_CHARACTERISTICS_HEADERS

	row_offset := input.samples[fileName].table.rowOffset

	accession_number_column_index := (input.samples[fileName].table.headers[columnIndex].columnIndex + t) + 1
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
		# some j
		# value := input.samples[fileName].table.data[columnName][j]
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
	header.columnCategory == "Factor Value"
	columnIndex := header.columnIndex
	columnHeader := header.columnHeader
	columnName := input.samples[fileName].table.columns[columnIndex]
	rowOffset = input.samples[fileName].table.rowOffset

	non_empty_columns := {sprintf("['%v', column index: %v]", [header.columnHeader, header.columnIndex]) |
		header.columnCategory == "Factor Value"
		vals := { x | 
			some x in input.samples[fileName].table.data[columnName]
			count(trim_space(x)) > 0
		}
		count(vals) > 0
	}
	count(non_empty_columns) > 0
	violatedValues := f.empty_value_check(input.samples, fileName, columnName, rowOffset)
	sourceFile := fileName
	fileColumnIndex := columnIndex + 1
	fileColumnHeader := columnHeader
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
		header.columnCategory == "Factor Value"
		vals := { x | 
			some x in sheet.table.data[column_name]
			count(trim_space(x)) > 0
		}
		count(vals) < 2
	}
	
	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Term Source REFs of the factor ontology term not in the prioritised control list.
# description: We highly recommend to use the prioritised Ontology Source Refs for the factor ontology term.
# custom:
#  rule_id: rule_s_200_200_003_01
#  type: WARNING
#  priority: LOW
#  section: samples.sampleCollection
rule_s_200_200_003_01 contains result if {
	searchHeader := "Term Source REF"
	input.samples[fileName].table.headers[columnIndex].additionalColumns[t] == searchHeader
	input.samples[fileName].table.headers[columnIndex].columnStructure == "ONTOLOGY_COLUMN"
	input.samples[fileName].table.headers[columnIndex].columnCategory == "Factor Value"

	columnName := input.samples[fileName].table.headers[columnIndex].columnName
	columnHeader := input.samples[fileName].table.headers[columnIndex].columnHeader

	controlList := data.metabolights.validation.v2.controlLists.prioritisedStudyFactorRefSources
	sourceRefColumnIndex := (input.samples[fileName].table.headers[columnIndex].columnIndex + t) + 1
	sourceRefColumnName := input.samples[fileName].table.columns[sourceRefColumnIndex]

	count(input.samples[fileName].table.data[columnName]) > 0
	violatedValues = {sprintf("%v", [value]) |
		some j
		count(input.samples[fileName].table.data[columnName][j]) > 0
		count(input.samples[fileName].table.data[sourceRefColumnName][j]) > 0
		value := input.samples[fileName].table.data[sourceRefColumnName][j]
		not value in controlList
	}
	controlListStr := concat(", ", controlList)
	fileColumnHeader := sprintf("%v (of %v)", [searchHeader, columnHeader])
	sourceFile := fileName
	fileColumnIndex := sourceRefColumnIndex + 1
	result := f.format_with_desc(rego.metadata.rule(), sourceFile, fileColumnIndex, fileColumnHeader, violatedValues, "Prioritized ontology source references for this column", controlListStr)
}

