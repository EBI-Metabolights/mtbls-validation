package metabolights.validation.v2.utils.functions

import data.metabolights.validation.v2.utils.field_match as field_match

import rego.v1

find_rule(
	study_category,
	template_version,
	study_created_at,
	template_name,
	isa_table_type,
	control_list,
) := rule if {
	selected_rules = [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria,
			template_version,
			study_category,
			study_created_at,
			isa_table_type,
			template_name, null, null,
		)
	]
	count(selected_rules) > 0
	rule := selected_rules[0]
}

check_term_rule_by_enforcement_level(
	meta,
	file_name,
	control,
	ontology_term,
	field_name,
	description_suffix,
	selected_validation_types,
	enforcement_levels,
) := result if {
	control.validationType in selected_validation_types
	control.termEnforcementLevel in enforcement_levels
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

check_term_rule_by_enforcement_level(
	meta,
	file_name,
	control,
	ontology_term,
	field_name,
	description_suffix,
	selected_validation_types,
	enforcement_levels,
) := result if {
	expected_validation_types := {"child-ontology-term", "ontology-term-in-selected-ontologies"}

	control.validationType in expected_validation_types
	control.validationType in selected_validation_types
	control.termEnforcementLevel in enforcement_levels
	result := single_ontology_term_source_ref_not_valid(
		meta,
		file_name,
		control,
		ontology_term,
		field_name,
		description_suffix,
		selected_validation_types,
	)
}

check_term_rule_by_enforcement_level(
	meta,
	file_name,
	control,
	ontology_term,
	field_name,
	description_suffix,
	selected_validation_types,
	enforcement_levels,
) := result if {
	control.validationType == "any-ontology-term"
	control.validationType in selected_validation_types
	control.termEnforcementLevel in enforcement_levels
	result := single_ontology_term_source_ref_empty(
		meta,
		file_name,
		control,
		ontology_term,
		field_name,
		description_suffix,
		selected_validation_types,
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
	terms = {sprintf("[%v, %v, %v]", [x.term, x.termSourceRef, x.termAccessionNumber]) | some x in control.terms}
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

	excludes = (missing_excludes | placeholder_excludes) | other_source_excludes
	count(excludes) == 0

	term_str = sprintf("[%v, %v, %v]", [term, source_ref, accession])
	not term_str in terms
	terms_str := concat(", ", terms)
	file_column_header := sprintf("%v (of %v)", ["Term Source REF", field_name])
	desc := sprintf("%v: %v: %v", [control.ruleName, description_suffix, terms_str])
	result := format_with_file_description_and_values(meta, file_name, desc, [term_str])
}

single_ontology_term_source_ref_not_valid(
	meta,
	file_name,
	control,
	ontology_term,
	field_name,
	description_suffix,
	selected_validation_types,
) := result if {
	control.validationType in selected_validation_types
	ontologies := {x |
		control.validationType in {"any-ontology-term", "ontology-term-in-selected-ontologies"}
		some x in control.ontologies
	}
	other_sources := {x.sourceLabel | some x in control.allowedOtherSources}
	parent_sources := {x.termSourceRef |
		control.validationType == "child-ontology-term"
		some x in control.allowedParentOntologyTerms.parents
	}
	all_sources := (ontologies | other_sources) | parent_sources
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
	excludes := (missing_excludes | placeholder_excludes) | other_source_excludes
	count(excludes) == 0

	not all_sources[source_ref]

	ontologies_str := concat(", ", ontologies)

	file_column_header := sprintf("%v (of %v): [%v, %v, %v]", ["Term Source REF", field_name, term, source_ref, accession])
	values = [file_column_header]
	desc := sprintf("Rule %v: Term Source REF of %v. %v %v", [control.ruleName, field_name, description_suffix, ontologies_str])
	result := format_with_file_description_and_values(meta, file_name, desc, values)
}

single_ontology_term_source_ref_empty(
	meta,
	file_name,
	control,
	ontology_term,
	field_name,
	description_suffix,
	selected_validation_types,
) := result if {
	control.validationType in selected_validation_types
	ontologies := {x |
		control.validationType in {"any-ontology-term", "ontology-term-in-selected-ontologies"}
		some x in control.ontologies
	}

	other_sources := {x.sourceLabel | some x in control.allowedOtherSources}
	parent_sources := {x.termSourceRef |
		control.validationType == "child-ontology-term"
		some x in control.allowedParentOntologyTerms.parents
	}
	all_sources := (ontologies | other_sources) | parent_sources
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
	excludes := (missing_excludes | placeholder_excludes) | other_source_excludes
	count(excludes) == 0
	count(source_ref) == 0

	ontologies_str := concat(", ", ontologies)

	file_column_header := sprintf("%v (of %v): [%v, %v, %v]", ["Term Source REF", field_name, term, source_ref, accession])
	values = [file_column_header]
	desc := sprintf("Rule %v: Term Source REF of %v. %v %v", [control.ruleName, field_name, description_suffix, ontologies_str])
	result := format_with_file_description_and_values(meta, file_name, desc, values)
}

# Check child-ontology-term and ontology-term-in-selected-ontologies rules
# for ontology columns
check_rule_by_enforcement_level(
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
	enforcement_levels,
	control_lists,
	control_list_key,
) := result if {
	header := table.headers[header_index]
	header.columnStructure == "ONTOLOGY_COLUMN"
	control_list := control_lists[control_list_key]

	rule := find_rule(
		study_category, template_version,
		study_created_at, template_name,
		isa_table_type, control_list,
	)
	rule.validationType in {"ontology-term-in-selected-ontologies", "child-ontology-term"}
	rule.termEnforcementLevel in enforcement_levels

	message_suffix = sprintf("Use an ontology term from the following ontologies [%v]", [rule.termEnforcementLevel])

	result := check_ontology_source_rule(
		meta,
		table,
		file_name,
		header,
		rule,
		message_suffix,
	)
}

# Check any-ontology-term rules
# for ontology columns
check_rule_by_enforcement_level(
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
	enforcement_levels,
	control_lists,
	control_list_key,
) := result if {
	"any-ontology-term" in selected_validation_types

	header := table.headers[header_index]
	header.columnStructure == "ONTOLOGY_COLUMN"
	control_list := control_lists[control_list_key]

	rule := find_rule(
		study_category, template_version,
		study_created_at, template_name,
		isa_table_type, control_list,
	)
	count(rule.validationType) > 0
	rule.validationType in {"any-ontology-term"}
	rule.termEnforcementLevel in enforcement_levels
	message_suffix = sprintf("use an ontology term [%v]. Select a term from the following ontologies", [rule.termEnforcementLevel])

	result := check_any_ontology_term_rule(
		meta,
		table,
		file_name,
		header,
		rule,
		message_suffix,
	)
}

# Check child-ontology-term and ontology-term-in-selected-ontologies rules
# for single column and unit columns
check_rule_by_enforcement_level(
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
	enforcement_levels,
	control_lists,
	control_list_key,
) := result if {
	header := table.headers[header_index]
	header.columnStructure == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"
	control_list := control_lists.Unit

	rule := find_rule(
		study_category, template_version,
		study_created_at, template_name,
		isa_table_type, control_list,
	)

	rule.validationType in {"ontology-term-in-selected-ontologies", "child-ontology-term"}
	rule.termEnforcementLevel in enforcement_levels

	message_suffix = sprintf("Use a unit ontology term from the following ontologies [%v]", [rule.termEnforcementLevel])

	result := check_unit_ontology_source_rule(
		meta,
		table,
		file_name,
		header,
		rule,
		message_suffix,
	)
}

# Check any-ontology-term rules
# for single column and unit columns
check_rule_by_enforcement_level(
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
	enforcement_levels,
	control_lists,
	control_list_key,
) := result if {
	header := table.headers[header_index]
	header.columnStructure == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"
	control_list := control_lists.Unit

	rule := find_rule(
		study_category, template_version,
		study_created_at, template_name,
		isa_table_type, control_list,
	)
	rule.validationType in {"any-ontology-term"}
	rule.termEnforcementLevel in enforcement_levels

	message_suffix = sprintf("Define a unit ontology term. You can select from these ontologies [%v]", [rule.termEnforcementLevel])
	result := check_unit_any_ontology_source_rule(
		meta,
		table,
		file_name,
		header,
		rule,
		message_suffix,
	)
}

# Check selected-ontology-term rules
# for ontology columns
check_rule_by_enforcement_level(
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
	enforcement_levels,
	control_lists,
	control_list_key,
) := result if {
	"selected-ontology-term" in selected_validation_types

	header := table.headers[header_index]
	header.columnStructure == "ONTOLOGY_COLUMN"
	control_list := control_lists[control_list_key]

	rule := find_rule(
		study_category, template_version,
		study_created_at, template_name,
		isa_table_type, control_list,
	)
	count(rule.validationType) > 0
	rule.validationType in {"selected-ontology-term"}
	rule.termEnforcementLevel in enforcement_levels

	message_suffix = sprintf("Use an ontology term from the list [%v]", [rule.termEnforcementLevel])

	result := check_selected_ontology_terms_rule(
		meta,
		table,
		file_name,
		header,
		rule,
		message_suffix,
	)
}

# Check selected-ontology-term rules
# for single columns
check_rule_by_enforcement_level(
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
	enforcement_levels,
	control_lists,
	control_list_key,
) := result if {
	"selected-ontology-term" in selected_validation_types

	header := table.headers[header_index]
	header.columnStructure == "SINGLE_COLUMN"
	control_list := control_lists[control_list_key]

	rule := find_rule(
		study_category, template_version,
		study_created_at, template_name,
		isa_table_type, control_list,
	)

	count(rule.validationType) > 0
	rule.validationType in {"selected-ontology-term"}
	rule.termEnforcementLevel in enforcement_levels
	message_suffix = sprintf("Use a term from the list [%v]", [rule.termEnforcementLevel])

	result := term_value_not_in_selected_terms(
		meta,
		table,
		file_name,
		header,
		rule,
		message_suffix,
	)
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
	enforcement_levels,
	control_lists,
	control_list_key,
) := result if {
	header := table.headers[header_index]
	control_list := control_lists[control_list_key]

	rule := find_rule(
		study_category, template_version,
		study_created_at, template_name,
		isa_table_type, control_list,
	)

	count(rule.validationType) > 0
	pattern := rule.constraints.pattern
	pattern.enforcementLevel in enforcement_levels

	message_suffix = sprintf("Expected value pattern [%v]", [rule.termEnforcementLevel])

	term_name = table.columns[header.columnIndex]
	violated_values = {sprintf("Row: %v, column: %v, value: %v", [j + 1, header.columnHeader, term]) |
		some j
		count(table.data[column_name][j]) > 0
		term := table.data[term_name][j]
		count(term) > 0
		missing_excludes := {x.term |
			some x in rule.allowedMissingOntologyTerms
			term == x.term
		}
		count(missing_excludes) == 0

		not regex.match(pattern.constraint, term)
	}
	count(violated_values) > 0
	file_column_header := header.columnHeader
	desc := sprintf("%v. %v - %v", [rule.ruleName, pattern.errorMessage, message_suffix])
	file_column_index := header.columnIndex + 1

	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, pattern.constraint)
}

##################################################################
# Rule checks
##################################################################
# Check Source REF not in ontologies or parent sources
check_ontology_source_rule(
	meta,
	table,
	file_name,
	header,
	rule,
	description_suffix,
) := result if {
	search_header := "Term Source REF"
	column_header := header.columnHeader

	ontologies = {x |
		rule.validationType in {"ontology-term-in-selected-ontologies", "any-ontology-term"}
		some x in rule.ontologies
	}
	other_sources = {x.sourceLabel | some x in rule.allowedOtherSources}
	parent_sources = {x.termSourceRef |
		rule.validationType == "child-ontology-term"
		some x in rule.allowedParentOntologyTerms.parents
	}
	all_sources := (ontologies | other_sources) | parent_sources
	expected_sources := ontologies | parent_sources
	term_name = table.columns[header.columnIndex]
	source_ref_column_index := header.columnIndex + 1
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := header.columnIndex + 2
	accession_column_name := table.columns[accession_column_index]

	violated_values = {sprintf("Row: %v, column: Term Source REF of %v, value: [%v, %v, %v]", [j + 1, column_header, term, source_ref, accession]) |
		some j, term in table.data[term_name]
		count(term) > 0
		source_ref := table.data[source_ref_column_name][j]
		accession := table.data[accession_column_name][j]
		missing_excludes = {x.termAccessionNumber |
			some x in rule.allowedMissingOntologyTerms
			term == x.term
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		placeholder_excludes = {x.termAccessionNumber |
			some x in rule.allowedPlaceholders
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		other_source_excludes := {x |
			some x in rule.allowedOtherSources
			startswith(accession, x.accessionPrefix)
			upper(source_ref) == upper(x.sourceLabel)
		}

		excludes = (missing_excludes | placeholder_excludes) | other_source_excludes
		count(excludes) == 0

		not all_sources[source_ref]
	}
	count(violated_values) > 0
	ontologies_str := concat(", ", expected_sources)
	file_column_header := sprintf("%v (of %v)", [search_header, column_header])
	desc := sprintf("Rule '%v' - %v", [rule.ruleName, description_suffix])
	file_column_index := source_ref_column_index + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, ontologies_str)
}

# Check Unit Source REF is in ontologies or parent sources
check_unit_ontology_source_rule(
	meta,
	table,
	file_name,
	header,
	rule,
	description_suffix,
) := result if {
	search_header := "Unit Term Source REF"
	column_header := header.columnHeader
	header.columnStructure == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"
	ontologies = {x |
		some x in rule.ontologies
	}
	other_sources = {x.sourceLabel | some x in rule.allowedOtherSources}
	parent_sources = {x.termSourceRef |
		some x in rule.allowedParentOntologyTerms.parents
	}
	all_sources := (ontologies | other_sources) | parent_sources

	expected_sources := ontologies | parent_sources
	term_name = table.columns[header.columnIndex]
	unit_column_index := header.columnIndex + 1
	unit_name = table.columns[unit_column_index]
	source_ref_column_index := header.columnIndex + 2
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := header.columnIndex + 3
	accession_column_name := table.columns[accession_column_index]

	violated_values = {sprintf("Row: %v, column: Unit Term Source REF of %v, value: %v, unit: [%v, %v, %v]", [j + 1, column_header, term, unit_value, source_ref, accession]) |
		some j, term in table.data[term_name]
		unit_value := table.data[unit_name][j]
		count(term) > 0
		count(unit_value) > 0
		source_ref := table.data[source_ref_column_name][j]
		accession := table.data[accession_column_name][j]
		missing_excludes = {x.termAccessionNumber |
			some x in rule.allowedMissingOntologyTerms
			term == x.term
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		placeholder_excludes = {x.termAccessionNumber |
			some x in rule.allowedPlaceholders
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		other_source_excludes := {x |
			some x in rule.allowedOtherSources
			startswith(accession, x.accessionPrefix)
			upper(source_ref) == upper(x.sourceLabel)
		}

		excludes = (missing_excludes | placeholder_excludes) | other_source_excludes
		count(excludes) == 0

		not all_sources[source_ref]
	}
	count(violated_values) > 0
	ontologies_str := concat(", ", expected_sources)

	file_column_header := sprintf("%v (of %v)", [search_header, column_header])
	desc := sprintf("Rule '%v' - %v", [rule.ruleName, description_suffix])
	file_column_index := source_ref_column_index + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, ontologies_str)
}

# Check Unit Source REF is defined for any-ontology-term
check_unit_any_ontology_source_rule(
	meta,
	table,
	file_name,
	header,
	rule,
	description_suffix,
) := result if {
	search_header := "Unit Term Source REF"
	column_header := header.columnHeader
	header.columnStructure == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"
	ontologies = {x |
		rule.validationType in {"any-ontology-term"}
		some x in rule.ontologies
	}
	other_sources = {x.sourceLabel | some x in rule.allowedOtherSources}
	parent_sources = {x.termSourceRef |
		rule.validationType == "child-ontology-term"
		some x in rule.allowedParentOntologyTerms.parents
	}
	all_sources := (ontologies | other_sources) | parent_sources
	term_name = table.columns[header.columnIndex]
	unit_column_index := header.columnIndex + 1
	unit_name = table.columns[unit_column_index]
	source_ref_column_index := header.columnIndex + 2
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := header.columnIndex + 3
	accession_column_name := table.columns[accession_column_index]

	violated_values = {sprintf("Row: %v, column: Unit Term Source REF of %v, value: %v, unit: [%v, %v, %v]", [j + 1, column_header, term, unit_value, source_ref, accession]) |
		some j, term in table.data[term_name]
		unit_value := table.data[unit_name][j]
		count(term) > 0
		count(unit_value) > 0
		source_ref := table.data[source_ref_column_name][j]
		accession := table.data[accession_column_name][j]
		missing_excludes = {x.termAccessionNumber |
			some x in rule.allowedMissingOntologyTerms
			term == x.term
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		placeholder_excludes = {x.termAccessionNumber |
			some x in rule.allowedPlaceholders
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		other_source_excludes := {x |
			some x in rule.allowedOtherSources
			startswith(accession, x.accessionPrefix)
			upper(source_ref) == upper(x.sourceLabel)
		}

		excludes = (missing_excludes | placeholder_excludes) | other_source_excludes
		count(excludes) == 0
		count(source_ref) == 0
	}
	count(violated_values) > 0
	ontologies_str := concat(", ", ontologies)
	file_column_header := sprintf("%v (of %v)", [search_header, column_header])
	desc := sprintf("Rule '%v' - %v", [rule.ruleName, description_suffix])
	file_column_index := source_ref_column_index + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, ontologies_str)
}

# Check Source REF is defined for any-ontology-term
check_any_ontology_term_rule(
	meta,
	table,
	file_name,
	header,
	rule,
	description_suffix,
) := result if {
	search_header := "Term Source REF"
	column_header := header.columnHeader

	ontologies = {x |
		rule.validationType in {"any-ontology-term"}
		some x in rule.ontologies
	}
	other_sources = {x.sourceLabel | some x in rule.allowedOtherSources}
	parent_sources = {x.termSourceRef |
		rule.validationType == "child-ontology-term"
		some x in rule.allowedParentOntologyTerms.parents
	}
	all_sources := (ontologies | other_sources) | parent_sources
	term_name = table.columns[header.columnIndex]
	source_ref_column_index := header.columnIndex + 1
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := header.columnIndex + 2
	accession_column_name := table.columns[accession_column_index]

	violated_values = {sprintf("Row: %v, column: Term Source REF of %v, value: [%v, %v, %v]", [j + 1, column_header, term, source_ref, accession]) |
		some j, term in table.data[term_name]
		count(term) > 0
		source_ref := table.data[source_ref_column_name][j]
		accession := table.data[accession_column_name][j]
		missing_excludes = {x.termAccessionNumber |
			some x in rule.allowedMissingOntologyTerms
			term == x.term
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		placeholder_excludes = {x.termAccessionNumber |
			some x in rule.allowedPlaceholders
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		other_source_excludes := {x |
			some x in rule.allowedOtherSources
			startswith(accession, x.accessionPrefix)
			upper(source_ref) == upper(x.sourceLabel)
		}

		excludes = (missing_excludes | placeholder_excludes) | other_source_excludes
		count(excludes) == 0
		count(source_ref) == 0
	}
	count(violated_values) > 0
	ontologies_str := concat(", ", ontologies)
	file_column_header := sprintf("%v (of %v)", [search_header, column_header])
	desc := sprintf("%v. %v", [rule.ruleName, description_suffix])
	file_column_index := source_ref_column_index + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, ontologies_str)
}

# Check ontology term in the selected list
check_selected_ontology_terms_rule(
	meta,
	table,
	file_name,
	header,
	rule,
	message_suffix,
) := result if {
	search_header := "Term Source REF"
	column_header := header.columnHeader
	count(rule.terms) > 0
	terms = {sprintf("[%v, %v, %v]", [x.term, x.termSourceRef, x.termAccessionNumber]) | some x in rule.terms}

	term_name = table.columns[header.columnIndex]
	source_ref_column_index := header.columnIndex + 1
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := header.columnIndex + 2
	accession_column_name := table.columns[accession_column_index]

	violated_values = {sprintf("Row: %v, column: %v, value: [%v, %v ,%v]", [j + 1, column_header, term, source_ref, accession]) |
		some j, term in table.data[term_name]
		count(term) > 0
		source_ref := table.data[source_ref_column_name][j]
		accession := table.data[accession_column_name][j]

		missing_excludes = {x.termAccessionNumber |
			some x in rule.allowedMissingOntologyTerms
			term == x.term
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		placeholder_excludes = {x.termAccessionNumber |
			some x in rule.allowedPlaceholders
			accession == x.termAccessionNumber
			source_ref == x.termSourceRef
		}
		other_source_excludes := {x |
			some x in rule.allowedOtherSources
			startswith(accession, x.accessionPrefix)
			upper(source_ref) == upper(x.sourceLabel)
		}

		excludes = (missing_excludes | placeholder_excludes) | other_source_excludes

		count(excludes) == 0
		term_key := sprintf("[%v, %v, %v]", [term, source_ref, accession])
		not terms[term_key]
	}
	count(violated_values) > 0
	terms_str := concat(", ", terms)
	file_column_header := sprintf("%v (of %v)", [search_header, column_header])
	desc := sprintf("%v: %v", [rule.ruleName, message_suffix])
	file_column_index := source_ref_column_index + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, terms_str)
}

# Check value or ontology label in the selected list
term_value_not_in_selected_terms(
	meta,
	table,
	file_name,
	header,
	rule,
	message_suffix,
) := result if {
	column_header := header.columnHeader
	count(rule.terms) > 0
	terms = {x.term | some x in rule.terms}

	term_name = table.columns[header.columnIndex]
	violated_values = {sprintf("Row: %v, column: %v, value: %v", [j + 1, column_header, term]) |
		some j, term in table.data[term_name]
		count(term) > 0
		missing_excludes = {x.term |
			some x in rule.allowedMissingOntologyTerms
			term == x.term
		}
		count(missing_excludes) == 0
		not terms[term]
	}
	count(violated_values) > 0
	terms_str := concat(", ", terms)
	file_column_header := column_header
	desc := sprintf("%v: %v", [rule.ruleName, message_suffix])
	file_column_index := header.columnIndex + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, terms_str)
}

###################
# Unexpected value rule

check_unexpected_value(
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
	enforcement_levels,
	control_lists,
	control_list_key,
) := result if {
	header := table.headers[header_index]
	header.columnStructure == "ONTOLOGY_COLUMN"

	result := ontology_term_has_unexpected_value(
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
		enforcement_levels,
		control_lists,
		control_list_key,
		"unexpected term values",
	)
}

check_unexpected_value(
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
	enforcement_levels,
	control_lists,
	control_list_key,
) := result if {
	header := table.headers[header_index]
	header.columnStructure == "SINGLE_COLUMN"

	result := single_column_has_unexpected_value(
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
		enforcement_levels,
		control_lists,
		control_list_key,
		"unexpected values",
	)
}

check_unexpected_value(
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
	enforcement_levels,
	control_lists,
	control_list_key,
) := result if {
	header := table.headers[header_index]
	header.columnStructure == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"

	result := unit_value_has_unexpected_value(
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
		enforcement_levels,
		control_lists,
		control_list_key,
		"unexpected term or unit values",
	)
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
	enforcement_levels,
	control_lists,
	control_list_key,
	description_suffix,
) := result if {
	search_header := "Term Source REF"
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
			template_name, null, null,
		)
	]
	count(selected_controls) > 0
	control := selected_controls[0]
	count(control.unexpectedTerms) > 0
	control.validationType in selected_validation_types
	control.unexpectedTermEnforcementLevel in enforcement_levels

	term_name = table.columns[header.columnIndex]
	source_ref_column_index := header.columnIndex + 1
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := header.columnIndex + 2
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

		excludes = (missing_excludes | placeholder_excludes) | other_source_excludes
		count(excludes) == 0
	}
	count(violated_values) > 0
	unexpected_terms_str := concat(", ", control.unexpectedTerms)
	file_column_header := sprintf("%v", [column_header])
	desc := sprintf("%v: %v", [control.ruleName, description_suffix])
	file_column_index := header.columnIndex + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, unexpected_terms_str)
}

unit_value_has_unexpected_value(
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
	enforcement_levels,
	control_lists,
	control_list_key,
	description_suffix,
) := result if {
	search_header := "Unit Term Source REF"

	header := table.headers[header_index]
	header.columnStructure == "SINGLE_COLUMN_AND_UNIT_ONTOLOGY"

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
			template_name, null, null,
		)
	]
	count(selected_controls) > 0
	control := selected_controls[0]
	count(control.unexpectedTerms) > 0
	control.validationType in selected_validation_types
	control.unexpectedTermEnforcementLevel in enforcement_levels

	term_name = table.columns[header.columnIndex]
	unit_name = table.columns[header.columnIndex + 1]
	source_ref_column_index := header.columnIndex + 2
	source_ref_column_name := table.columns[source_ref_column_index]
	accession_column_index := header.columnIndex + 3
	accession_column_name := table.columns[accession_column_index]

	violated_values = {sprintf("Row: %v, column: %v, value: [%v, %v, %v ,%v]", [j + 1, column_header, term, unit, source_ref, accession]) |
		some j, term in table.data[term_name]
		unit := table.data[unit_name][j]

		term_violation := {term |
			count(term) > 0
			lower(term) in control.unexpectedTerms
		}
		unit_violation := {term |
			count(term) > 0
			count(unit) > 0
			lower(unit) in control.unexpectedTerms
		}
		unexpected = term_violation | unit_violation
		count(unit_violation) > 0
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

		excludes = (missing_excludes | placeholder_excludes) | other_source_excludes
		count(excludes) == 0
	}
	count(violated_values) > 0
	unexpected_terms_str := concat(", ", control.unexpectedTerms)
	file_column_header := sprintf("%v", [column_header])
	desc := sprintf("%v: %v", [control.ruleName, description_suffix])
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
	selected_validation_types,
	enforcement_levels,
	control_lists,
	control_list_key,
	description_suffix,
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
			template_name, null, null,
		)
	]

	count(selected_controls) > 0
	control := selected_controls[0]
	count(control.unexpectedTerms) > 0

	control.validationType in selected_validation_types
	control.unexpectedTermEnforcementLevel in enforcement_levels

	term_name = table.columns[header.columnIndex]

	violated_values = {sprintf("Row: %v, column: %v, value: %v", [j + 1, column_header, term]) |
		some j, term in table.data[term_name]
		count(term) > 0
		lower(term) in control.unexpectedTerms

		missing_excludes = {x.termAccessionNumber |
			some x in control.allowedMissingOntologyTerms
			term == x.term
		}

		count(missing_excludes) == 0
	}
	count(violated_values) > 0

	unexpected_terms_str := concat(", ", control.unexpectedTerms)
	file_column_header := sprintf("%v", [column_header])
	desc := sprintf("%v: %v", [control.ruleName, description_suffix])
	file_column_index := header.columnIndex + 1
	result := format_with_desc(meta, file_name, file_column_index, file_column_header, violated_values, desc, unexpected_terms_str)
}
