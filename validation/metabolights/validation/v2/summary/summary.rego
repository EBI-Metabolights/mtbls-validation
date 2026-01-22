package metabolights.validation.v2_summary

import rego.v1

phase1_all_messages contains result if {
	some rule, _ in data.metabolights.validation.v2.rules.phase1.violations
	startswith(rule, "rule_")
	some result in data.metabolights.validation.v2.rules.phase1.violations[rule]
}

phase2_all_messages contains result if {
	some i, j
	data.metabolights.validation.v2.rules.phase2[i]
	startswith(i, "rule_")
	result := data.metabolights.validation.v2.rules.phase2.violations[i][j]
}

phase3_all_messages contains result if {
	some i, j
	data.metabolights.validation.v2.rules.phase3.violations[i]
	startswith(i, "rule_")
	result := data.metabolights.validation.v2.rules.phase3.violations[i][j]
}

phase4_all_messages contains result if {
	some i, j
	data.metabolights.validation.v2.rules.phase4.violations[i]
	startswith(i, "rule_")
	result := data.metabolights.validation.v2.rules.phase4.violations[i][j]
}

all_messages contains message if {
	some phase in {"phase1", "phase2", "phase3", "phase4"}
	some rule_pack, phase_rules in data.metabolights.validation.v2
	some rule_name, rule_list in phase_rules.violations
	startswith(rule_name, "rule_")
	some message in rule_list
}

all_error_messages contains message if {
	some phase in {"phase1", "phase2", "phase3", "phase4"}
	some rule_pack, phase_rules in data.metabolights.validation.v2
	some rule_name, rule_list in phase_rules.violations
	startswith(rule_name, "rule_")
	some message in rule_list
	message.type == "ERROR"
}
