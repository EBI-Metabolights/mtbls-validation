package metabolights.validation.v2.rules.phase2.summary

import data.metabolights.validation.v2.rules.phase2.violations
import data.metabolights.validation.v2.summary.functions as f
import rego.v1

# METADATA
# title: Validation summary for assay file values.
# description: There is no general value error in assay files.
# custom:
#  rule_id: rule_a_200_090
#  section: assays.general
rule_a_200_090 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.assays
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase2.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for sample name values in assay file.
# description: There is no sample name error in assay files.
# custom:
#  rule_id: rule_a_200_100
#  section: assays.sample
rule_a_200_100 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.assays
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase2.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for metabolite assignment filename values in assay file.
# description: There is no metabolite assignment filename errors in assay files.
# custom:
#  rule_id: rule_a_200_200
#  section: assays.metabolite_identification
rule_a_200_200 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.assays
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase2.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}


# METADATA
# title: Validation summary for mass spectrometry column value errors in assay file.
# description: There is no mass spectrometry column value errors in assay files.
# custom:
#  rule_id: rule_a_200_300
#  section: assays.mass_spectrometry
rule_a_200_300 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.assays
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase2.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for NMR  column value errors in assay file.
# description: There is no NMR column value errors in assay files.
# custom:
#  rule_id: rule_a_200_400
#  section: assays.nmr_assay
rule_a_200_400 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.assays
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase2.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for NMR  column value errors in assay file.
# description: There is no NMR column value errors in assay files.
# custom:
#  rule_id: rule_a_200_500
#  section: assays.data_transformation
rule_a_200_500 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.assays
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase2.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}


# METADATA
# title: Validation summary for chromatography protocol section in assay file.
# description: There is no chromatography protocol section specific errors in assay files.
# custom:
#  rule_id: rule_a_200_600
#  section: assays.data_transformation
rule_a_200_600 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.assays
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase2.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for sample file values of sample file.
# description: There is no sample file general value error.
# custom:
#  rule_id: rule_s_200_090
#  section: samples.general
rule_s_200_090 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.samples
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase2.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for sample file characteristics values of sample file.
# description: There is no sample file characteristics value error.
# custom:
#  rule_id: rule_s_200_100
#  section: samples.general
rule_s_200_100 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.samples
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase2.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for sample file sample name and factor values of sample file.
# description: There is no sample file sample name and factor value error.
# custom:
#  rule_id: rule_s_200_200
#  section: samples.general
rule_s_200_200 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.samples
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase2.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

