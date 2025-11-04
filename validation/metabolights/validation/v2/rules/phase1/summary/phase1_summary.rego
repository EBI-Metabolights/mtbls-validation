package metabolights.validation.v2.rules.phase1.summary

import rego.v1
import data.metabolights.validation.v2.summary.functions as f


# METADATA
# title: Input schema validation summary.
# description: Input data has valid JSON schema.
# custom:
#  rule_id: rule___100_000
#  section: input
#  source_file: input
rule___100_000 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		meta.custom.source_file,
	)
}

# METADATA
# title: Validation summary for parser messages of Investigation.txt file.
# description:  There is no parser error for Investigation.txt file.
# custom:
#  rule_id: rule___100_100
#  section: input
#  source_file: input
rule___100_100 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		meta.custom.source_file,
	)
}


# METADATA
# title: Validation summary for parser messages of sample file.
# description:  There is no parser error for sample file.
# custom:
#  rule_id: rule___100_200
#  section: input
rule___100_200 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.samples
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}



# METADATA
# title: Validation summary for parser messages of assay file.
# description:  There is no parser error for assay file.
# custom:
#  rule_id: rule___100_300
#  section: input
rule___100_300 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.assays
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}



# METADATA
# title: Validation summary for parser messages of metabolite assignment file.
# description:  There is no parser error for metabolite assignment file.
# custom:
#  rule_id: rule___100_400
#  section: input
rule___100_400 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.metaboliteAssignments
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for Ontology Source Reference section of i_Investigation.txt.
# description: There is no error in Ontology Source Reference section of i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_100
#  section: investigation.ontologySourceReferences
#  source_file: i_Investigation.txt
rule_i_100_100 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		meta.custom.source_file,
	)
}

# # METADATA
# # title: Validation summary for Investigation section of i_Investigation.txt.
# # description: There is no error in Investigation section of i_Investigation.txt.
# # custom:
# #  rule_id: rule_i_100_200
# #  section: investigation.investigation
# #  source_file: i_Investigation.txt
# rule_i_100_200 contains result if {
# 	meta := rego.metadata.rule()
# 	result := f.section_summary_message(
# 		data.metabolights.validation.v2.rules.phase1.violations,
# 		meta.custom.rule_id,
# 		meta.title,
# 		meta.description,
# 		meta.custom.section,
# 		meta.custom.source_file,
# 	)
# }


# METADATA
# title: Validation summary for study section of i_Investigation.txt.
# description: There is no error in study section of i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_300
#  section: investigation.studies
#  source_file: i_Investigation.txt
rule_i_100_300 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		meta.custom.source_file,
	)
}

# METADATA
# title: Validation summary for study design descriptor section of i_Investigation.txt.
# description: There is no error in study design descriptor section of i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_310
#  section: investigation.studyDesignDescriptors
#  source_file: i_Investigation.txt
rule_i_100_310 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		meta.custom.source_file,
	)
}

# METADATA
# title: Validation summary for study publications section of i_Investigation.txt.
# description: There is no error in study publications section of i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_320
#  section: investigation.studyPublications
#  source_file: i_Investigation.txt
rule_i_100_320 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		meta.custom.source_file,
	)
}

# METADATA
# title: Validation summary for study factors section of i_Investigation.txt.
# description: There is no error in study factors section of i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_330
#  section: investigation.studyFactors
#  source_file: i_Investigation.txt
rule_i_100_330 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		meta.custom.source_file,
	)
}


# METADATA
# title: Validation summary for study assays section of i_Investigation.txt.
# description: There is no error in study assays section of i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340
#  section: investigation.studyAssays
#  source_file: i_Investigation.txt
rule_i_100_340 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		meta.custom.source_file,
	)
}

# METADATA
# title: Validation summary for study protocols section of i_Investigation.txt.
# description: There is no error in study protocols section of i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_350
#  section: investigation.studyProtocols
#  source_file: i_Investigation.txt
rule_i_100_350 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		meta.custom.source_file,
	)
}


# METADATA
# title: Validation summary for study contacts section of i_Investigation.txt.
# description: There is no error in study protocols section of i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_360
#  section: investigation.studyContacts
#  source_file: i_Investigation.txt
rule_i_100_360 contains result if {
	meta := rego.metadata.rule()
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		meta.custom.source_file,
	)
}


# METADATA
# title: Validation summary for sample file columns and rows for sample file.
# description: There is no sample file column or row error.
# custom:
#  rule_id: rule_s_100_100
#  section: samples.general
rule_s_100_100 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.samples
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}


# METADATA
# title: Validation summary for file columns and rows of assay file.
# description: There is no assay file column or row error.
# custom:
#  rule_id: rule_a_100_100
#  section: assays.general
rule_a_100_100 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.assays
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}

# METADATA
# title: Validation summary for metabolite assignment file columns and rows.
# description: There is no metabolite assignment file column or row error.
# custom:
#  rule_id: rule_m_100_100
#  section: maf.general
rule_m_100_100 contains result if {
	meta := rego.metadata.rule()
	some file_name, _ in input.metaboliteAssignments
	result := f.section_summary_message(
		data.metabolights.validation.v2.rules.phase1.violations,
		meta.custom.rule_id,
		meta.title,
		meta.description,
		meta.custom.section,
		file_name,
	)
}