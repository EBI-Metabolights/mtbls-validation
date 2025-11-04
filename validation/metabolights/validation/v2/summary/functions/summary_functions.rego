package metabolights.validation.v2.summary.functions

import rego.v1

filter_messages(rules, rule_id, message_type, source_file) := messages if {

	filtered_rules := { rule |
		some rule, _ in rules
		startswith(rule, rule_id)
	}
	
	messages := {violation.identifier |
		some rule in filtered_rules
		some violation in rules[rule]
		violation.type == message_type
		violation.sourceFile == source_file
	}
}

critical_messages(rules, rule_id, source_file) := messages if {

	filtered_rules := { rule |
		some rule, _ in rules
		startswith(rule, rule_id)
	}
	
	messages := {violation.identifier |
		some rule in filtered_rules
		some violation in rules[rule]
		violation.type == "ERROR"
		violation.priority == "CRITICAL"
		violation.sourceFile == source_file
	}
}

rule_result(rule_id, title, description, type, priority, section, source_file, violation_count) := result if { 
	result := {
		"identifier": rule_id,
		"title": title,
		"description": description,
		"type": type,
		"priority": priority,
		"section": section,
		"sourceFile": source_file,
		"sourceColumnIndex": "",
		"sourceColumnHeader": "",
		"values": [],
		"hasMoreViolations": violation_count > 0,
		"totalViolations": violation_count,
		"violation": "",
	}
}

section_summary_message(rules, rule_id, title, _, section, source_file) := result if {
	messages := critical_messages(rules, rule_id, source_file)
	count(messages) > 0
	result := rule_result(rule_id, title, "There are error messages.", "ERROR", "CRITICAL", section, source_file, count(messages))
}

section_summary_message(rules, rule_id, title, _, section, source_file) := result if {
	criticals := critical_messages(rules, rule_id, source_file)
	count(criticals) == 0
	errors := filter_messages(rules, rule_id, "ERROR", source_file)
	count(errors) > 0
	result := rule_result(rule_id, title, "There are critical error messages.", "ERROR", "HIGH", section, source_file, count(errors))
}

section_summary_message(rules, rule_id, title, description, section, source_file) := result if {
	criticals := critical_messages(rules, rule_id, source_file)
	count(criticals) == 0
	errors := filter_messages(rules, rule_id, "ERROR", source_file)
	count(errors) == 0
	result := rule_result(rule_id, title, description, "SUCCESS", "HIGH", section, source_file, 0)
}