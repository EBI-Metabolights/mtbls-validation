package metabolights.validation.v2.rules.phase1.violations

import rego.v1
import data.metabolights.validation.v2.utils.functions as f
import data.metabolights.validation.v2.rules.phase1.definitions as def


# #########################################################################################################
# #########################################################################################################
# # ASSAY FILES
# #########################################################################################################
# #########################################################################################################


# METADATA
# title: Invalid multi-column structure in assay file.
# description: There is an invalid multi-column structure in assay file. Check column order.
# custom:
#  rule_id: rule_a_100_100_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_01 contains result if {
	some file_name, assay_file in input.assays
	some header in assay_file.table.headers
	header.columnStructure == "INVALID_MULTI_COLUMN"
	msg := sprintf("Assay file '%v': Invalid multi-column structure for '%v'['%v'] at column index '%v'", [file_name, header.columnPrefix, header.columnHeader, header.columnIndex])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Unordered or unlinked column structure in assay file.
# description: There is an unordered or unlinked column in assay file. Check column order.
# custom:
#  rule_id: rule_a_100_100_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_02 contains result if {
	some file_name, assay_file in input.assays
	some header in assay_file.table.headers
	header.columnStructure == "ADDITIONAL_COLUMN"
	msg := sprintf("Assay file '%v': Unordered '%v' column ['%v'] at column index '%v'", [file_name, header.columnPrefix, header.columnHeader, header.columnIndex])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Default columns not in assay file.
# description: Default columns must exist in assay file.
# custom:
#  rule_id: rule_a_100_100_001_03
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_03 contains result if {
	some file_name, assay_file in input.assays
	some header in assay_file.table.headers
	def := data.metabolights.validation.v2.rules.phase1.definitions 
	headers := {x | some j; x := assay_file.table.headers[j].columnHeader}
	values := [sprintf("['%v']", [x]) |
		some default_header in def._DEFAULT_ASSAY_HEADERS[file_name].headers
		# defaults[j].required == true
		not default_header.columnHeader in headers
		x := default_header.columnHeader
	]
	sourceFile := file_name
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}


# METADATA
# title: Unexpected column in assay file.
# description: Rename or remove unexpected columns in assay file.
# custom:
#  rule_id: rule_a_100_100_001_04
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_04 contains result if {
	some file_name, assay_file in input.assays

	def := data.metabolights.validation.v2.rules.phase1.definitions 
	values := {sprintf("[column: %v, header: '%v']", [x, y]) |
		some header in assay_file.headers

		not header.columnHeader in def._DEFAULT_ASSAY_HEADER_NAMES[file_name]
		header.columnCategory != "Parameter Value"
		header.columnCategory != "Protocol"
		header.columnCategory != "Comment"
		header.columnStructure != "LINKED_COLUMN"
		header.columnStructure != "ADDITIONAL_COLUMN"
		header.columnStructure != "INVALID_MULTI_COLUMN"

		y := header.columnHeader
		x := header.columnIndex + 1
	}
	sourceFile := file_name
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}

# METADATA
# title: Unexpected 'Protocol REF' column in assay file.
# description: Unexpected 'Protocol REF' column in assay file. Only one 'Protocol REF' header is allowed in assay file.
# custom:
#  rule_id: rule_a_100_100_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_05 contains result if {
	some file_name, _ in input.assays
	def := data.metabolights.validation.v2.rules.phase1.definitions 
	assay_protocol_headers := def.__ASSAY_PROTOCOL_HEADER_COLUMNS[file_name]
	default_protocol_headers := def.__ASSAY_DEFAULT_PROTOCOL_HEADERS[file_name]
	count(default_protocol_headers) < count(assay_protocol_headers)

	values := [sprintf("%v", [x]) |
		some i
		x := assay_protocol_headers[i] + 1
	]
	msg := sprintf("Extra Protocol REF column for the selected assay type. Expected Protocol REF column count is %v but found %v. Current protocol REF column indices: %v. Expected protocol REFs: %v", [count(default_protocol_headers), count(values), concat(", ", values), concat(", ", default_protocol_headers)])
	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: Missing 'Protocol REF' column in assay file.
# description: Add missing 'Protocol REF' column or related protocol section in assay file.
# custom:
#  rule_id: rule_a_100_100_001_06
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_06 contains result if {
	input.assays[fileName]
	def := data.metabolights.validation.v2.rules.phase1.definitions 
	assayProtocolHeaders := def.__ASSAY_PROTOCOL_HEADER_COLUMNS[fileName]
	defaultHeaders := def.__ASSAY_DEFAULT_PROTOCOL_HEADERS[fileName]
	count(defaultHeaders) > count(assayProtocolHeaders)

	values := [sprintf("%v", [x]) |
		some i
		x := assayProtocolHeaders[i] + 1
	]
	msg := sprintf("Missing Protocol REF column for the selected assay type. Expected Protocol REF column count is %v but found %v. Current protocol REF column index list: %v. Expected protocol REFs: %v", [count(defaultHeaders), count(values), concat(", ", values), concat(", ", defaultHeaders)])
	result := f.format(rego.metadata.rule(), msg, fileName)
}

# METADATA
# title: Empty columns in assay file.
# description: Empty columns must not exist in assay file. All column headers must be defined.
# custom:
#  rule_id: rule_a_100_100_001_07
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_07 contains result if {
	input.assays[i]
	headers := {sprintf("[column index: %v]", [y]) |
		some j
		header := input.assays[i].table.headers[j]
		x := trim(header.columnHeader, " ")
		count(x) == 0
		y := header.columnIndex + 1
	}
	count(headers) > 0
	source := i
	result := f.format_with_file_and_values(rego.metadata.rule(), source, headers)
}

# METADATA
# title: Order of default column header is not correct in assay file.
# description: Order of default column header is not correct in assay file.
# custom:
#  rule_id: rule_a_100_100_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_08 contains result if {
	
	some file_name, _ in input.assays
	def := data.metabolights.validation.v2.rules.phase1.definitions 
	
	headers := [header |
		some header in input.assays[file_name].table.headers
		header.columnHeader in def._DEFAULT_ASSAY_HEADER_NAMES[file_name]
		not endswith(header.columnHeader, " Data File")
	]

	count(headers) > 0
	
	default_headers := [header | some header in def._DEFAULT_ASSAY_HEADERS[file_name].headers; not endswith(header.columnHeader, " Data File")]

	matches := [sprintf("[Expected column at '%v': '%v', found '%v']", [x1, x2, x3]) |
		some j, header in headers
		header.columnHeader != default_headers[j].columnHeader
		x1 := header.columnIndex + 1
		x2 := default_headers[j].columnHeader
		x3 := header.columnHeader
	]

	sourceFile := file_name
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, matches)
}


# METADATA
# title: Multiple Parameter Value columns with same header are not allowed in assay file.
# description: Parameter Value column headers should be unique in assay file.
# custom:
#  rule_id: rule_a_100_100_001_09
#  type: WARNING
#  priority: HIGH
#  section: assays.columns
rule_a_100_100_001_09 contains result if {
	some file_name, _ in input.assays
	header_names := {header.columnHeader: same_headers |
		some header in input.assays[file_name].table.headers
		header.columnCategory == "Parameter Value"
		same_headers := [ idx|
			some x in input.assays[file_name].table.headers
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
# title: Column header name defined in template is not unique in assay file.
# description: Default column header name (except Data File and Protocol REF columns) should be unique in assay file.
# custom:
#  rule_id: rule_a_100_100_001_10
#  type: WARNING
#  priority: HIGH
#  section: assays.columns
rule_a_100_100_001_10 contains result if {
	templates := data.metabolights.validation.v2.templates
	def := data.metabolights.validation.v2.rules.phase1.definitions
	some file_name, _ in input.assays
	header_names := {header.columnHeader: same_headers |
		some header_set in def._DEFAULT_ASSAY_HEADERS[file_name]

		header_set.version == data.metabolights.validation.v2.rules.phase1.definitions.STUDY_TEMPLATE_VERSION
		
		some header in header_set.headers
		not startswith(header.columnHeader, "Comment[")
		not startswith(header.columnHeader, "Protocol REF")
		not endswith(header.columnHeader, " Data File")
		same_headers := [ idx |
			some x in input.assays[file_name].table.headers
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
# title: Assay Parameter Value names not in investigation file.
# description: Assay Parameter Value names must be referenced in i_Investigation.txt.
# custom:
#  rule_id: rule_a_100_100_001_11
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_11 contains result if {
	some file_name, assay in input.assays
	some study in input.investigation.studies
	input.investigation.studies
	parameter_names := { x.term | 
		some protocol in study.studyProtocols.protocols
		some x in protocol.parameters
	}
	assay_parameters := { param | 
		some header in assay.table.headers
		count(header.columnHeader) > 0
		startswith(header.columnHeader, "Parameter Value[")
		param1 := replace(header.columnHeader, "Parameter Value[", "")
		param := replace(param1, "]", "")
	}
	matches = assay_parameters - parameter_names

	result := f.format_with_file_description_and_values(rego.metadata.rule(), file_name, "Assay parameter(s) not referenced in i_Investigation.txt", matches)
}

# METADATA
# title: Column name defined in MetaboLights template does not exist in assay file.
# description: Add all missing columns defined in MetaboLights assay template.
# custom:
#  rule_id: rule_a_100_100_001_12
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_12 contains result if {
	templates := data.metabolights.validation.v2.templates
	def := data.metabolights.validation.v2.rules.phase1.definitions
	some file_name, assay_file in input.assays
	header_names := [header.columnHeader |
		some header in assay_file.table.headers
		not startswith(header.columnHeader, "Comment[")
		not startswith(header.columnHeader, "Protocol REF")
		not startswith(header.columnHeader, "Term Source REF")
		not startswith(header.columnHeader, "Term Accession Number")
		
	]
	some header_set in def._DEFAULT_ASSAY_HEADERS[file_name]
	header_set.version == def.STUDY_TEMPLATE_VERSION

	matches := [header.columnHeader |
		some header in header_set.headers
		not startswith(header.columnHeader, "Comment[")
		not startswith(header.columnHeader, "Protocol REF")
		not startswith(header.columnHeader, "Term Source REF")
		not startswith(header.columnHeader, "Term Accession Number")
		not header.columnHeader in header_names
		
	]
	count(matches) > 0
	result := f.format_with_file_and_values(rego.metadata.rule(), file_name, matches)
}




# METADATA
# title: Column header structure is not correct in assay file.
# description: Column header structure is not correct in assay file. Any ontology and unit column should have the leading columns, Term Source REF and Term Accession Number. Single columns must not have leading columns.
# custom:
#  rule_id: rule_a_100_100_001_13
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_13 contains result if {
	some file_name, assay_file in input.assays
	headers := {header |
		some header in assay_file.table.headers
		not startswith(header.columnHeader, "Comment[")
	}

	some technique_name, templates in data.metabolights.validation.v2.templates.assayFileHeaderTemplates

	technique_name == assay_file.assayTechnique.name

	some template in templates
	template.version == data.metabolights.validation.v2.rules.phase1.definitions.STUDY_TEMPLATE_VERSION

	unique_header_names := {header.columnHeader: columns | 
		some header in template.headers
		columns := [ x |
			some x in template.headers
			x.columnHeader == header.columnHeader
		]
	}
	default_headers := {header_name: first_header | 
		some header_name, header_list in unique_header_names
		first_header = header_list[0]	
	}
	some j, header in headers
	default_headers[header.columnHeader]
	header.columnStructure != default_headers[header.columnHeader].columnStructure
	x1 := header.columnIndex + 1
	x2 := header.columnHeader
	x3 := header.columnStructure
	x4 := default_headers[header.columnHeader].columnStructure
	msg = sprintf("[Column Index: %v: structure of '%v' column is '%v', but expected structure is '%v']", [x1, x2, x3, x4])
	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: Assay file not referenced in investigation file.
# description: Assay file must be referenced in i_Investigation.txt.
# custom:
#  rule_id: rule_a_100_100_002_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.filename
rule_a_100_100_002_01 contains result if {
	some file_name, _ in  input.assays
	some study in input.investigation.studies
	
	referenced_assay_files := {x.fileName | some x in study.studyAssays.assays}
	not file_name in referenced_assay_files
	
	msg := sprintf("Assay file '%v' is not referenced in i_Investigation.txt file. Expected '%v'", [file_name, study.fileName])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: There is no row in assay file.
# description: No row is defined in assay file. Add more than one row (run). Please ensure all samples, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_a_100_100_005_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.rows
rule_a_100_100_005_01 contains result if {
	input.assays[fileName].table.rowOffset == 0
	input.assays[fileName].table.totalRowCount == 0

	msg := sprintf("There is no row in the file '%v'.", [fileName])
	sourceFile := fileName
	# sourceColumnIndex := ""
	result := f.format(rego.metadata.rule(), msg, sourceFile)
}

# METADATA
# title: There is only one row in assay file.
# description: Only one row is defined in assay file. Add more than one row (run). Please ensure all sample, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_a_100_100_005_02
#  type: ERROR
#  priority: HIGH
#  section: assays.rows
rule_a_100_100_005_02 contains result if {
	some file_name, assay_file in input.assays
	assay_file.table.rowOffset == 0
	assay_file.table.totalRowCount == 1

	msg := sprintf("There is only one row in the file '%v'.", [file_name])
	result := f.format(rego.metadata.rule(), msg, file_name)
}
