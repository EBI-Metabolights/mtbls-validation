package metabolights.validation.v2.rules.phase4.summary

import data.metabolights.validation.v2.rules.phase4.violations
import data.metabolights.validation.v2.summary.functions as f
import rego.v1

# METADATA
# title: Validation summary for FILES folder general errors.
# description: There is no general errors for FILES folder.
# custom:
#  rule_id: rule_f_400_090
#  section: files.general
rule_f_400_090 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase4.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		"FILES",
	)
}

# METADATA
# title: Validation summary for FILES folder content errors.
# description: There is no study FILES folder validation error.
# custom:
#  rule_id: rule_f_400_100
#  section: files.general
rule_f_400_100 contains result if {
	meta := rego.metadata.rule()

	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase4.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		"FILES",
	)
}
