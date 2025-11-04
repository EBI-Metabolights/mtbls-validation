package metabolights.validation.v2.rules.phase3.summary

import data.metabolights.validation.v2.rules.phase3.violations
import data.metabolights.validation.v2.summary.functions as f
import rego.v1

# METADATA
# title: Validation summary for general rules of metabolite assignment file.
# description: There is no metabolite assignment file general value error.
# custom:
#  rule_id: rule_m_300_090
#  section: samples.general
rule_m_300_090 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.metaboliteAssignments
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase3.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for MS related column values of metabolite assignment file.
# description: There is no MS related column value error.
# custom:
#  rule_id: rule_m_300_100
#  section: samples.general
rule_m_300_100 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.metaboliteAssignments
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase3.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for NMR related column values of metabolite assignment file.
# description: There is no NMR related column value error.
# custom:
#  rule_id: rule_m_300_200
#  section: samples.general
rule_m_300_200 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.metaboliteAssignments
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase3.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}
