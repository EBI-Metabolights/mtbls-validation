package metabolights.validation.v2.utils.functions
import data.metabolights.validation.v2.utils.field_match as field_match

import rego.v1
__DEBUG__MESSAGE := data.metabolights.validation.v2.configuration.debug
__MAX_VALUE_COUNT := data.metabolights.validation.v2.configuration.violatedValueListMaxLength

debug(message) := result if {
	__DEBUG__MESSAGE == 1
	print(message)
	result := message
}

debug(message) := result if  {
	__DEBUG__MESSAGE != 1
	result := message
}

format_schema_error(meta, errors) := result if {
	items := [x.error | some x in errors]
	sliced_violated_values := array.slice(items, 0, __MAX_VALUE_COUNT)
	values_str := concat(", ", sliced_violated_values)
	has_more_violations := count(errors) > __MAX_VALUE_COUNT
	
	result := {
		"identifier": meta.custom.rule_id,
		"title": meta.title,
		"description": meta.description,
		"type": meta.custom.type,
		"priority": meta.custom.priority,
		"section": meta.custom.section,
		"sourceFile": "input",
		"sourceColumnIndex": "",
		"sourceColumnHeader": "",
		"values": [],
		"hasMoreViolations": has_more_violations,
		"totalViolations": count(items),
		"violation": values_str,
	}
}

format(meta, msg, source_file) := result if {
	result := {
		"identifier": meta.custom.rule_id,
		"title": meta.title,
		"description": meta.description,
		"type": meta.custom.type,
		"priority": meta.custom.priority,
		"section": meta.custom.section,
		"sourceFile": source_file,
		"sourceColumnIndex": "",
		"sourceColumnHeader": "",
		"values": [],
		"hasMoreViolations": false,
		"totalViolations": 1,
		"violation": msg,
	}
}

format_with_file_and_values(meta, source_file, values) := result if {
	count(values) > 0
	items := [x | some i; x := values[i]]
	sliced_violated_values := array.slice(items, 0, __MAX_VALUE_COUNT)
	values_str := concat(", ", sliced_violated_values)
	has_more_violations := count(values) > __MAX_VALUE_COUNT
	result := {
		"identifier": meta.custom.rule_id,
		"title": meta.title,
		"description": meta.description,
		"type": meta.custom.type,
		"priority": meta.custom.priority,
		"section": meta.custom.section,
		"sourceFile": source_file,
		"sourceColumnIndex": "",
		"sourceColumnHeader": "",
		"values": sliced_violated_values,
		"hasMoreViolations": has_more_violations,
		"totalViolations": count(items),
		"violation": sprintf("'%v': %v", [source_file, values_str]),
	}
}

format_with_file_description_and_values(meta, source_file, description, values) := result if {
	count(values) > 0
	items := [x | some i; x := values[i]]
	sliced_violated_values := array.slice(items, 0, __MAX_VALUE_COUNT)
	values_str := concat(", ", sliced_violated_values)
	has_more_violations := count(values) > __MAX_VALUE_COUNT
	result := {
		"identifier": meta.custom.rule_id,
		"title": meta.title,
		"description": meta.description,
		"type": meta.custom.type,
		"priority": meta.custom.priority,
		"section": meta.custom.section,
		"sourceFile": source_file,
		"sourceColumnIndex": "",
		"sourceColumnHeader": "",
		"values": sliced_violated_values,
		"hasMoreViolations": has_more_violations,
		"totalViolations": count(items),
		"violation": sprintf("'%v', %v, violated values: %v", [source_file, description, values_str]),
	}
}

format_with_values(meta, source_file, source_column_index, source_column_header, violated_values) := result if {
	count(violated_values) > 0
	items := [x | some i; x := violated_values[i]]
	sliced_violated_values := array.slice(items, 0, __MAX_VALUE_COUNT)
	sliced_violated_values_str := concat(", ", sliced_violated_values)
	has_more_violations := count(violated_values) > __MAX_VALUE_COUNT
	result := {
		"identifier": meta.custom.rule_id,
		"title": meta.title,
		"description": meta.description,
		"type": meta.custom.type,
		"priority": meta.custom.priority,
		"section": meta.custom.section,
		"sourceFile": source_file,
		"sourceColumnIndex": source_column_index,
		"sourceColumnHeader": source_column_header,
		"values": sliced_violated_values,
		"hasMoreViolations": has_more_violations,
		"totalViolations": count(items),
		"violation": sprintf("Violation on '%v' header [at column index %v] in '%v': %v", [source_column_header, source_column_index, source_file, sliced_violated_values_str]),
	}
}

format_with_unique_values(meta, source_file, source_column_index, source_column_header, unique_values) := result if {
	unique_values_str := concat(",", unique_values)
	violation_str := [source_column_header, source_column_index, source_file, unique_values_str]
	result := {
		"identifier": meta.custom.rule_id,
		"title": meta.title,
		"description": meta.description,
		"type": meta.custom.type,
		"priority": meta.custom.priority,
		"section": meta.custom.section,
		"sourceFile": source_file,
		"sourceColumnIndex": source_column_index,
		"sourceColumnHeader": source_column_header,
		"values": unique_values,
		"hasMoreViolations": false,
		"totalViolations": 1,
		"violation": sprintf("Unique values on '%v' column [at column index %v] in '%v': %v", violation_str),
	}
}

format_with_desc(meta, source_file, source_column_index, source_column_header, violated_values, descriptionPrefix, description) := result if {
	count(violated_values) > 0
	items := [x | some i; x := violated_values[i]]
	sliced_violated_values := array.slice(items, 0, __MAX_VALUE_COUNT)
	sliced_violated_values_str := concat(", ", sliced_violated_values)
	has_more_violations := count(violated_values) > __MAX_VALUE_COUNT
	violation_str := [source_column_header, source_column_index, source_file, sliced_violated_values_str]
	result := {
		"identifier": meta.custom.rule_id,
		"title": meta.title,
		"description": sprintf("%v %v: %v", [meta.description, descriptionPrefix, description]),
		"type": meta.custom.type,
		"priority": meta.custom.priority,
		"section": meta.custom.section,
		"sourceFile": source_file,
		"sourceColumnIndex": source_column_index,
		"sourceColumnHeader": source_column_header,
		"values": sliced_violated_values,
		"hasMoreViolations": has_more_violations,
		"totalViolations": count(items),
		"violation": sprintf("Violated values on '%v' column [at column index %v] in '%v': %v", violation_str),
	}
	result
}

format_summary(meta, source_file, source_column_index, source_column_header, msg) := {
	"identifier": meta.custom.rule_id,
	"title": meta.title,
	"description": meta.description,
	"type": meta.custom.type,
	"priority": meta.custom.priority,
	"section": meta.custom.section,
	"sourceFile": source_file,
	"sourceColumnIndex": source_column_index,
	"sourceColumnHeader": source_column_header,
	"values": [],
	"hasMoreViolations": false,
	"totalViolations": 1,
	"violation": sprintf("%v", [msg]),
}

# to_string(var) := result if {
#     result := concat(", ", var)
# }

to_string(var) := concat(", ", var)

min_length_check(source, file_name, column_name, min_length, row_offset) := violated_values if {
	violated_rows := [sprintf("[row: %v, value: '%v']", [x, y]) |
		some j, value in source[file_name].table.data[column_name]
		count(value) > 0
		count(trim_space(value)) < min_length
		x := (row_offset + j) + 1
		y := source[file_name].table.data[column_name][j]
	]
	violated_values := violated_rows
}

max_length_check(source, file_name, column_name, max_length, row_offset) := violated_values if {
	violated_values := [sprintf("[row: %v, value: '%v' (length: %v)]", [x, y, z]) |
		some j, value in source[file_name].table.data[column_name]
		value_count := count(value)
		value_count > max_length

		x := (row_offset + j) + 1
		y := source[file_name].table.data[column_name][j]
		z := value_count
	]
}

empty_value_check(source, file_name, column_name, row_offset) := violated_values if {
	violated_values := [x |
		some j, column_value in source[file_name].table.data[column_name]
		count(trim_space(column_value)) == 0
		x := sprintf("[row %v]", [(row_offset + j) + 1])
	]
}

in_control_list_check(source, file_name, column_name, control_list, rowOffset) := violated_values if {
	some column_index
	source[file_name].table.columns[column_index] == column_name
	violated_values := {sprintf("[row: %v, value: '%v']", [x, y]) |
		some j, value in source[file_name].table.data[column_name]
		lower(trim_space(value)) in control_list
		x := (rowOffset + j) + 1
		y := value
	}
}

protocol_ref_column_value_check(source, file_name, column_name, expected_value, rowOffset) := violated_values if {
	some i
	source[file_name].table.headers[i].columnName == column_name

	# column_header := source[file_name].table.headers[i].columnHeader
	violated_rows = {sprintf("[row: %v, value: '%v']", [x, y]) |
		some j
		source[file_name].table.data[column_name][j] != expected_value
		x := (rowOffset + j) + 1
		y := source[file_name].table.data[column_name][j]
	}
	violated_values := violated_rows
}

######################

term_source_ref_not_valid(
	meta, 
	study_category,
	template_version,
	study_created_at,
	template_name, 
	isa_table_type, 
	table, 
	file_name, 
	header_index, 
	selected_validation_types, 
	control_lists, 
	control_list_key,
	description_suffix
) := result if {
	search_header := "Term Source REF"
	header := table.headers[header_index]
	some t, "Term Source REF"  in header.additionalColumns
	not "Unit" in header.additionalColumns
	column_header := header.columnHeader
	control_list := control_lists[control_list_key]
	selected_controls = [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria, 
			template_version,
			study_category, 
			study_created_at,
			isa_table_type,
			template_name, null, null)
	]
	count(selected_controls) > 0
	control := selected_controls[0]
	control.validationType in selected_validation_types
	ontologies = {x | 
		control.validationType in {"any-ontology-term", "ontology-term-in-selected-ontologies"}
		some x in control.ontologies
	}
	other_sources = { x.sourceLabel | some x in control.allowedOtherSources}
	parent_sources = { x.termSourceRef | 
		control.validationType == "child-ontology-term"
		some x in control.allowedParentOntologyTerms.parents
	}
	all_sources := ontologies | other_sources | parent_sources
	term_name = table.columns[header.columnIndex]
	source_ref_column_index := (header.columnIndex + t) + 1
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := (header.columnIndex + t) + 2
	accession_column_name := table.columns[accession_column_index]

	violated_values = {sprintf("Row: %v, column: Term Source REF of %v, value: %v", [j + 1, column_header, source_ref]) |
		some j
		count(table.data[column_name][j]) > 0
		source_ref := table.data[source_ref_column_name][j]
		accession := table.data[accession_column_name][j]
		term := table.data[term_name][j]
		missing_excludes = {x.termAccessionNumber |
			some x in control.allowedMissingOntologyTerms
			term == x.term 
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		placeholder_excludes = {x.termAccessionNumber |
			some x in control.allowedPlaceholders
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		other_source_excludes := {x |
			some x in control.allowedOtherSources
			startswith(accession, x.accessionPrefix)
			upper(source_ref) == upper(x.sourceLabel)
		}

		excludes = missing_excludes | placeholder_excludes | other_source_excludes
		count(excludes) == 0
		not all_sources[source_ref]
	}
	count(violated_values) > 0
	ontologies_str := concat(", ", ontologies)
	file_column_header := sprintf("%v (of %v)", [search_header, column_header])
	desc := sprintf("%v: %v", [control.ruleName, description_suffix])
	file_column_index := source_ref_column_index + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, ontologies_str)
}


single_ontology_term_source_ref_not_valid(
	meta, 
	file_name,
	control,
	ontology_term,
	field_name,
	description_suffix,
	selected_validation_types
) := result if {
	
	control.validationType in selected_validation_types
	ontologies := {x | 
		control.validationType in {"any-ontology-term", "ontology-term-in-selected-ontologies"}
		some x in control.ontologies
	}

	other_sources := { x.sourceLabel | some x in control.allowedOtherSources}
	parent_sources := { x.termSourceRef | 
		control.validationType == "child-ontology-term"
		some x in control.allowedParentOntologyTerms.parents
	}
	all_sources := ontologies | other_sources | parent_sources
	source_ref := ontology_term.termSourceRef
	accession := ontology_term.termAccessionNumber
	term := ontology_term.term

	missing_excludes := {x.termAccessionNumber |
		some x in control.allowedMissingOntologyTerms
		term == x.term 
		accession == x.termAccessionNumber
		source_ref == x.termSourceRef
	}
	placeholder_excludes := {x.termAccessionNumber |
		some x in control.allowedPlaceholders
		accession == x.termAccessionNumber
		source_ref == x.termSourceRef
	}
	other_source_excludes := {x |
		some x in control.allowedOtherSources
		startswith(accession, x.accessionPrefix)
		upper(source_ref) == upper(x.sourceLabel)
	}
	excludes := missing_excludes | placeholder_excludes | other_source_excludes
	count(excludes) == 0
	
	not all_sources[source_ref]
	
	ontologies_str := concat(", ", ontologies)
	
	file_column_header := sprintf("%v (of %v): [%v, %v, %v]", ["Term Source REF", field_name, term, source_ref, accession])
	values = [file_column_header]
	desc := sprintf("Rule %v: Term Source REF of %v. %v %v", [control.ruleName, field_name, description_suffix, ontologies_str])
	result := format_with_file_description_and_values(meta, file_name, desc, values)
}

run_validation_rule_single_ontology_term(
	meta, 
	file_name,
	control,
	ontology_term,
	field_name,
	description_suffix,
) := result if {

	control.validationType == "selected-ontology-term"
	result := single_ontology_term_not_in_selected_terms(
		meta, 
		file_name,
		control,
		ontology_term,
		field_name,
		description_suffix,
	)
	
}

run_validation_rule_single_ontology_term(
	meta, 
	file_name,
	control,
	ontology_term,
	field_name,
	description_suffix,
) := result if {
	selected_validation_types := {"child-ontology-term", "ontology-term-in-selected-ontologies"}
	control.validationType in selected_validation_types
	result := single_ontology_term_source_ref_not_valid(
		meta, 
		file_name,
		control,
		ontology_term,
		field_name,
		description_suffix,
		selected_validation_types
	)
}

single_ontology_term_not_in_selected_terms(
	meta, 
	file_name,
	control,
	ontology_term,
	field_name,
	description_suffix,
) := result if {
	control.validationType in {"selected-ontology-term"}
	
	terms = {sprintf("[%v, %v, %v]", [x.term, x.termSourceRef, x.termAccessionNumber]) | some x in control.terms }
	source_ref := ontology_term.termSourceRef
	accession := ontology_term.termAccessionNumber
	term := ontology_term.term
	missing_excludes := {x.termAccessionNumber |
		some x in control.allowedMissingOntologyTerms
		term == x.term 
		accession == x.termAccessionNumber
		source_ref == x.termSourceRef
	}
	placeholder_excludes := {x.termAccessionNumber |
		some x in control.allowedPlaceholders
		accession == x.termAccessionNumber
		source_ref == x.termSourceRef
	}
	other_source_excludes := {x |
		some x in control.allowedOtherSources
		startswith(accession, x.accessionPrefix)
		upper(source_ref) == upper(x.sourceLabel)
	}
	
	excludes = missing_excludes | placeholder_excludes | other_source_excludes
	count(excludes) == 0
	
	term_str = sprintf("[%v, %v, %v]", [term, source_ref, accession])
	not term_str in terms
	terms_str := concat(", ", terms)
	file_column_header := sprintf("%v (of %v)", ["Term Source REF", field_name])
	desc := sprintf("%v: %v: %v", [control.ruleName, description_suffix, terms_str])	
	result := format_with_file_description_and_values(meta, file_name, desc, [term_str])
}

single_ontology_term_has_unexpected_value(
	meta, 
	file_name,
	control,
	ontology_term,
	field_name,
	description_suffix,
) := result if {
		
	source_ref := ontology_term.termSourceRef
	accession := ontology_term.termAccessionNumber
	term := ontology_term.term
	count(term) > 0
	missing_excludes = {x.termAccessionNumber |
		some x in control.allowedMissingOntologyTerms
		term == x.term 
		accession == x.termAccessionNumber
		source_ref == x.termSourceRef
	}
	placeholder_excludes = {x.termAccessionNumber |
		some x in control.allowedPlaceholders
		accession == x.termAccessionNumber
		source_ref == x.termSourceRef
	}
	other_source_excludes := {x |
		some x in control.allowedOtherSources
		startswith(accession, x.accessionPrefix)
		upper(source_ref) == upper(x.sourceLabel)
	}

	excludes = missing_excludes | placeholder_excludes | other_source_excludes
	count(excludes) == 0		
	lower(term) in control.unexpected_terms

	terms_str := concat(", ", control.unexpected_terms)
	file_column_header := sprintf("%v (of %v)", ["Term Source REF", field_name])

	desc := sprintf("%v: %v: %v", [control.ruleName, description_suffix, terms_str])
	result := format_with_file_description_and_values(meta, file_name, desc, term)
}

ontology_term_has_unexpected_value(
	meta, 
	study_category,
	template_version,
	study_created_at,
	template_name, 
	isa_table_type, 
	table, 
	file_name, 
	header_index, 
	selected_validation_types, 
	control_lists, 
	control_list_key,
	description_suffix
) := result if {
	search_header := "Term Source REF"
	header := table.headers[header_index]
	some t, "Term Source REF"  in header.additionalColumns
	column_header := header.columnHeader
	control_list := control_lists[control_list_key]
	selected_controls = [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria, 
			template_version,
			study_category, 
			study_created_at,
			isa_table_type,
			template_name, null, null)
	]
	count(selected_controls) > 0
	control := selected_controls[0]
	control.validationType in selected_validation_types
	count(control.unexpectedTerms) > 0
	# print(meta.custom.rule_id, header.columnHeader )

	term_name = table.columns[header.columnIndex]
	source_ref_column_index := (header.columnIndex + t) + 1
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := (header.columnIndex + t) + 2
	accession_column_name := table.columns[accession_column_index]
	

	violated_values = {sprintf("Row: %v, column: %v, value: [%v, %v ,%v]", [j + 1, column_header, term, source_ref, accession]) |
		some j
		term := table.data[term_name][j]
		count(table.data[column_name][j]) > 0
		lower(term) in control.unexpectedTerms
		source_ref := table.data[source_ref_column_name][j]
		accession := table.data[accession_column_name][j]
		
		missing_excludes = {x.termAccessionNumber |
			some x in control.allowedMissingOntologyTerms
			term == x.term 
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		placeholder_excludes = {x.termAccessionNumber |
			some x in control.allowedPlaceholders
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		other_source_excludes := {x |
			some x in control.allowedOtherSources
			startswith(accession, x.accessionPrefix)
			upper(source_ref) == upper(x.sourceLabel)
		}

		excludes = missing_excludes | placeholder_excludes | other_source_excludes
		count(excludes) == 0
		
	}
	count(violated_values) > 0
	unexpected_terms_str := concat(", ", control.unexpectedTerms)
	file_column_header := sprintf("%v", [column_header])
	desc := sprintf("%v: %v.", [control.ruleName, description_suffix])
	file_column_index := header.columnIndex + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, unexpected_terms_str)
}


single_column_has_unexpected_value(
	meta, 
	study_category,
	template_version,
	study_created_at,
	template_name, 
	isa_table_type, 
	table, 
	file_name, 
	header_index, 
	control_lists, 
	control_list_key,
	description_suffix
) := result if {
	header := table.headers[header_index]
	column_header := header.columnHeader
	control_list := control_lists[control_list_key]
	selected_controls = [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria, 
			template_version,
			study_category, 
			study_created_at,
			isa_table_type,
			template_name, null, null)
	]
	count(selected_controls) > 0
	control := selected_controls[0]
	count(control.unexpectedTerms) > 0
	# print(meta.custom.rule_id, header.columnHeader )

	term_name = table.columns[header.columnIndex]	

	violated_values = {sprintf("Row: %v, column: %v, value: %v", [j + 1, column_header, term]) |
		some j
		term := table.data[term_name][j]
		count(table.data[column_name][j]) > 0
		lower(term) in control.unexpectedTerms
		
		missing_excludes = {x.termAccessionNumber |
			some x in control.allowedMissingOntologyTerms
			term == x.term 
		}
		placeholder_excludes = {x.termAccessionNumber |
			some x in control.allowedPlaceholders
		}
		excludes = missing_excludes | placeholder_excludes 
		count(excludes) == 0
		
	}
	count(violated_values) > 0
	unexpected_terms_str := concat(", ", control.unexpectedTerms)
	file_column_header := sprintf("%v", [column_header])
	desc := sprintf("%v: %v.", [control.ruleName, description_suffix])
	file_column_index := header.columnIndex + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, unexpected_terms_str)
}

ontology_term_not_in_selected_terms(
	meta, 
	study_category,
	template_version,
	study_created_at,
	template_name, 
	isa_table_type, 
	table, 
	file_name, 
	header_index, 
	selected_validation_types, 
	control_lists, 
	control_list_key,
	description_suffix
) := result if {
	search_header := "Term Source REF"
	header := table.headers[header_index]
	some t, "Term Source REF"  in header.additionalColumns
	not "Unit" in header.additionalColumns
	column_header := header.columnHeader
	control_list := control_lists[control_list_key]
	selected_controls = [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria, 
			template_version,
			study_category, 
			study_created_at,
			isa_table_type,
			template_name, null, null)
	]
	count(selected_controls) > 0
	control := selected_controls[0]
	control.validationType in selected_validation_types

	terms = {sprintf("[%v, %v, %v]", [x.term, x.termSourceRef, x.termAccessionNumber]) | some x in control.terms }
	
	term_name = table.columns[header.columnIndex]
	source_ref_column_index := (header.columnIndex + t) + 1
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := (header.columnIndex + t) + 2
	accession_column_name := table.columns[accession_column_index]

	violated_values = {sprintf("Row: %v, column: %v, value: [%v, %v ,%v]", [j + 1, column_header, term, source_ref, accession]) |
		some j
		count(table.data[column_name][j]) > 0
		source_ref := table.data[source_ref_column_name][j]
		accession := table.data[accession_column_name][j]
		term := table.data[term_name][j]
		missing_excludes = {x.termAccessionNumber |
			some x in control.allowedMissingOntologyTerms
			term == x.term 
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		placeholder_excludes = {x.termAccessionNumber |
			some x in control.allowedPlaceholders
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		other_source_excludes := {x |
			some x in control.allowedOtherSources
			startswith(accession, x.accessionPrefix)
			upper(source_ref) == upper(x.sourceLabel)
		}

		excludes = missing_excludes | placeholder_excludes | other_source_excludes

		count(excludes) == 0
		term_key := sprintf("[%v, %v, %v]", [term, source_ref, accession])
		not terms[term_key]
	}
	count(violated_values) > 0
	terms_str := concat(", ", terms)
	file_column_header := sprintf("%v (of %v) - %v", [search_header, column_header])
	desc := sprintf("%v: %v", [control.ruleName, description_suffix])
	file_column_index := source_ref_column_index + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, terms_str)
}


term_value_not_in_selected_terms(
	meta, 
	study_category,
	template_version,
	study_created_at,
	template_name, 
	isa_table_type, 
	table, 
	file_name, 
	header_index, 
	selected_validation_types, 
	control_lists, 
	control_list_key,
	description_suffix
) := result if {
	header := table.headers[header_index]
	column_header := header.columnHeader
	control_list := control_lists[control_list_key]
	selected_controls = [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria, 
			template_version,
			study_category, 
			study_created_at,
			isa_table_type,
			template_name, null, null)
	]
	count(selected_controls) > 0
	control := selected_controls[0]
	control.validationType in selected_validation_types

	terms = {x.term| some x in control.terms }
	
	term_name = table.columns[header.columnIndex]
	violated_values = {sprintf("Row: %v, column: %v, value: %v", [j + 1, column_header, term]) |
		some j
		count(table.data[column_name][j]) > 0
		term := table.data[term_name][j]
		missing_excludes = {x.term |
			some x in control.allowedMissingOntologyTerms
			term == x.term 
		}
		count(missing_excludes) == 0
		not terms[term]
	}
	count(violated_values) > 0
	terms_str := concat(", ", terms)
	file_column_header := column_header
	desc := sprintf("%v: %v", [control.ruleName, description_suffix])
	file_column_index := header.columnIndex + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, terms_str)
}


term_value_has_invalid_pattern(
	meta, 
	study_category,
	template_version,
	study_created_at,
	template_name, 
	isa_table_type, 
	table, 
	file_name, 
	header_index, 
	control_lists, 
	control_list_key,
	description_suffix
) := result if {
	header := table.headers[header_index]
	column_header := header.columnHeader
	control_list := control_lists[control_list_key]
	selected_controls = [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria, 
			template_version,
			study_category, 
			study_created_at,
			isa_table_type,
			template_name, null, null)
	]
	count(selected_controls) > 0
	control := selected_controls[0]
	term_name = table.columns[header.columnIndex]
	violated_values = {sprintf("Row: %v, column: %v, value: %v", [j + 1, column_header, term]) |
		some j
		count(table.data[column_name][j]) > 0
		term := table.data[term_name][j]
		missing_excludes := {x.term |
			some x in control.allowedMissingOntologyTerms
			term == x.term 
		}
		count(missing_excludes) == 0

		pattern_violations := {constraint_item |
			some constraint_item in control.constraints
			constraint_item.type == "pattern"
			constraint_item.constraint
			not regex.match(constraint_item.constraint, term)
		}
		count(pattern_violations) > 0
		
	}
	count(violated_values) > 0
	
	file_column_header := column_header
	desc := sprintf("%v: %v", [control.ruleName, description_suffix])
	file_column_index := header.columnIndex + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, control.pattern)
}

term_source_ref_not_in_default_control_list(meta, source, file_name, header_index, default_control_list_headers, control_list) := result if {
	search_header := "Term Source REF"
	header := source[file_name].table.headers[header_index]
	some t, "Term Source REF"  in header.additionalColumns
	not "Unit" in header.additionalColumns

	column_name := header.columnName
	column_header := header.columnHeader

	not column_header in default_control_list_headers
	source_ref_column_index := (header.columnIndex + t) + 1
	source_ref_column_name := source[file_name].table.columns[source_ref_column_index]
	count(source[file_name].table.data[column_name]) > 0
	violated_values = {sprintf("%v", [value]) |
		some j
		count(source[file_name].table.data[column_name][j]) > 0
		count(source[file_name].table.data[source_ref_column_name][j]) > 0
		value := source[file_name].table.data[source_ref_column_name][j]
		not value in control_list
	}
	control_list_str := concat(", ", control_list)

	file_column_header := sprintf("%v (of %v)", [search_header, column_header])
	source_file := file_name
	file_column_index := source_ref_column_index + 1
	result := format_with_desc(meta, source_file, file_column_index, file_column_header, violated_values, "Prioritized ontology reference sources for this column", control_list_str)
}

term_source_ref_for_unit_not_in_control_list(meta, source, file_name, header_index, control_list) := result if {
	header := source[file_name].table.headers[header_index]
	search_header := "Term Source REF"
	some t, "Term Source REF" in header.additionalColumns
	some z, "Unit" in header.additionalColumns

	column_name := header.columnName
	column_header := header.columnHeader
	source_ref_column_index := (header.columnIndex + t) + 1
	source_ref_column_name := source[file_name].table.columns[source_ref_column_index]

	# count(source[file_name].table.data[column_name]) > 0
	violated_values = {sprintf("%v", [value]) |
		some j
		count(source[file_name].table.data[column_name][j]) > 0
		count(source[file_name].table.data[source_ref_column_name][j]) > 0
		value := source[file_name].table.data[source_ref_column_name][j]
		not value in control_list
	}
	count(violated_values) > 0
	control_list_str := concat(", ", control_list)
	file_column_header := sprintf("%v (of %v)", [search_header, column_header])
	file_column_index := source_ref_column_index + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, "Prioritized ontology reference sources for unit", control_list_str)
}

term_source_ref_for_unit_not_valid(
	meta, 
	study_category,
	template_version,
	study_created_at,
	template_name, 
	isa_table_type, 
	table, 
	file_name, 
	header_index, 
	selected_validation_types, 
	control_lists, 
	control_list_key,
	description_suffix
) := result if {
	search_header := "Term Source REF"
	header := table.headers[header_index]
	some t, "Term Source REF"  in header.additionalColumns

	column_header := header.columnHeader
	"Unit" in header.additionalColumns
	control_list := control_lists[control_list_key]
	selected_controls = [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria, 
			template_version,
			study_category, 
			study_created_at,
			isa_table_type,
			template_name, null, null)
	]

	count(selected_controls) > 0

	control := selected_controls[0]

	control.validationType in selected_validation_types
	ontologies = {x | 
		control.validationType in {"any-ontology-term", "ontology-term-in-selected-ontologies"}
		some x in control.ontologies
	}
	other_sources = { x.sourceLabel | some x in control.allowedOtherSources}
	parent_sources = { x.termSourceRef | 
		control.validationType == "child-ontology-term"
		some x in control.allowedParentOntologyTerms.parents
	}
	all_sources := ontologies | other_sources | parent_sources

	term_name = table.columns[header.columnIndex]
	unit_column_index := (header.columnIndex + t)
	unit_column_name := table.columns[unit_column_index]
	source_ref_column_index := (header.columnIndex + t) + 1
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := (header.columnIndex + t) + 2
	accession_column_name := table.columns[accession_column_index]
	violated_values = {sprintf("Row: %v, Unit of %v: %v", [j + 1, term_name, source_ref]) |
		some j
		source_ref := table.data[source_ref_column_name][j]
		accession := table.data[accession_column_name][j]
		term := table.data[unit_column_name][j]
		missing_excludes = {x.termAccessionNumber |
			some x in control.allowedMissingOntologyTerms
			term == x.term 
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		placeholder_excludes = {x.termAccessionNumber |
			some x in control.allowedPlaceholders
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		other_source_excludes := {x |
			some x in control.allowedOtherSources
			startswith(accession, x.accessionPrefix)
			upper(source_ref) == upper(x.sourceLabel)
		}

		excludes = missing_excludes | placeholder_excludes | other_source_excludes

		count(excludes) == 0
		not source_ref in all_sources

	}
	count(violated_values) > 0
	ontologies_str := concat(", ", ontologies)
	file_column_header := sprintf("%v (of %v)", [search_header, column_header])
	file_column_index := source_ref_column_index + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, description_suffix, ontologies_str)
}

term_source_ref_not_in_source_references_list(meta, source, file_name, column_index, source_reference_names, source_reference_names_str) := result if {
	search_header := "Term Source REF"
	some t
	source[file_name].table.headers[column_index].additionalColumns[t] == search_header
	column_name := source[file_name].table.headers[column_index].columnName
	column_header := source[file_name].table.headers[column_index].columnHeader

	target_column_index := (source[file_name].table.headers[column_index].columnIndex + t) + 1
	target_column_name := source[file_name].table.columns[target_column_index]

	count(source[file_name].table.data[column_name]) > 0
	violated_values = {sprintf("%v", [value]) |
		some j
		count(source[file_name].table.data[column_name][j]) > 0
		value := source[file_name].table.data[target_column_name][j]
		count(value) > 0
		not value in source_reference_names
	}
	file_column_header := sprintf("%v (of %v)", [search_header, column_header])
	file_column_index := target_column_index + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, "Current ontology reference sources", source_reference_names_str)
}

term_source_ref_is_defined_for_empty_term(meta, source, file_name, header_index) := result if {
	header := source[file_name].table.headers[header_index]
	header.columnStructure == "ONTOLOGY_COLUMN"
	term_source_column_header := "Term Source REF"
	some a, "Term Source REF" in header.additionalColumns
	some b, "Term Accession Number"  in header.additionalColumns
	not "Unit" in header.additionalColumns
	
	column_name := header.columnName
	column_header := header.columnHeader

	source_ref_column_index := (header.columnIndex + a) + 1
	source_ref_column_name := source[file_name].table.columns[source_ref_column_index]
	violated_values = {sprintf("[row: %v, term:'%v', 'source ref':'%v']", [x1, x2, x3]) |
		some j, value in source[file_name].table.data[column_name]
		
		count(trim_space(value)) == 0
		source_ref := source[file_name].table.data[source_ref_column_name][j]

		# accession := source[file_name].table.data[accession_number_column_name][j]
		count(source_ref) > 0
		x1 := (source[file_name].table.rowOffset + j) + 1
		x2 := value
		x3 := source_ref
	}
	file_column_header := sprintf("%v (of %v)", [term_source_column_header, column_header])
	source_file := file_name
	file_column_index := source_ref_column_index + 1
	result := format_with_values(meta, source_file, file_column_index, file_column_header, violated_values)
}

term_source_ref_is_defined_for_empty_unit(meta, source, file_name, header_index) := result if {
	header := source[file_name].table.headers[header_index]
	# column_index := header.columnIndex
	# term_source_column_header := "Term Source REF"
	some a, "Term Source REF" in header.additionalColumns
	some b, "Term Accession Number"  in header.additionalColumns
	some c, "Unit" in header.additionalColumns
	
	column_name := header.columnName
	column_header := header.columnHeader
	source_ref_column_index := (header.columnIndex + a) + 1
	source_ref_column_name := source[file_name].table.columns[source_ref_column_index]

	accession_number_column_index := (header.columnIndex + b) + 1
	accession_number_column_name := source[file_name].table.columns[accession_number_column_index]
	unit_column_index := (header.columnIndex + c) + 1
	unit_column_name := source[file_name].table.columns[unit_column_index]

	violated_values = {sprintf("[row: %v. value:'%v', unit:'%v', 'source ref':'%v', 'accession number':'%v']", [x1, x2, x3, x4, x5]) |
		some j, unit in source[file_name].table.data[unit_column_name]
		count(trim_space(unit)) == 0
		value := source[file_name].table.data[column_name][j]
		count(trim_space(value)) > 0
		source_ref := source[file_name].table.data[source_ref_column_name][j]
		count(trim_space(source_ref)) > 0
		accession := source[file_name].table.data[accession_number_column_name][j]

		x1 := (source[file_name].table.rowOffset + j) + 1
		x2 := value
		x3 := unit
		x4 := source_ref
		x5 := accession
	}
	file_column_header := sprintf("%v (of %v for %v)", ["Term Source REF", "Unit", column_header])
	file_column_index := source_ref_column_index + 1
	result := format_with_values(meta, file_name, file_column_index, file_column_header, violated_values)
}



#############################################################################################################

accession_number_min_length_check_for_term(meta, source, file_name, column_index, min_length) := result if {
	term_source_column_header := "Term Source REF"
	accession_column_header := "Term Accession Number"
	# unit_column_header := "Unit"
	some a
	source[file_name].table.headers[column_index].additionalColumns[a] == term_source_column_header
	some b
	source[file_name].table.headers[column_index].additionalColumns[b] == accession_column_header

	column_name := source[file_name].table.headers[column_index].columnName
	column_header := source[file_name].table.headers[column_index].columnHeader

	accession_number_column_index := (source[file_name].table.headers[column_index].columnIndex + b) + 1
	accession_number_column_name := source[file_name].table.columns[accession_number_column_index]

	count(source[file_name].table.data[column_name]) > 0
	violated_values = {sprintf("[row: %v, value: '%v', 'accession number': '%v']", [x1, x2, x3]) |
		some j
		value := source[file_name].table.data[column_name][j]
		count(value) > 0
		accession_number := source[file_name].table.data[accession_number_column_name][j]
		count(accession_number) < min_length
		x1 := (source[file_name].table.rowOffset + j) + 1
		x2 := value
		x3 := accession_number
	}

	file_column_header := sprintf("%v (of %v)", [accession_column_header, column_header])
	file := file_name
	file_column_index := accession_number_column_index + 1
	result := format_with_values(meta, file, file_column_index, file_column_header, violated_values)
}

accession_number_min_length_check_for_unit(meta, source, file_name, column_index, min_length) := result if {
	term_source_column_header := "Term Source REF"
	accession_column_header := "Term Accession Number"
	unit_column_header := "Unit"
	some a
	source[file_name].table.headers[column_index].additionalColumns[a] == term_source_column_header
	some b
	source[file_name].table.headers[column_index].additionalColumns[b] == accession_column_header
	some c
	source[file_name].table.headers[column_index].additionalColumns[c] == unit_column_header

	column_name := source[file_name].table.headers[column_index].columnName
	column_header := source[file_name].table.headers[column_index].columnHeader
	source_ref_column_index := (source[file_name].table.headers[column_index].columnIndex + a) + 1
	source_ref_column_name := source[file_name].table.columns[source_ref_column_index]

	accession_number_column_index := (source[file_name].table.headers[column_index].columnIndex + b) + 1
	accession_number_column_name := source[file_name].table.columns[accession_number_column_index]

	unit_column_index := (source[file_name].table.headers[column_index].columnIndex + c) + 1
	unit_column_name := source[file_name].table.columns[unit_column_index]
	count(source[file_name].table.data[column_name]) > 0
	violated_values = {sprintf("[row: %v, value: '%v', unit: '%v', 'source ref':'%v', accession number: '']", [x1, x2, x3, x4]) |
		some j
		value := source[file_name].table.data[column_name][j]
		unit := source[file_name].table.data[unit_column_name][j]
		count(unit) > 0
		source_ref := source[file_name].table.data[source_ref_column_name][j]
		accession_number := source[file_name].table.data[accession_number_column_name][j]
		count(accession_number) < min_length
		x1 := (source[file_name].table.rowOffset + j) + 1
		x2 := value
		x3 := unit
		x4 := source_ref
	}
	file_column_header := sprintf("%v (of %v for %v)", [accession_column_header, unit_column_header, column_header])
	source_file := file_name
	file_column_index := accession_number_column_index + 1
	result := format_with_values(meta, source_file, file_column_index, file_column_header, violated_values)
}

accession_number_is_defined_for_empty_term(meta, source, file_name, column_index) := result if {
	term_source_column_header := "Term Source REF"
	accession_column_header := "Term Accession Number"
	# unit_column_header := "Unit"
	some a
	source[file_name].table.headers[column_index].additionalColumns[a] == term_source_column_header
	some b
	source[file_name].table.headers[column_index].additionalColumns[b] == accession_column_header
	not "Unit" in source[file_name].table.headers[column_index].additionalColumns
	# some c
	# source[file_name].table.headers[column_index].additionalColumns[c] == unit_column_header

	column_name := source[file_name].table.headers[column_index].columnName
	column_header := source[file_name].table.headers[column_index].columnHeader

	source_ref_column_index := (source[file_name].table.headers[column_index].columnIndex + a) + 1
	source_ref_column_name := source[file_name].table.columns[source_ref_column_index]
	accession_number_column_index := (source[file_name].table.headers[column_index].columnIndex + b) + 1
	accession_number_column_name := source[file_name].table.columns[accession_number_column_index]

	count(source[file_name].table.data[column_name]) > 0
	violated_values = {sprintf("[row: %v, term:'%v', 'source ref':'%v', 'accession number':'%v']", [x1, x2, x3, x4]) |
		some j
		value := source[file_name].table.data[column_name][j]
		# count(value) == 0
		source_ref := source[file_name].table.data[source_ref_column_name][j]
		accession := source[file_name].table.data[accession_number_column_name][j]
		count(trim_space(source_ref)) == 0
		count(accession) > 0
		x1 := (source[file_name].table.rowOffset + j) + 1
		x2 := value
		x3 := source_ref
		x4 := accession
	}
	file_column_header := sprintf("%v (of %v)", [accession_column_header, column_header])
	source_file := file_name
	file_column_index := accession_number_column_index + 1
	result := format_with_values(meta, source_file, file_column_index, file_column_header, violated_values)
}

accession_number_is_defined_for_empty_unit(meta, source, file_name, heder_index) := result if {
	term_source_column_header := "Term Source REF"
	accession_column_header := "Term Accession Number"
	unit_column_header := "Unit"
	some a
	source[file_name].table.headers[heder_index].additionalColumns[a] == term_source_column_header
	some b
	source[file_name].table.headers[heder_index].additionalColumns[b] == accession_column_header
	some c
	source[file_name].table.headers[heder_index].additionalColumns[c] == unit_column_header
	column_name := source[file_name].table.headers[heder_index].columnName
	column_header := source[file_name].table.headers[heder_index].columnHeader

	source_ref_column_index := (source[file_name].table.headers[heder_index].columnIndex + a) + 1
	source_ref_column_name := source[file_name].table.columns[source_ref_column_index]
	accession_number_column_index := (source[file_name].table.headers[heder_index].columnIndex + b) + 1
	accession_number_column_name := source[file_name].table.columns[accession_number_column_index]
	unit_column_index := (source[file_name].table.headers[heder_index].columnIndex + c) + 1
	unit_column_name := source[file_name].table.columns[unit_column_index]

	count(source[file_name].table.data[column_name]) > 0
	violated_values = {sprintf("[row: %v. value:'%v', unit:'%v', 'source ref':'%v', 'accession number':'%v']", [x1, x2, x3, x4, x5]) |
		some j
		unit := source[file_name].table.data[unit_column_name][j]
		# count(trim_space(unit)) == 0
		source_ref := source[file_name].table.data[source_ref_column_name][j]
		accession := source[file_name].table.data[accession_number_column_name][j]
		value := source[file_name].table.data[column_name][j]

		count(trim_space(source_ref)) == 0
		count(accession) > 0
		x1 := (source[file_name].table.rowOffset + j) + 1
		x2 := value
		x3 := unit
		x4 := source_ref
		x5 := accession
	}

	file_column_header := sprintf("%v (of %v for %v)", [accession_column_header, unit_column_header, column_header])
	source_file := file_name
	file_column_index := accession_number_column_index + 1
	result := format_with_values(meta, source_file, file_column_index, file_column_header, violated_values)
}


extension(value, extensions) := { extension |
	some extension in extensions
	endswith(lower(value), extension)
}
