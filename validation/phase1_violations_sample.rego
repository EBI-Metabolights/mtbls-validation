package metabolights.validation.v2.phase1.violations

import rego.v1
import data.metabolights.validation.v2.functions as f


#########################################################################################################
#########################################################################################################
# SAMPLES FILE
#########################################################################################################
#########################################################################################################

# METADATA
# title: Invalid multi-column structure in sample file.
# description: There is an invalid multi-column structure in sample file. Check column order.
# custom:
#  rule_id: rule_s_100_100_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_01 contains result if {
	some fileName
	some header in input.samples[fileName].table.headers
	header.columnStructure == "INVALID_MULTI_COLUMN"
	sourceFile := fileName
	fileColumnHeader := header.columnHeader
	fileColumnIndex := header.columnIndex + 1
	result := f.format_with_values(rego.metadata.rule(), sourceFile, fileColumnIndex, fileColumnHeader, ["Invalid multi-column structure"])
}

# METADATA
# title: Unordered or unlinked column structure in sample file.
# description: There is an unordered or unlinked column in sample file. Check column order.
# custom:
#  rule_id: rule_s_100_100_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_02 contains result if {
	some fileName, i
	header := input.samples[fileName].table.headers
	header[i].columnStructure == "ADDITIONAL_COLUMN"
	sourceFile := fileName
	fileColumnHeader := header[i].columnHeader
	fileColumnIndex := header[i].columnIndex + 1
	result := f.format_with_values(rego.metadata.rule(), sourceFile, fileColumnIndex, fileColumnHeader, ["Unordered/broken column structure"])
}

# METADATA
# title: Some default columns are missing in sample file.
# description: All default columns should exist in sample file.
# custom:
#  rule_id: rule_s_100_100_001_03
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_03 contains result if {
	some file_name
	input.samples[file_name]
	headers := {header.columnHeader | some header in input.samples[file_name].table.headers}
	def := data.metabolights.validation.v2.phase1.definitions
	values := {default_header.columnHeader |
		some name, default_header in def._DEFAULT_SAMPLE_FILE_HEADERS
		default_header.required == true
		not default_header.columnHeader in headers
	}
	count(values) > 0
	msg := sprintf("Missing default columns: %v", [concat(", ", values)])
	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: Unexpected column in sample file.
# description: Unexpected column in sample file. Only factor and characteristics columns can be defined in sample file.
# custom:
#  rule_id: rule_s_100_100_001_04
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_04 contains result if {
	some file_name, _ in input.samples
	def := data.metabolights.validation.v2.phase1.definitions
	headers := {sprintf("['%v', column index: %v]", [x, y]) |
	 	some j, header in input.samples[file_name].table.headers
		header.columnCategory != "Characteristics"
		header.columnCategory != "Protocol"
		header.columnCategory != "Comment"
		header.columnCategory != "Factor Value"
		header.columnStructure != "LINKED_COLUMN"
		header.columnStructure != "ADDITIONAL_COLUMN"
		header.columnStructure != "INVALID_MULTI_COLUMN"
		not header.columnHeader in def._DEFAULT_SAMPLE_HEADER_NAMES
		x := header.columnHeader
		y := header.columnIndex + 1
	}
	count(headers) > 0
	headers_str = concat(", ", headers)
	msg := sprintf("Unexpected column(s) in sample file '%v': %v", [file_name, headers_str])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Unexpected 'Protocol REF' column in sample file.
# description: Unexpected 'Protocol REF' column in sample file. Only one 'Protocol REF' header is allowed in sample file.
# custom:
#  rule_id: rule_s_100_100_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_05 contains result if {
	some file_name, _ in input.samples
	headers := {sprintf("['%v', column index: %v]", [x, y]) |
		some j, header in input.samples[file_name].table.headers
		header.columnCategory == "Protocol"
		x := header.columnHeader
		y := header.columnIndex + 1
	}
	count(headers) > 1
	headers_str = concat(", ", headers)
	msg := sprintf("There are multiple protocol columns in sample file '%v': %v", [file_name, headers_str])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: There is no Factor Value column in sample file.
# description: There should be at least one Factor Value column in sample file.
# custom:
#  rule_id: rule_s_100_100_001_06
#  type: ERROR
#  priority: HIGH
#  section: samples.columns
rule_s_100_100_001_06 contains result if {
	some file_name, _ in input.samples
	headers := {sprintf("['%v', column index: %v]", [x, y]) |
		some j, header in input.samples[file_name].table.headers
		startswith(header.columnHeader, "Factor Value[")
		x := header.columnHeader
		y := header.columnIndex + 1
	}
	count(headers) == 0
	msg := "Define at least one factor in i_Investigation.txt file and add Factor Value columns in sample file."
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Empty columns in sample file.
# description: Empty columns must not exist in sample file. All column headers should be defined.
# custom:
#  rule_id: rule_s_100_100_001_07
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_07 contains result if {
	some file_name, _ in input.samples
	headers := {sprintf("['%v', column index: %v]", [x, y]) |
		some header in input.samples[file_name].table.headers
		trimmed_value := trim(header.columnHeader, " ")
		count(trimmed_value) == 0
		x := header.columnHeader
		y := header.columnIndex + 1
	}
	count(headers) > 0
	source := file_name	
	result := f.format_with_file_and_values(rego.metadata.rule(), source, headers)
}

# METADATA
# title: Order of default column header is not correct in sample file.
# description: Order of default column header is not correct in sample file.
# custom:
#  rule_id: rule_s_100_100_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_08 contains result if {
	templates := data.metabolights.validation.v2.templates
	def := data.metabolights.validation.v2.phase1.definitions
	some file_name, _ in input.samples
	headers := [header |
		some header in input.samples[file_name].table.headers
		header.columnHeader in def._DEFAULT_SAMPLE_HEADER_NAMES
		header.columnCategory != "Comment"
	]
	
	default_headers := def.SELECTED_STUDY_SAMPLE_FILE_TEMPLATE_HEADERS
	matches := [sprintf("[Column Index: %v: '%v' is expected but found '%v' ]", [x1, x2, x3]) |
		some j, header in headers
		header.columnHeader != default_headers[j].columnHeader
		x1 := header.columnIndex + 1
		x2 := default_headers[j].columnHeader
		x3 := header.columnHeader
	]
	count(matches) > 0
	headers_str = concat(", ", matches)
	msg := sprintf("Column order is not valid in the file '%v'. Invalid column orders: %v", [file_name, headers_str])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Order of characteristics column header is not correct in sample file.
# description: Order of characteristics column header is not correct in sample file. All characteristics columns should be defined before Sample collection Protocol REF column.
# custom:
#  rule_id: rule_s_100_100_001_09
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_09 contains result if {
	some file_name, _ in input.samples
	def := data.metabolights.validation.v2.phase1.definitions
	headers := [header |
		some header in input.samples[file_name].table.headers
		header.columnCategory == "Characteristics"
		not header.columnHeader in def._DEFAULT_SAMPLE_HEADER_NAMES
	]
	count(headers) > 0
	some protocol_column in input.samples[i].table.headers
	protocol_column.columnCategory == "Protocol"

	protocol_index := protocol_column.columnIndex

	matches := [sprintf("[column: '%v' index: %v]", [x1, x2]) |
		header := headers[j]
		header.columnIndex >= protocol_index
		x1 := header.columnHeader
		x2 := header.columnIndex + 1
	]
	count(matches) > 0
	headers_str = concat(", ", matches)
	msg := sprintf("Characteristics column order is not correct in the sample file '%v'. Define them before Protocol REF column. Invalid column orders: %v", [file_name, headers_str])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Order of factor column header is not correct in sample file.
# description: Order of factor column header is not correct in sample file. All factor columns should be defined after Sample Name column.
# custom:
#  rule_id: rule_s_100_100_001_10
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_10 contains result if {
	some file_name, _ in input.samples
	headers := [header |
		some header in input.samples[file_name].table.headers
		header.columnCategory == "Factor Value"
	]
	count(headers) > 0
	input.samples[i].table.headers[protocol].columnCategory == "Protocol"
	protocol_index := input.samples[i].table.headers[protocol].columnIndex

	matches := [sprintf("[column: '%v' index: %v]", [x1, x2]) |
		header := headers[j]
		header.columnIndex < protocol_index
		x1 := header.columnHeader
		x2 := header.columnIndex + 1
	]
	count(matches) > 0
	headers_str = concat(", ", matches)
	msg := sprintf("Factor column order is not correct in the sample file '%v'. Columns should be defined after Protocol REF column: Invalid column orders: %v", [i, headers_str])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Column header structure is not correct in sample file.
# description: Column header structure is not correct in sample file. Any ontology and unit column should have the leading columns, Term Source REF and Term Accession Number. Single columns must not have leading columns.
# custom:
#  rule_id: rule_s_100_100_001_11
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_11 contains result if {
	templates := data.metabolights.validation.v2.templates
	some file_name, _ in input.samples
	
	headers := {header |
		some header in input.samples[file_name].table.headers
		data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS[header.columnHeader]
		not startswith(header.columnHeader, "Comment[")
	}
	default_headers := data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS
	matches := [sprintf("[Column Index: %v: structure of '%v' column is '%v', but expected structure is '%v']", [x1, x2, x3, x4]) |
		
		some header in headers
		default_headers[header.columnHeader]
		header.columnStructure != default_headers[header.columnHeader].columnStructure
		default_headers[header.columnHeader]
		x1 := header.columnIndex + 1
		x2 := default_headers[header.columnHeader].columnHeader
		x3 := header.columnStructure
		x4 := default_headers[header.columnHeader].columnStructure
	]

	count(matches) > 0
	headers_str = concat(", ", matches)
	result := f.format_with_file_and_values(rego.metadata.rule(), file_name, matches)
}

# METADATA
# title: Factor Value column structure is not correct in sample file.
# description: Factor Value column structure should be ontology (with Term Source REF and Term Accession Number) or a value with unit (and Term Source REF and Term Accession Number) in sample file.
# custom:
#  rule_id: rule_s_100_100_001_12
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_12 contains result if {
	templates := data.metabolights.validation.v2.templates
	def := data.metabolights.validation.v2.phase1.definitions
	some file_name, _ in input.samples
	headers := {header |
		some header in input.samples[file_name].table.headers
		not header.columnHeader in def._DEFAULT_SAMPLE_HEADER_NAMES
		header.columnCategory == "Factor Value"
	}

	matches := [sprintf("[Column Index: %v: The structure of '%v' factor value column is '%v']", [x1, x2, x3]) |
		some j, header in headers
		not header.columnStructure in {"ONTOLOGY_COLUMN", "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"}
		x1 := header.columnIndex + 1
		x2 := header.columnHeader
		x3 := header.columnStructure
	]

	
	count(matches) > 0
	headers_str = concat(", ", matches)
	# msg := sprintf("Column structure is not valid in the file '%v'. Invalid columns: %v", [file_name, headers_str])
	# source := file_name
	result := f.format_with_file_and_values(rego.metadata.rule(), file_name, matches)
}


# METADATA
# title: Additional characteristics column structure is not correct in sample file.
# description: Additional characteristics column structure should be ontology (with Term Source REF and Term Accession Number) or a value with unit (and Term Source REF and Term Accession Number) in sample file.
# custom:
#  rule_id: rule_s_100_100_001_13
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_13 contains result if {
	templates := data.metabolights.validation.v2.templates
	def := data.metabolights.validation.v2.phase1.definitions
	some file_name, _ in input.samples
	headers := {header |
		some header in input.samples[file_name].table.headers
		not header.columnHeader in def._DEFAULT_SAMPLE_HEADER_NAMES
		startswith(header.columnHeader, "Characteristics[")
	}

	matches := [sprintf("[Column Index: %v: The structure of '%v' characteristics column is '%v']", [x1, x2, x3]) |
		some j, header in headers
		not header.columnStructure in {"ONTOLOGY_COLUMN", "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"}
		x1 := header.columnIndex + 1
		x2 := header.columnHeader
		x3 := header.columnStructure
	]

	count(matches) > 0
	headers_str = concat(", ", matches)
	result := f.format_with_file_and_values(rego.metadata.rule(), file_name, matches)
}


# METADATA
# title: Multiple Characteristics / Factor Value columns with same header are not allowed in sample file.
# description: Characteristics and Factor Value column headers should be unique in sample file.
# custom:
#  rule_id: rule_s_100_100_001_14
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_14 contains result if {
	some file_name, _ in input.samples
	header_names := {header.columnHeader: same_headers |
		some header in input.samples[file_name].table.headers
		header.columnCategory in {"Characteristics", "Factor Value"}
		same_headers := [ idx|
			some x in input.samples[file_name].table.headers
			x.columnHeader == header.columnHeader
			idx := x.columnIndex + 1 
		]
	}
	matches := {sprintf("[Multiple '%v' columns. Column indices: '%v']", [x1, x2]) |
		some header_name, column_indices in header_names
		count(column_indices) > 1
		x1 := header_name
		x2 := column_indices
	}
	count(matches) > 0
	result := f.format_with_file_and_values(rego.metadata.rule(), file_name, matches)
}


# METADATA
# title: Missing Factor Value columns in sample file.
# description: There should be a Factor Value column in sample file for each study factor.
# custom:
#  rule_id: rule_s_100_100_001_15
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_15 contains result if {
	some file_name, sheet in input.samples

	some study in input.investigation.studies
	file_name == study.fileName
	investigation_factors := { factor.name |
		some factor in study.studyFactors.factors
	}
	factor_values := { param | 
		some header in sheet.table.headers
		count(header.columnHeader) > 0
		startswith(header.columnHeader, "Factor Value[")
		param1 := replace(header.columnHeader, "Factor Value[", "")
		param := replace(param1, "]", "")
	}
	
	missing := investigation_factors - factor_values
	count(missing) > 0
	missing_factor_values := { sprintf("Factor Value[%v]", [x]) | some x in missing }
	missing_factor_values_str = concat(", ", missing_factor_values)
	missing_factors_str = concat(", ", missing)
	msg := sprintf("Add factor value column(s): %v for factor(s): %v", [missing_factor_values_str, missing_factors_str])
	result := f.format(rego.metadata.rule(), msg, file_name)
}


# METADATA
# title: Unexpected Factor Value columns in sample file.
# description: There should be a study factor for each Factor Value column in sample file.
# custom:
#  rule_id: rule_s_100_100_001_16
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_16 contains result if {
	some file_name, sheet in input.samples

	some study in input.investigation.studies
	file_name == study.fileName
	investigation_factors := { factor.name |
		some factor in study.studyFactors.factors
	}
	factor_values := { param | 
		some header in sheet.table.headers
		count(header.columnHeader) > 0
		startswith(header.columnHeader, "Factor Value[")
		param1 := replace(header.columnHeader, "Factor Value[", "")
		param := replace(param1, "]", "")
	}
	
	extra := factor_values - investigation_factors
	count(extra) > 0
	extra_factor_values := { sprintf("Factor Value[%v]", [x]) | some x in extra }
	extra_factor_values_str = concat(", ", extra_factor_values)
	extra_factors_str = concat(", ", extra)
	msg := sprintf("Add factor(s) %v in i_Investigation.txt for Factor Value columns defined in the sample file: %v", [extra_factors_str, extra_factor_values_str])
	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: There is no row in sample file.
# description: No row is defined in sample file. Add more than one row (sample). Please ensure all xxx, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_s_100_100_002_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.rows
rule_s_100_100_002_01 contains result if {
	input.samples[fileName].table.rowOffset == 0
	input.samples[fileName].table.totalRowCount < 1

	msg := sprintf("There is no row in file '%v'.", [fileName])
	sourceFile := fileName
	# sourceColumnIndex := ""
	result := f.format(rego.metadata.rule(), msg, sourceFile)
}

# METADATA
# title: There is only one row in sample file.
# description: Only one row is defined in sample file. Add more than one row (sample). Please ensure all xxx, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_s_100_100_002_02
#  type: ERROR
#  priority: HIGH
#  section: samples.rows
rule_s_100_100_002_02 contains result if {
	input.samples[fileName].table.rowOffset == 0
	input.samples[fileName].table.totalRowCount == 1

	msg := sprintf("Only one row is defined in '%v'.", [fileName])
	source := fileName
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Sample file not referenced in investigation file.
# description: Only one sample file is allowed and its name should be 's_(accession number).txt'.
# custom:
#  rule_id: rule_s_100_100_003_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.filename
rule_s_100_100_003_01 contains result if {
	
	referenced_samples := { study.fileName |
		some study in input.investigation.studies
	}
	some sample_file_name, sample in input.samples
	not sample_file_name in referenced_samples
	sample_file_names := concat(", ", referenced_samples)
	msg := sprintf("Sample file '%v' is not referenced in investigation file. Expected '%v'", [sample_file_name, sample_file_names])
	source := sample_file_name
	result := f.format(rego.metadata.rule(), msg, source)
}
