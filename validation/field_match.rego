package metabolights.validation.v2.field_match

import rego.v1

match_field_control_criteria(criteria,
	template_version,
	study_category, 
	study_created_at, 
	isa_file_type, 
	template_name, 
	linked_field, 
	linked_field_value
) := true if {
	match_equal(criteria.isaFileType, isa_file_type)
	match_in_list(criteria.templateVersionFilter, template_version)
	match_in_list(criteria.studyCategoryFilter, study_category)
	match_equal_or_greater(criteria.studyCreatedAtOrAfter, study_created_at)
	match_less(criteria.studyCreatedBefore, study_created_at)
	match_in_list(criteria.isaFileTemplateNameFilter, template_name)
	# match_linked_field_and_value(criteria.linkedFieldAndValueFilter, linked_field, linked_field_value)
}

match_linked_field_and_value(filter, field_name, field_value) := true if {
	filter == null
}

match_linked_field_and_value(filter, field_name, field_value) := true if {
	filter != null
	matched = { item | 
        some item in filter
		item.name == field_name
		item.value == null
	}
	count(matched) > 0
}

match_linked_field_and_value(filter, field_name, field_value) := true if {
	filter != null
	matched = { item |
		some item in filter
		item.name == field_name
		item.value == field_value
	}
	count(matched) > 0
}


match_equal(filter, value) := true if {
	filter == null
}

match_equal(filter, value) := true if {
	filter != null
	value == filter
}

match_in_list(filter, value) := true if {
	filter == null
}

match_in_list(filter, value) := true if {
	filter != null
	value in filter
}

match_equal_or_greater(filter, value) := true if {
	filter == null
}

match_equal_or_greater(filter, value) := true if {
	filter != null
	value >= filter
}

match_less(filter, value) := true if {
	filter == null 
}

match_less(filter, value) := true if {
	filter != null
	value < filter
}