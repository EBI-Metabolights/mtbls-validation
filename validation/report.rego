package metabolights.validation.v2.report

import rego.v1

all_error_messages(input_sets) := message_list if {
	message_list := [message |
		some input_set in input_sets
		some rule, _ in input_set
		startswith(rule, "rule_")
		count(input_set[rule]) > 0

		some message in input_set[rule]
		message.type == "ERROR"
	]
}

all_messages(input_sets) := message_list if {
	message_list := [message |
		some input_set in input_sets
		some rule, _ in input_set
		startswith(rule, "rule_")
		count(input_set[rule]) > 0

		some message in input_set[rule]
	]
}

messages(input_set) := message_list if {
	message_list := [message |
		some rule, _ in input_set
		startswith(rule, "rule_")
		count(input_set[rule]) > 0
		some message in input_set[rule]
	]
}

phase1_report := {
	"violations": messages(data.metabolights.validation.v2.rules.phase1.violations),
	"summary": messages(data.metabolights.validation.v2.rules.phase1.summary),
}

phase2_report := {
	"violations": messages(data.metabolights.validation.v2.rules.phase2.violations),
	"summary": messages(data.metabolights.validation.v2.rules.phase2.summary),
}

phase3_report := {
	"violations": messages(data.metabolights.validation.v2.rules.phase3.violations),
	"summary": messages(data.metabolights.validation.v2.rules.phase3.summary),
}

phase4_report := {
	"violations": messages(data.metabolights.validation.v2.rules.phase4.violations),
	"summary": messages(data.metabolights.validation.v2.rules.phase4.summary),
}

violations_set := {
	data.metabolights.validation.v2.rules.phase1.violations,
	data.metabolights.validation.v2.rules.phase2.violations,
	data.metabolights.validation.v2.rules.phase3.violations,
	data.metabolights.validation.v2.rules.phase4.violations,
}

summary_set := {
	data.metabolights.validation.v2.rules.phase1.summary,
	data.metabolights.validation.v2.rules.phase2.summary,
	data.metabolights.validation.v2.rules.phase3.summary,
	data.metabolights.validation.v2.rules.phase4.summary,
}

complete_report := {
	"violations": all_messages(violations_set),
	"summary": all_messages(summary_set),
	"errors": all_error_messages(violations_set),
}
