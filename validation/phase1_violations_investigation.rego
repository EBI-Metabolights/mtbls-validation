package metabolights.validation.v2.phase1.violations

import rego.v1
import data.metabolights.validation.v2.functions as f


#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: ONTOLOGY SOURCE REFERENCE SECTION
#########################################################################################################
#########################################################################################################

# METADATA
# title: Term Source Name length less than 2 characters in investigation file.
# description: Term Source Name should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_100_001_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.ontologySourceReferences
rule_i_100_100_001_01 contains result if {
	min_count := 2
	some i
	sources = input.investigation.ontologySourceReferences.references
	count(sources[i].sourceName) < min_count
	msg := sprintf("Term Source Name should be defined for: '%v', min length: %v, index: %v, current value: '%v' ", [sources[i].sourceFile, min_count, i + 1, sources[i].sourceName])

	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Term Source File length less than 2 characters in investigation file.
# description: Term Source File should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_100_002_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.ontologySourceReferences
rule_i_100_100_002_01 contains result if {
	min_count := 2
	some i
	sources = input.investigation.ontologySourceReferences.references
	count(sources[i].sourceFile) < min_count
	msg := sprintf("Term Source File at index: %v should be defined for: '%v', min length: %v, current value: '%v' ", [i + 1, sources[i].sourceName, min_count, sources[i].sourceFile])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# # METADATA
# # title: There is no violation for ontology source reference section in i_Investigation.txt
# # description: There is no violation for ontology source reference section in i_Investigation.txt
# # custom:
# #  rule_id: rule_i_100_100_000_01
# #  type: SUCCESS
# #  priority: HIGH
# #  section: investigation.ontologySourceReferences
# rule_i_100_100_000_01 contains result if {
# 	count(rule_i_100_100_001_01) == 0
# 	count(rule_i_100_100_002_01) == 0

# 	msg := ""
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: INVESTIGATON SECTION
#########################################################################################################
#########################################################################################################

# # METADATA
# # title: Investigation Title length less than 10 characters.
# # description: Investigation Title should be defined with length equal or greater than 10 characters. Please use same title as first publication.
# # custom:
# #  rule_id: rule_i_100_200_001_01
# #  type: WARNING
# #  priority: MEDIUM
# #  section: investigation.investigation
# rule_i_100_200_001_01 contains result if {
# 	count(input.investigation.title) < 25
# 	msg := "Investigation title should be defined."
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }


# # METADATA
# # title: Investigation Identifier not valid.
# # description: Investigation Identifier should be valid format (e.g., MTBLS<positive_number> or REQ{datetime}<positive_number>).
# # custom:
# #  rule_id: rule_i_100_200_002_01
# #  type: ERROR
# #  priority: MEDIUM
# #  section: investigation.investigation
# rule_i_100_200_002_01 contains result if {
# 	pattern := `^(MTBLS|REQ)\d{1,20}$`
# 	input.investigation.identifier
# 	not regex.match(pattern, input.investigation.identifier)
# 	msg := sprintf("Investigation identifier '%v' does not match pattern", [input.investigation.identifier])
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }


# # METADATA
# # title: Investigation Submission Date not valid.
# # description: Investigation Submission Date should be valid date and ISO8601 format (e.g., 2023-01-01).
# # custom:
# #  rule_id: rule_i_100_200_003_01
# #  type: WARNING
# #  priority: MEDIUM
# #  section: investigation.studies
# rule_i_100_200_003_01 contains result if {
# 	not time.parse_ns("2006-01-02", input.investigation.submissionDate)
# 	msg := sprintf("Investigation submission date '%v' is not converted to a valid date. Expected ISO8601 (e.g., 2023-01-01) format.", [input.investigation.submissionDate])
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }


# # METADATA
# # title: Investigation Public Release Date not valid.
# # description: Investigation Public Release Date should be valid date and ISO8601 format (e.g., 2023-01-01).
# # custom:
# #  rule_id: rule_i_100_200_004_01
# #  type: WARNING
# #  priority: MEDIUM
# #  section: investigation.studies
# rule_i_100_200_004_01 contains result if {

# 	not time.parse_ns("2006-01-02", input.investigation.publicReleaseDate)
# 	msg := sprintf("Investigation public release date '%v' is not converted to a valid date. Expected ISO8601 (e.g., 2023-01-01) format.", [input.investigation.publicReleaseDate])
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }


#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: INVESTIGATION PUBLICATIONS
#########################################################################################################
#########################################################################################################

# # METADATA
# # title: Investigation Publications section is not defined
# # description:  i_Investigation.txt.
# # custom:
# #  rule_id: rule_i_100_210_001_01
# #  type: WARNING
# #  priority: HIGH
# #  section: investigation.investigationPublications
# rule_i_100_210_INVESTIGATION_PUBLICATIONS contains result if {
# 	not input.investigation.investigationPublications.publications
# 	msg := "Investigation publications keyword is not defined"
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

# # METADATA
# # title: No violation in investigation publication section
# # description: Investigation publication section is OK
# # custom:
# #  rule_id: rule_i_100_210_000_01
# #  type: SUCCESS
# #  priority: HIGH
# #  section: investigation.investigationPublications
# rule_i_100_SUCCESS_MESSAGES contains result if {
# 	count(rule_i_100_210_INVESTIGATION_PUBLICATIONS) == 0
# 	msg := ""
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: INVESTIGATION CONTACTS
#########################################################################################################
#########################################################################################################

# # METADATA
# # title: Investigation contacts keyword is not defined
# # description: Investigation contacts keyword is not defined
# # custom:
# #  rule_id: rule_i_100_220_001_01
# #  type: WARNING
# #  priority: HIGH
# #  section: investigation.investigationContacts
# rule_i_100_220_INVESTIGATION_CONTACTS contains result if {
# 	not input.investigation.investigationContacts.people
# 	msg := "Investigation contacts keyword is not defined."
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

# # METADATA
# # title: No violation in investigation contacts section
# # description: Investigation contacts section is OK
# # custom:
# #  rule_id: rule_i_100_220_000_01
# #  type: SUCCESS
# #  priority: HIGH
# #  section: investigation.investigationContacts
# rule_i_100_SUCCESS_MESSAGES contains result if {
# 	count(rule_i_100_220_INVESTIGATION_CONTACTS) == 0
# 	msg := ""
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: STUDY SECTION
#########################################################################################################
#########################################################################################################

# METADATA
# title: No study referenced in investigation file.
# description: Only one study should be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_300_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studies
rule_i_100_300_001_01 contains result if {
	length = count(input.investigation.studies)
	length < 1
	msg := "There is no study. One study should be defined."
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: More than one study referenced in investigation file.
# description: Only one study should be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_300_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studies
rule_i_100_300_001_02 contains result if {
	length = count(input.investigation.studies)
	length > 1
	msg := sprintf("There are %v studies. At most one study should be defined.", [length])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Identifier not valid.
# description: Study Identifier should be valid format (e.g., MTBLS(positive_number) or REQ(datetime)).
# custom:
#  rule_id: rule_i_100_300_002_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studies
rule_i_100_300_002_01 contains result if {
	pattern := `^(MTBLS|REQ)\d{1,20}$`
	some i
	input.investigation.studies[i].identifier
	not regex.match(pattern, input.investigation.studies[i].identifier)
	msg := sprintf("Study identifier '%v' does not match pattern", [input.investigation.studies[i].identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Title length less than 25 characters.
# description: Study Title should be defined with length equal or greater than 25 characters. Please use same title as first publication.
# custom:
#  rule_id: rule_i_100_300_003_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studies
rule_i_100_300_003_01 contains result if {
	min_count := 25
	study := input.investigation.studies[i]
	count(study.title) < min_count
	msg := sprintf("Study title should be at least %v characters for study %v. Current length: %v.", [min_count, study.identifier, count(study.title)])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Non-printable characters in Study Title.
# description: Study title should contain only printable characters.
# custom:
#  rule_id: rule_i_100_300_003_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studies
rule_i_100_300_003_02 contains result if {
	def := data.metabolights.validation.v2.phase1.definitions 
	pattern := sprintf("[^%v]", [def._ALLOWED_CHARS_PATTERN])
	study := input.investigation.studies[i]
	count(study.title) > 0
	matches = regex.find_n(pattern, study.title, -1)
	matches_set := {x| x := matches[_]}
	count(matches_set) > 0
	matches_set_str = ""
	msg := sprintf("Non printible characters in study title '%v' of study %v: Non accepted char list: '%v'", [study.title, study.identifier, matches_set_str])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Study Title contains only template message.
# description: Study title should be updated. Do not use template message 'Please update the study title'.
# custom:
#  rule_id: rule_i_100_300_003_03
#  type: ERROR
#  priority: HIGH
#  section: investigation.studies
rule_i_100_300_003_03 contains result if {
	
	some idx, study in input.investigation.studies
	startswith(lower(study.title), "please update")
	msg := sprintf("Study (index %v) title starts with template message. value: '%v'", [idx, study.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Study Description length less than 60 characters.
# description: Study Description should be defined with length equal or greater than 60 characters. Please use abstract of first publication.
# custom:
#  rule_id: rule_i_100_300_004_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studies
rule_i_100_300_004_01 contains result if {
	min_count = 60
	count(input.investigation.studies[i].description) < min_count
	msg := sprintf("Study description should be at least %v characters for %v. Current length: '%v'", [min_count, input.investigation.studies[i].identifier, count(input.investigation.studies[i].description)])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}



# METADATA
# title: Study abstract/description contains only template message.
# description: Study abstract/description should be updated. Do not use template message 'Please update the study abstract/description'.
# custom:
#  rule_id: rule_i_100_300_004_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studies
rule_i_100_300_004_02 contains result if {
	some idx, study in input.investigation.studies
	startswith(lower(study.description), "please update")
	msg := sprintf("Study (index %v) abstract/description starts with template message. value: '%v'", [idx, study.description])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Study Submission Date not valid.
# description: Study Submission Date should be valid date and ISO8601 format (e.g., 2023-01-01).
# custom:
#  rule_id: rule_i_100_300_005_01
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studies
rule_i_100_300_005_01 contains result if {
	some i
	study := input.investigation.studies[i]
	not time.parse_ns("2006-01-02", study.submissionDate)
	msg := sprintf("Study submission date '%v' is not converted to a valid date for the study %v. Expected ISO8601 (e.g., 2023-01-01) format.", [study.submissionDate, study.identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Public Release Date not valid.
# description: Study Public Release Date should be valid date and ISO8601 format (e.g., 2023-01-01).
# custom:
#  rule_id: rule_i_100_300_006_01
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studies
rule_i_100_300_006_01 contains result if {
	some i
	study := input.investigation.studies[i]	
	not time.parse_ns("2006-01-02", study.publicReleaseDate)
	msg := sprintf("Study public release date '%v' is not converted to a valid date for the study %v. Expected ISO8601 (e.g., 2023-01-01) format.", [study.publicReleaseDate, study.identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}


#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: STUDY DESIGN DESCRIPTORS SECTION
#########################################################################################################
#########################################################################################################

# # METADATA
# # title: Study design descriptor tag
# # description: Design descriptors tag should be defined for a study
# # custom:
# #  rule_id: rule_i_100_310_001_01
# #  type: ERROR
# #  priority: HIGH
# #  section: investigation.studyDesignDescriptors
# rule_i_100_310_STUDY_DESIGN_DESCRIPTORS contains result if {
# 	min_count = 1
# 	some i
# 	not input.investigation.studies[i].studyDesignDescriptors.designTypes
# 	msg := sprintf("At least %v design type should be defined for study: %v", [min_count, input.investigation.studies[i].identifier])
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

# METADATA
# title: There are less than 3 Study Design Descriptors in the Study Design Descriptors section of investigation file.
# description: At least 3 study design descriptors should be defined.
# custom:
#  rule_id: rule_i_100_310_001_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_001_01 contains result if {
	min_count = 3
	some i
	count(input.investigation.studies[i].studyDesignDescriptors.designTypes) < min_count
	msg := sprintf("At least %v design descriptors should be defined for study: %v", [min_count, input.investigation.studies[i].identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Design Type is empty.
# description: Study Design Type should be defined.
# custom:
#  rule_id: rule_i_100_310_002_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_002_01 contains result if {
	min_count := 1
	some i, j
	count(input.investigation.studies[i].studyDesignDescriptors.designTypes[j].term) < min_count

	msg := sprintf("Study design type should be defined for the study %v. Index: %v", [input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Design Type Term Accession Number is empty.
# description: Study Design Type Term Accession Number should be defined.
# custom:
#  rule_id: rule_i_100_310_003_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_003_01 contains result if {
	min_count = 1
	some i, j
	input.investigation.studies[i].studyDesignDescriptors.designTypes[j].termAccessionNumber
	count(input.investigation.studies[i].studyDesignDescriptors.designTypes[j].termAccessionNumber) < min_count

	msg := sprintf("Study design type term accession number should be set for the study %v. Index: %v", [input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Design Type Term Source REF is empty.
# description: Study Design Type Term Source REF should be defined.
# custom:
#  rule_id: rule_i_100_310_004_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_004_01 contains result if {
	min_count = 1
	some i, j
	input.investigation.studies[i].studyDesignDescriptors.designTypes[j].termSourceRef
	count(input.investigation.studies[i].studyDesignDescriptors.designTypes[j].termSourceRef) < min_count

	msg := sprintf("Study design type termSourceRef should be set for the study %v. Index: %v", [input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Design Type Term Source REF not referenced in investigation file.
# description: Study Design Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_310_004_02
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_004_02 contains result if {
	def := data.metabolights.validation.v2.phase1.definitions 
	some i, study in input.investigation.studies
	some j, design_descriptor in study.studyDesignDescriptors.designTypes
	count(design_descriptor.termSourceRef) > 0
	not design_descriptor.termSourceRef in data.metabolights.validation.v2.phase1.definitions._ONTOLOGY_SOURCE_REFERENCE_NAMES
	termSourceRef := input.investigation.studies[i].studyDesignDescriptors.designTypes[j].termSourceRef

	msg := sprintf("Study design type source reference at index %v, '%v', is not in the sources reference list for study: %v.", [j + 1, termSourceRef, input.investigation.studies[i].identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Design Type Term Source REF not in prioritised control list.
# description: A prioritised control list is defined. Review and select from the prioritised control list if possible.
# custom:
#  rule_id: rule_i_100_310_004_03
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studyDesignDescriptors
rule_i_100_310_004_03 contains result if {
	def := data.metabolights.validation.v2.phase1.definitions 
	min_count = 3
	some i, j
	termSourceRef := input.investigation.studies[i].studyDesignDescriptors.designTypes[j].termSourceRef

	termSourceRef in def._ONTOLOGY_SOURCE_REFERENCE_NAMES
	not termSourceRef in def.CL_STUDY_DESIGN_DESCRIPTOR_REF_SOURCES
	msg := sprintf("Study design type source reference at index %v, '%v', is not in Metabolights control list for study: %v, expected: [%v] ", [j + 1, termSourceRef, input.investigation.studies[i].identifier, def.CL_STUDY_DESIGN_DESCRIPTOR_REF_SOURCES_STR])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# # METADATA
# # title: No error message in study design descriptors section
# # description: No error message in study design descriptors section
# # custom:
# #  rule_id: rule_i_100_310_000_01
# #  type: SUCCESS
# #  priority: HIGH
# #  section: investigation.studyDesignDescriptors
# rule_i_100_310_000_01 contains result if {
# 	count(rule_i_100_310_001_01) == 0
# 	count(rule_i_100_310_002_01) == 0
# 	count(rule_i_100_310_004_02) == 0

# 	msg := ""
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: STUDY PUBLICATIONS SECTION
#########################################################################################################
#########################################################################################################

# METADATA
# title: No study publications referenced in investigation file.
# description: At least one study publications must be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_320_001_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_001_01 contains result if {
	min_count := 1
	some i
	length = count(input.investigation.studies[i].studyPublications.publications)
	length < min_count
	msg := sprintf("At least %v publication should be defined for study %v", [min_count, input.investigation.studies[i].identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: DOI or PubMed ID is not defined for a published study publication.
# description: A published publication should have a valid DOI or PubMed ID.
# custom:
#  rule_id: rule_i_100_320_002_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_002_01 contains result if {
	some i, j
	studies := input.investigation.studies
	publication := studies[i].studyPublications.publications[j]
	publication.status.term == "Published"
	count(publication.pubMedId) == 0
	count(publication.doi) == 0
	msg := sprintf("DOI or PubMed ID is not defined for %v publication '%v'. ", [studies[i].identifier, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: DOI invalid for published study publication.
# description: A study publication with status published should have valid DOI.
# custom:
#  rule_id: rule_i_100_320_003_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_003_01 contains result if {
	some i, j
	studies = input.investigation.studies
	pattern = "^10.\\.+/.+$"
	publication := studies[i].studyPublications.publications[j]
	publication.status.term == "Published"

	# count(publication.pubMedId) == 0
	count(publication.doi) > 0

	not regex.match(pattern, publication.doi)

	msg := sprintf("DOI '%v' is not valid for %v publication '%v'.", [publication.doi, studies[i].identifier, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: DOI format invalid for study publication.
# description: If DOI is defined, its format should be a valid.
# custom:
#  rule_id: rule_i_100_320_003_02
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studyPublications
rule_i_100_320_003_02 contains result if {
	some i, j
	studies = input.investigation.studies
	pattern = "^10.\\.+/.+$"
	publication := studies[i].studyPublications.publications[j]
	publication.status.term != "Published"
	count(publication.doi) > 0
	not regex.match(pattern, publication.doi)
	msg := sprintf("DOI '%v' is not valid for %v publication '%v'.", [publication.doi, studies[i].identifier, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: PubMed ID invalid for published study publication.
# description: A study publication with status published should have valid PubMed ID. Valid PubMed ID contains only digits.
# custom:
#  rule_id: rule_i_100_320_004_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_004_01 contains result if {
	some i, j
	studies = input.investigation.studies
	pattern = "^\\d\\d{,20}$"
	publication := studies[i].studyPublications.publications[j]
	publication.status.term == "Published"
	count(publication.pubMedId) > 0
	# count(publication.doi) == 0
	not regex.match(pattern, publication.pubMedId)
	msg := sprintf("PubMed ID '%v' is not valid for %v publication '%v'.", [publication.pubMedId, studies[i].identifier, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: PubMed ID format invalid for study publication.
# description: If PubMed ID is defined, its format should be valid PubMed ID. Valid PubMed ID contains only digits.
# custom:
#  rule_id: rule_i_100_320_004_02
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studyPublications
rule_i_100_320_004_02 contains result if {
	some i, j
	studies = input.investigation.studies
	pattern = "^\\d\\d{,20}$"
	publication := studies[i].studyPublications.publications[j]
	publication.status.term != "Published"
	count(publication.pubMedId) > 0
	not regex.match(pattern, publication.pubMedId)
	msg := sprintf("PubMed ID '%v' is not valid for %v publication '%v'.", [publication.pubMedId, studies[i].identifier, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Publication Title length less than 20 characters.
# description: Study Publication Title must be defined with length equal or greater than 20 characters.
# custom:
#  rule_id: rule_i_100_320_005_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_005_01 contains result if {
	min_count = 20
	count(input.investigation.studies[i].studyPublications.publications[j].title) < min_count
	msg := sprintf("Study %v publication title should be at least %v characters long. Please use the abstract of the publication. Current value '%v'", [input.investigation.studies[i].identifier, min_count, input.investigation.studies[i].studyPublications.publications[j].title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Study Publication Author List is empty.
# description: Study Publication Author List must be defined.
# custom:
#  rule_id: rule_i_100_320_006_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_006_01 contains result if {
	some i, j
	publication := input.investigation.studies[i].studyPublications.publications[j]
	authors := split(publication.authorList, ",")
    violated_authors := {x | some author in authors; count(trim_space(author)) < 4; x := trim_space(author)} 
	count(violated_authors) > 0
	invalid_authors := concat(", ", violated_authors)
	msg := sprintf("Author name should be greater than 3 character for the study %v. Publication: '%v'. Author name(s): '%v'", [input.investigation.studies[i].identifier, publication.title, invalid_authors])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Publication Status is empty.
# description: Study Publication Status must be defined.
# custom:
#  rule_id: rule_i_100_320_007_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_007_01 contains result if {
	def := data.metabolights.validation.v2.phase1.definitions 
	min_count = 1
	some i, j
	publication := input.investigation.studies[i].studyPublications.publications[j]
	count(publication.status.term) < min_count
	msg := sprintf("Publication status is not valid for the study %v publication. Current value '%v', expected values: [%v]', minimum length: %v, publication: '%v'", [input.investigation.studies[i].identifier, publication.status.term, def.CL_PUBLICATION_STATUS_TERMS_STR, min_count, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Publication Status not in prioritised control list.
# description: A prioritised control list is defined. Review and select from the prioritised control list if possible.
# custom:
#  rule_id: rule_i_100_320_007_02
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studyPublications
rule_i_100_320_007_02 contains result if {
	def := data.metabolights.validation.v2.phase1.definitions 
	some i, j
	publication := input.investigation.studies[i].studyPublications.publications[j]
	not publication.status.term in def.CL_PUBLICATION_STATUS_TERMS
	msg := sprintf("Publication status is not in control list for the study %v publication. Current value '%v', expected values: [%v]', publication: '%v'", [input.investigation.studies[i].identifier, publication.status.term, def.CL_PUBLICATION_STATUS_TERMS_STR, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Publication Status Term Accession Number is empty.
# description: Study Publication Status Term Accession Number should be defined.
# custom:
#  rule_id: rule_i_100_320_008_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_008_01 contains result if {
	min_count = 1
	some i, j
	publication := input.investigation.studies[i].studyPublications.publications[j]
	count(publication.status.termAccessionNumber) < min_count
	msg := sprintf("Study publication status accession number is not valid. Study: %v, publication index: %v, current value '%v', publication title: '%v'", [input.investigation.studies[i].identifier, j + 1, publication.status.termAccessionNumber, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Publication Status Term Source REF is empty.
# description: Study Publication Status Term Source REF should be defined.
# custom:
#  rule_id: rule_i_100_320_009_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_009_01 contains result if {
	min_count = 1
	some i, j
	publication := input.investigation.studies[i].studyPublications.publications[j]
	count(publication.status.termSourceRef) < min_count
	msg := sprintf("Publication status term source reference is not valid. Study: %v, publication index: %v, current value '%v', publication: '%v'", [input.investigation.studies[i].identifier, j + 1, publication.status.termSourceRef, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Publication Status Term Source REF not referenced in investigation file.
# description: Study Publication Status Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_320_009_02
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_009_02 contains result if {
	def := data.metabolights.validation.v2.phase1.definitions 
	min_count = 3
	some i, j
	publication := input.investigation.studies[i].studyPublications.publications[j]
	count(publication.status.termSourceRef) > 0
	not publication.status.termSourceRef in def._ONTOLOGY_SOURCE_REFERENCE_NAMES
	msg := sprintf("Publication status source reference '%v' is not in the sources reference list. Study: %v, publication: '%v'", [publication.status.termSourceRef, input.investigation.studies[i].identifier, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Publication Status Term Source REF not in prioritised control list.
# description: A prioritised control list is defined. Review and select from the prioritised control list if possible.
# custom:
#  rule_id: rule_i_100_320_009_03
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studyPublications
rule_i_100_320_009_03 contains result if {
	def := data.metabolights.validation.v2.phase1.definitions 
	min_count = 3
	some i, j

	publication := input.investigation.studies[i].studyPublications.publications[j]
	count(publication.status.termSourceRef) > 0
	not publication.status.termSourceRef in def.CL_PUBLICATION_STATUS_REF_SOURCES
	msg := sprintf("Publication status source reference  '%v' is not in control list. Study: %v, expected [%v], publication: '%v'", [publication.status.termSourceRef, input.investigation.studies[i].identifier, def.CL_PUBLICATION_STATUS_REF_SOURCES_STR, publication.title])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# # METADATA
# # title: No error message in study publications section
# # description: No error message in study publications section
# # custom:
# #  rule_id: rule_i_100_320_000_01
# #  type: SUCCESS
# #  priority: HIGH
# #  section: investigation.studyPublications
# rule_i_100_320_000_01 contains result if {
# 	count(rule_i_100_320_001_01) == 0
# 	count(rule_i_100_320_005_01) == 0
# 	count(rule_i_100_320_006_01) == 0
# 	count(rule_i_100_320_007_01) == 0
# 	count(rule_i_100_320_008_01) == 0
# 	count(rule_i_100_320_009_01) == 0
# 	count(rule_i_100_320_009_02) == 0

# 	msg := ""
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE STUDY FACTORS
#########################################################################################################
#########################################################################################################

# METADATA
# title: No study factors referenced in investigation file.
# description: At least one study factors must be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_330_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyFactors
rule_i_100_330_001_01 contains result if {
	min_count = 1
	some i
	count(input.investigation.studies[i].studyFactors.factors) < min_count
	msg := sprintf("At least %v factor should be defined for study: %v", [min_count, input.investigation.studies[i].identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Factor Name is empty.
# description: Study Factor Name must be defined.
# custom:
#  rule_id: rule_i_100_330_002_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyFactors
rule_i_100_330_002_01 contains result if {
	min_count = 1
	some i, j
	input.investigation.studies[i].studyFactors.factors[j].name == ""
	msg := sprintf("Study factor name should be set for the study %v. Index: %v", [input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Factor Type length less than 2 characters.
# description: Study Factor Type must be defined with length equal or greater than 2 characters.
# custom:
#  rule_id: rule_i_100_330_003_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyFactors
rule_i_100_330_003_01 contains result if {
	min_count = 2
	some i, j
	count(input.investigation.studies[i].studyFactors.factors[j].type.term) < min_count

	msg := sprintf("Study factor type name should be set for the study %v. Index: %v", [input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Factor Type Term Accession Number is empty.
# description: Study Factor Type Term Accession Number should be defined.
# custom:
#  rule_id: rule_i_100_330_004_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyFactors
rule_i_100_330_004_01 contains result if {
	min_count = 1
	some i, j
	factor := input.investigation.studies[i].studyFactors.factors[j]
	
	count(factor.type.termAccessionNumber) < min_count
	msg := sprintf("Study factor type term accession number should be set for the study %v. Index: %v, Term: '%v'", [input.investigation.studies[i].identifier, j + 1, factor.type.term])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Factor Type Term Source REF is empty.
# description: Study Factor Type Term Source REF should be defined.
# custom:
#  rule_id: rule_i_100_330_005_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyFactors
rule_i_100_330_005_01 contains result if {
	min_count = 2
	some i, j
	factor := input.investigation.studies[i].studyFactors.factors[j]

	count(factor.type.termSourceRef) < min_count
	msg := sprintf("Study factor type term source reference should be set for the study %v. Index: %v, Term: '%v'", [input.investigation.studies[i].identifier, j + 1, factor.type.term])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Factor Type Term Source REF not referenced in investigation file.
# description: Study Factor Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_330_005_02
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyFactors
rule_i_100_330_005_02 contains result if {
	some i, j
	def := data.metabolights.validation.v2.phase1.definitions 
	count(input.investigation.studies[i].studyFactors.factors[j].type.termSourceRef) > 0
	not input.investigation.studies[i].studyFactors.factors[j].type.termSourceRef in def._ONTOLOGY_SOURCE_REFERENCE_NAMES
	msg := sprintf("Study factor type source reference is not in the sources reference list. Study: %v, index: '%v', current value '%v'", [input.investigation.studies[i].identifier, j + 1, input.investigation.studies[i].studyFactors.factors[j].type.termSourceRef])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Factor Type Term Source REF not in prioritised control list.
# description: A prioritised control list is defined. Review and select from the prioritised control list if possible.
# custom:
#  rule_id: rule_i_100_330_005_03
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studyFactors
rule_i_100_330_005_03 contains result if {
	some i, j
	def := data.metabolights.validation.v2.phase1.definitions 
	count(input.investigation.studies[i].studyFactors.factors[j].type.termSourceRef) > 0
	not input.investigation.studies[i].studyFactors.factors[j].type.termSourceRef in def.CL_STUDY_FACTOR_REF_SOURCES
	msg := sprintf("Study factor type source reference is not in the control list. Study: %v, index: '%v', current value '%v', expected: [%v]", [input.investigation.studies[i].identifier, j + 1, input.investigation.studies[i].studyFactors.factors[j].type.termSourceRef, def.CL_STUDY_FACTOR_REF_SOURCES_STR])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# # METADATA
# # title: No error message in study factors section
# # description: No error message in study factors section
# # custom:
# #  rule_id: rule_i_100_330_000_01
# #  type: SUCCESS
# #  priority: HIGH
# #  section: investigation.studyFactors
# rule_i_100_330_000_01 contains result if {
# 	count(rule_i_100_330_001_01) == 0
# 	count(rule_i_100_330_002_01) == 0
# 	count(rule_i_100_330_003_01) == 0
# 	count(rule_i_100_330_004_01) == 0
# 	count(rule_i_100_330_005_01) == 0
# 	count(rule_i_100_330_005_02) == 0

# 	msg := ""
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: STUDY ASSAYS SECTION
#########################################################################################################
#########################################################################################################

# METADATA
# title: No study assays referenced in investigation file.
# description: At least one study assays should be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyAssays
rule_i_100_340_001_01 contains result if {
	min_count = 1
	some i
	count(input.investigation.studies[i].studyAssays.assays) < min_count
	msg := sprintf("At least %v assay should be defined for study: %v", [min_count, input.investigation.studies[i].identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay File Name is empty in investigation file.
# description: Assay file name should be set for each study in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340_002_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyAssays
rule_i_100_340_002_01 contains result if {
	some i, j
	input.investigation.studies[i].studyAssays.assays[j].fileName == ""
	msg := sprintf("Study assay file name should be set for the study %v. Index: %v", [input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay File Name not correct pattern.
# description: Assay file name must start with 'a_' and have extension '.txt'.
# custom:
#  rule_id: rule_i_100_340_002_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyAssays
rule_i_100_340_002_02 contains result if {
	pattern := `^a_.+\.txt$`
	some i
	assay = input.investigation.studies[i].studyAssays.assays[j]
	assay.fileName != ""
	not regex.match(pattern, assay.fileName)
	msg := sprintf("Invalid assay file name for the study %v. Index: %v, current value: '%v'", [input.investigation.studies[i].identifier, j + 1, assay.fileName])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: There are invalid characters in assay file name.
# description: Use only .-_A-Za-z0-9 characters for an assay file name.
# custom:
#  rule_id: rule_i_100_340_002_03
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_002_03 contains result if {
	some i
	assay := input.investigation.studies[i].studyAssays.assays[j]
	count(assay.fileName) > 0
	matches = regex.find_n("[^A-Za-z0-9/._-]", assay.fileName, -1)
	matches_set := {x | x := matches[_]}
	matches_str := concat(" ", matches_set)
	not matches_str == ""
	msg := sprintf("Assay file name contains invalid characters for the study %v. Do not use special characters: %v characters. Index: %v, current value: '%v'", [input.investigation.studies[i].identifier, matches_str, j + 1, assay.fileName])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Study Assay File Name must be unique.
# description: Assay file name must be unique for each study in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340_002_04
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_002_04 contains result if {
	fileNames := [assay.fileName |
        some i, j
        assay := input.investigation.studies[i].studyAssays.assays[j]
    ]

    duplicates := {f |
        some i
        f := fileNames[i]
        count({x | fileNames[x] == f}) > 1
    }
    count(duplicates) > 0

    msg := sprintf(
        "Study Assay File Name must be unique. Found duplicates: %v",
        [duplicates]
    )
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay Measurement Type is empty.
# description: Study Assay Measurement Type should be defined.
# custom:
#  rule_id: rule_i_100_340_003_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_003_01 contains result if {
	min_count = 1
	some i, j
	assay := input.investigation.studies[i].studyAssays.assays[j]
	count(assay.measurementType.term) < min_count
	msg := sprintf("Assay measurement type name should be set for the study %v, assay file '%v'", [input.investigation.studies[i].identifier, assay.fileName])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay Measurement Type Term Accession Number is empty.
# description: Study Assay Measurement Type Term Accession Number should be defined.
# custom:
#  rule_id: rule_i_100_340_004_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_004_01 contains result if {
	min_count = 1
	some i, j

	assay := input.investigation.studies[i].studyAssays.assays[j]
	count(assay.measurementType.termAccessionNumber) < min_count

	msg := sprintf("Assay measurement type term accession number should be set for the study %v, assay file '%v'", [input.investigation.studies[i].identifier, assay.fileName])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay Measurement Type Term Source REF is empty.
# description: Study Assay Measurement Type Term Source REF should be defined.
# custom:
#  rule_id: rule_i_100_340_005_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_005_01 contains result if {
	min_count = 2
	some i, j
	assay := input.investigation.studies[i].studyAssays.assays[j]
	term := assay.measurementType
	count(assay.measurementType.termSourceRef) < min_count
	msg_parameters := [input.investigation.studies[i].identifier, assay.fileName, j + 1, term.termSourceRef]
	msg := sprintf("Assay measurement type term source reference is not set. Study: %v, assay file: '%v', index: %v, current value: '%v'", msg_parameters)
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay Measurement Type Term Source REF not referenced in investigation file.
# description: Study Assay Measurement Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340_005_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_005_02 contains result if {
	some i, j
	def := data.metabolights.validation.v2.phase1.definitions 
	assay := input.investigation.studies[i].studyAssays.assays[j]
	term := assay.measurementType
	count(term.termSourceRef) > 0
	not term.termSourceRef in def._ONTOLOGY_SOURCE_REFERENCE_NAMES
	msg_parameters := [input.investigation.studies[i].identifier, assay.fileName, j + 1, term.termSourceRef]
	msg := sprintf("Assay measurement type source reference is not in the sources reference list. Study: %v, assay file: '%v', index: %v, current value '%v'", msg_parameters)
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay Measurement Type Term Source REF not in prioritised control list.
# description: A prioritised control list is defined. Review and select from the prioritised control list if possible.
# custom:
#  rule_id: rule_i_100_340_005_03
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_005_03 contains result if {
	min_count = 3
	some i, j
	def := data.metabolights.validation.v2.phase1.definitions 
	assay := input.investigation.studies[i].studyAssays.assays[j]
	term := assay.measurementType
	count(term.termSourceRef) > 0
	not term.termSourceRef in data.metabolights.validation.v2.phase1.definitions.CL_STUDY_ASSAY_MEASUREMENT_TYPE_REF_SOURCES
	msg_parameters := [input.investigation.studies[i].identifier, assay.fileName, j + 1, term.termSourceRef, def.CL_STUDY_ASSAY_MEASUREMENT_TYPE_REF_SOURCES_STR]
	msg := sprintf("Assay measurement type source reference is not in the control list. Study: %v, assay file: '%v', index: %v, current value '%v', expected: [%v]", msg_parameters)
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

#----------------------------- Assay technologyType ----------------------------------#

# METADATA
# title: Study Assay Technology Type is empty.
# description: Study Assay Technology Type should be defined.
# custom:
#  rule_id: rule_i_100_340_006_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_006_01 contains result if {
	min_count = 1
	some i, j

	assay := input.investigation.studies[i].studyAssays.assays[j]
	count(assay.technologyType.term) < min_count
	msg := sprintf("Assay technology type name should be set for the study %v. Index: %v", [input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay Technology Type Term Accession Number is empty.
# description: Study Assay Technology Type Term Accession Number should be defined.
# custom:
#  rule_id: rule_i_100_340_007_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_007_01 contains result if {
	min_count = 1
	some i, j
	assay := input.investigation.studies[i].studyAssays.assays[j]
	assay.technologyType.termAccessionNumber == ""

	msg := sprintf("Assay technology type term accession number should be set for the study %v. Index: %v", [input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay Technology Type Term Source REF is empty.
# description: Study Assay Technology Type Term Source REF should be defined.
# custom:
#  rule_id: rule_i_100_340_008_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_008_01 contains result if {
	min_count = 2
	some i, j

	assay := input.investigation.studies[i].studyAssays.assays[j]
	count(assay.technologyType.termSourceRef) < min_count
	msg := sprintf("Assay technology type term source reference should be set for the study %v. Index: %v", [input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay Technology Type Term Source REF not referenced in investigation file.
# description: Study Assay Technology Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340_008_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_008_02 contains result if {
	some i, j
	def := data.metabolights.validation.v2.phase1.definitions 
	assay := input.investigation.studies[i].studyAssays.assays[j]
	assay.technologyType.termSourceRef
	not assay.technologyType.termSourceRef in data.metabolights.validation.v2.phase1.definitions._ONTOLOGY_SOURCE_REFERENCE_NAMES
	msg := sprintf("Assay technology type source reference is not in the sources reference list. Study: %v, index: '%v', current value '%v'", [input.investigation.studies[i].identifier, j + 1, assay.technologyType.termSourceRef])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay Technology Type Term Source REF not in prioritised control list.
# description: A prioritised control list is defined. Review and select from the prioritised control list if possible.
# custom:
#  rule_id: rule_i_100_340_008_03
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_008_03 contains result if {
	some i, j
	assay := input.investigation.studies[i].studyAssays.assays[j]
	count(assay.technologyType.termSourceRef) > 0
	def := data.metabolights.validation.v2.phase1.definitions
	not assay.technologyType.termSourceRef in def.CL_STUDY_ASSAY_TECHNOLOGY_TYPE_REF_SOURCES
	msg := sprintf("Assay technology type source reference is not in the control list. Study: %v, index: '%v', current value '%v', expected: [%v]", [input.investigation.studies[i].identifier, j + 1, assay.technologyType.termSourceRef, def.CL_STUDY_ASSAY_TECHNOLOGY_TYPE_REF_SOURCES_STR])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Assay Technology Platform is empty.
# description: Study Assay Technology Platform should be defined.
# custom:
#  rule_id: rule_i_100_340_009_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_009_01 contains result if {
	min_count := 1
	some i, j

	assay := input.investigation.studies[i].studyAssays.assays[j]
	count(assay.technologyPlatform) < min_count
	msg := sprintf("Study assay technology platform should be set for the study %v. Index: %v", [input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# # METADATA
# # title: No error message in study assays section
# # description: No error message in study assays section
# # custom:
# #  rule_id: rule_i_100_340_000_01
# #  type: SUCCESS
# #  priority: HIGH
# #  section: investigation.studyAssays
# rule_i_100_340_000_01 contains result if {
# 	count(rule_i_100_340_001_01) == 0
# 	count(rule_i_100_340_002_01) == 0
# 	count(rule_i_100_340_002_02) == 0
# 	count(rule_i_100_340_003_01) == 0
# 	count(rule_i_100_340_004_01) == 0
# 	count(rule_i_100_340_005_01) == 0
# 	count(rule_i_100_340_005_02) == 0
# 	count(rule_i_100_340_006_01) == 0
# 	count(rule_i_100_340_007_01) == 0
# 	count(rule_i_100_340_008_01) == 0
# 	count(rule_i_100_340_008_02) == 0
# 	count(rule_i_100_340_009_01) == 0
# 	msg := ""
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: STUDY PROTOCOLS SECTION
#########################################################################################################
#########################################################################################################

# # METADATA
# # title: Valid study protocols tag
# # description: Study protocols should be defined.
# # custom:
# #  rule_id: rule_i_100_350_001_01_study_protocols_count
# #  type: ERROR
# #  priority: CRITICAL
# #  section: investigation.studyProtocols
# rule_i_100_350_STUDY_PROTOCOLS contains result if {
# 	min_count = 1
# 	some i
# 	not input.investigation.studies[i].studyProtocols.protocols
# 	msg := sprintf("At least %v protocol should be defined for study: %v", [min_count, input.investigation.studies[i].identifier])
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

# METADATA
# title: No study protocols referenced in investigation file.
# description: At least one study protocols should be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_350_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyProtocols
rule_i_100_350_001_01 contains result if {
	min_count = 1
	some i
	count(input.investigation.studies[i].studyProtocols.protocols) < min_count
	msg := sprintf("At least %v study protocol should be defined for study: %v", [min_count, input.investigation.studies[i].identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: A study protocol is missing in investigation file.
# description: All study protocols should be defined considering assay technologies used in study.
# custom:
#  rule_id: rule_i_100_350_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyProtocols
rule_i_100_350_001_02 contains result if {
	some i
	protocol_names = {x.name | some j; x := input.investigation.studies[i].studyProtocols.protocols[j]}
	def := data.metabolights.validation.v2.phase1.definitions 
	some protocol_name in def._DEFAULT_MERGED_STUDY_PROTOCOLS
	
	not protocol_name in protocol_names
	technologies := f.to_string(def._PROTOCOL_TECHNOLOGY_MAP[protocol_name])
	msg := sprintf("A study protocol is not defined. '%v' protocol is required for [%v] assays.", [protocol_name, technologies])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Protocol Name length less than 3 characters.
# description: Study Protocol Name should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_i_100_350_002_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_002_01 contains result if {
	min_count := 3
	some i, j
	count(input.investigation.studies[i].studyProtocols.protocols[j].name) < min_count
	msg := sprintf("Study protocol name is too short for the study %v. Min length: %v, Index: %v Current value: '%v'", [input.investigation.studies[i].identifier, min_count, j + 1, input.investigation.studies[i].studyProtocols.protocols[j].name])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Protocol Description length less than 40 characters.
# description: Study Protocol Description should be defined with length equal or greater than 40 characters.
# custom:
#  rule_id: rule_i_100_350_003_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_003_01 contains result if {
	min_count := 40
	some j, protocol in input.investigation.studies[0].studyProtocols.protocols
	length := count(protocol.description)
	length < min_count
	msg := sprintf("Description of study protocol '%v' is too short for the study %v. Min length: %v current length: %v, protocol index: %v", [protocol.name, input.investigation.studies[i].identifier, min_count, length, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Non-printable characters in Study Protocol Description.
# description: Study Protocol Description should contain only printable characters.
# custom:
#  rule_id: rule_i_100_350_003_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_003_02 contains result if {
	def := data.metabolights.validation.v2.phase1.definitions 
	pattern := sprintf(`([\w!-~]+ )?[\w!-~]*[^%v]+[\w!-~]*( [\w!-~]+)?`, [def._ALLOWED_CHARS_PATTERN])
	# pattern := sprintf(`[^%v]`, [def._ALLOWED_CHARS_PATTERN])

	some study in input.investigation.studies
	some j, protocol in study.studyProtocols.protocols
	count(protocol.description) > 0
	matches = regex.find_n(pattern, protocol.description, -1)
	matches_set := {sprintf("[%v]", [x]) | some match in matches; x := regex.replace(match, `[\f\t\n\r]`, "<whitespace char>")}
	count(matches_set) > 0
	matches_set_str := concat(", ", matches_set)
	msg := sprintf("Non printable characters in protocol '%v'. Description of study %v: Phrases that contain non accepted characters: '%v'", [protocol.name, input.investigation.studies[i].identifier, matches_set_str])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Protocol Description contains only template message.
# description: Study Protocol Description should be updated. Do not use template message.
# custom:
#  rule_id: rule_i_100_350_003_03
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_003_03 contains result if {
	some i, j
	protocol := input.investigation.studies[i].studyProtocols.protocols[j]
	startswith(lower(protocol.description), "please update")
	msg := sprintf("Description of study protocol '%v' description starts with template message, protocol index: %v: value: '%v'", [protocol.name, j + 1, protocol.description])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Protocol Type length less than 3 characters.
# description: Study Protocol Type should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_i_100_350_004_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_004_01 contains result if {
	min_count := 3
	some study in input.investigation.studies
	some j, protocol in study.studyProtocols.protocols
	count(protocol.protocolType.term) < min_count
	msg := sprintf("Study protocol type term for '%v' is too short in the study %v. Min length: %v, Index: %v Current value: '%v'", [protocol.name, study.identifier, min_count, j + 1, protocol.protocolType.term])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# # METADATA
# # title: Study protocol parameters tag
# # description: Study protocol should contain parameters tag
# # custom:
# #  rule_id: rule_i_100_350_007_01_study_protocol_parameters
# #  type: ERROR
# #  priority: HIGH
# #  section: investigation.studyProtocols
# rule_i_100_350_STUDY_PROTOCOLS contains result if {
# 	some i, j
# 	not input.investigation.studies[i].studyProtocols.protocols[j].parameters
# 	msg := sprintf("Protocol '%v' does not contain parameters tag for study %v", [input.investigation.studies[i].studyProtocols.protocols[j].name, input.investigation.studies[i].identifier])
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

# METADATA
# title: Study protocol parameter is missing for a study protocol.
# description: All default study protocol parameters should be defined for study protocol.
# custom:
#  rule_id: rule_i_100_350_007_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyProtocols
rule_i_100_350_007_01 contains result if {
	protocolName := input.investigation.studies[i].studyProtocols.protocols[j].name
	def := data.metabolights.validation.v2.phase1.definitions 
	protocolParamaters := {x.term |
		some k
		x := input.investigation.studies[i].studyProtocols.protocols[j].parameters[k]
	}
	defaultParameters := def._DEFAULT_MERGED_STUDY_PROTOCOL_PARAMETERS[protocolName]
	missing := {x |
		some m
		not defaultParameters[m] in protocolParamaters
		x := defaultParameters[m]
	}
	count(missing) > 0

	missingStr := f.to_string(missing)
	protocolParamatersStr := f.to_string(protocolParamaters)
	defaultParametersStr := f.to_string(defaultParameters)
	msg := sprintf("Protocol '%v' does not contain '%v' parameter(s). Current parameter(s): '%v', expected parameter(s): '%v'", [protocolName, missingStr, protocolParamatersStr, defaultParametersStr])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Protocol Parameters Name length less than 3 characters.
# description: Study protocol parameters name should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_i_100_350_008_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_008_01 contains result if {
	min_count := 2
	some i, j, k
	term := input.investigation.studies[i].studyProtocols.protocols[j].parameters[k].term
	count(term) < min_count
	protocol := input.investigation.studies[i].studyProtocols.protocols[j]
	msg := sprintf("Study protocol '%v' parameter name is too short for the study %v. Min length: %v, protocol index: %v. Current value: '%v'", [protocol.name, input.investigation.studies[i].identifier, min_count, j + 1, term])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# # METADATA
# # title: Valid study protocol parameter term accession number
# # description: study protocol parameter term accession number should be set
# # custom:
# #  rule_id: rule_i_100_350_009_01_study_assays_measurementType_termAccessionNumber
# #  type: ERROR
# #  priority: HIGH
# #  section: investigation.studyProtocols
# rule_i_100_350_STUDY_PROTOCOLS contains result if {

# 	min_count := 0
# 	some i, j, k
# 	item := input.investigation.studies[i].studyProtocols.protocols[j].parameters[k].termAccessionNumber
# 	count(item) < min_count
# 	protocol := input.investigation.studies[i].studyProtocols.protocols[j]
# 	msg := sprintf("Study protocol '%v' parameter's termAccessionNumber is too short for the study %v. Min length: %v, protocol index: %v Current value: '%v'", [protocol.name, input.investigation.studies[i].identifier, min_count, j + 1, item])
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

# # METADATA
# # title: Valid study protocol parameter term source reference
# # description: study protocol parameter term source reference should be set
# # custom:
# #  rule_id: rule_i_100_350_009_01_study_assays_measurementType_termAccessionNumber
# #  type: ERROR
# #  priority: HIGH
# #  section: investigation.studyProtocols
# rule_i_100_350_STUDY_PROTOCOLS contains result if {
# 	min_count := 0
# 	some i, j, k
# 	item := input.investigation.studies[i].studyProtocols.protocols[j].parameters[k].termSourceRef
# 	count(item) < min_count
# 	protocol := input.investigation.studies[i].studyProtocols.protocols[j]
# 	msg := sprintf("Study protocol '%v' parameter's termSourceRef is too short for the study %v. Min length: %v, protocol index: %v Current value: '%v'", [protocol.name, input.investigation.studies[i].identifier, min_count, j + 1, item])
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

# # METADATA
# # title: No error message in study protocols section
# # description: No error message in study protocols section
# # custom:
# #  rule_id: rule_i_100_350_000_01
# #  type: SUCCESS
# #  priority: HIGH
# #  section: investigation.studyProtocols
# rule_i_100_350_000_01 contains result if {
# 	count(rule_i_100_350_001_01) == 0
# 	count(rule_i_100_350_001_02) == 0
# 	count(rule_i_100_350_002_01) == 0
# 	count(rule_i_100_350_003_01) == 0
# 	count(rule_i_100_350_003_02) == 0
# 	count(rule_i_100_350_004_01) == 0
# 	count(rule_i_100_350_007_01) == 0
# 	count(rule_i_100_350_008_01) == 0
# 	msg := ""
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: STUDY CONTACTS
#########################################################################################################
#########################################################################################################

# # METADATA
# # title: Valid study contacts tag
# # description: Study contacts should be defined.
# # custom:
# #  rule_id: rule_i_100_360_001_01_study_contacts
# #  type: ERROR
# #  priority: CRITICAL
# #  section: investigation.studyContacts
# rule_i_100_360_STUDY_CONTACTS contains result if {
# 	min_count = 1
# 	some i
# 	not input.investigation.studies[i].studyContacts.people
# 	msg := sprintf("At least %v protocol should be defined for study: %v", [min_count, input.investigation.studies[i].identifier])
# 	source := input.investigationFilePath
# 	result := f.format(rego.metadata.rule(), msg, source)
# }

# METADATA
# title: No study contacts referenced in investigation file.
# description: At least one study contacts should be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_360_001_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_001_01 contains result if {
	min_count = 1
	some i
	count(input.investigation.studies[i].studyContacts.people) < min_count
	msg := sprintf("At least %v study contact should be defined for study: %v", [min_count, input.investigation.studies[i].identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Person First Name length less than 2 characters.
# description: Study Person First Name should be defined with length equal or greater than 2 characters.
# custom:
#  rule_id: rule_i_100_360_002_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_002_01 contains result if {
	min_count = 2
	some i, j
	count(input.investigation.studies[i].studyContacts.people[j].firstName) < min_count
	msg := sprintf("Study contact's first name should be least %v characters for study: %v, contact index: %v", [min_count, input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Person Last Name length less than 2 characters.
# description: Study Person Last Name should be defined with length equal or greater than 2 characters.
# custom:
#  rule_id: rule_i_100_360_003_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_003_01 contains result if {
	min_count = 2
	some i, j
	count(input.investigation.studies[i].studyContacts.people[j].lastName) < min_count
	msg := sprintf("Study contact's last name should be least %v characters for study: %v, contact index: %v", [min_count, input.investigation.studies[i].identifier, j + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study contacts have no email address.
# description: At least one study contact must have an email address.
# custom:
#  rule_id: rule_i_100_360_004_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_004_01 contains result if {
	min_count = 1
	some i
	emails := { person.email | 
		some person in input.investigation.studies[i].studyContacts.people 
		count(person.email) > 0
		count(person.firstName) > 0
		count(person.lastName) > 0
	}
	count(emails) < min_count
	msg := sprintf("Study contacts have no email address. Study: %v", [input.investigation.studies[i].identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Person Email not valid.
# description: Study Person Email must be valid format.
# custom:
#  rule_id: rule_i_100_360_004_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_004_02 contains result if {
	some i, j
	pattern := `^[\w-\.]+@([\w-]+\.)+[\w-]+$`
	person := input.investigation.studies[i].studyContacts.people[j]
	count(person.email) > 0
	not regex.match(pattern, person.email)
	user_name := sprintf("%v %v", [person.firstName, person.lastName])
	msg := sprintf("Contact email address '%v' is not valid. Study: %v, contact at index %v, user: [%v]", [person.email, input.investigation.studies[i].identifier, j + 1, user_name])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# # METADATA
# # title: Valid study contact address
# # description: Study contact's address should be set.
# # custom:
# #  rule_id: rule_i_100_360_005_01_study_contacts_address
# #  type: ERROR
# #  priority: HIGH
# #  section: investigation.studyContacts
# rule_i_100_360_STUDY_CONTACTS contains result if {
# 	min_count = 2
# 	some i, j
#     person := input.investigation.studies[i].studyContacts.people[j]
# 	count(person.address) < min_count
# 	msg := sprintf("Study contact's address should be least %v characters for study: %v, contact index: %v, email: %v", [min_count, input.investigation.studies[i].identifier, j + 1, person.email])
# 	source := input.investigationFilePath
#	result := f.format(rego.metadata.rule(), msg, source)
# }

# METADATA
# title: Study Person affiliation length is less than 10 characters.
# description: Define full name of contact's primary affiliation. e.g. European Bioinformatics Institute
# custom:
#  rule_id: rule_i_100_360_006_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_006_01 contains result if {
	min_count = 10
	some idx, person in input.investigation.studies[0].studyContacts.people
	count(person.affiliation) > 0
	count(person.affiliation) < min_count
	msg := sprintf("Contact's affiliation should be least %v characters for study: %v, contact index: %v, affiliation: '%v'", [min_count, input.investigation.studies[0].identifier, idx + 1, person.affiliation])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Person Roles is empty.
# description: At least one role should be defined for a study contact.
# custom:
#  rule_id: rule_i_100_360_007_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_007_01 contains result if {
	min_count = 1
	some i, j
	person := input.investigation.studies[i].studyContacts.people[j]
	count(person.roles) < min_count
	msg := sprintf("At least %v role should be defined for study: %v, contact index: %v, email: %v", [min_count, input.investigation.studies[i].identifier, j + 1, person.email])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Person Roles length less than 2 characters.
# description: Study Person Roles should be defined with length equal or greater than 2 characters.
# custom:
#  rule_id: rule_i_100_360_008_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_008_01 contains result if {
	min_count = 2
	some i, j, k
	person := input.investigation.studies[i].studyContacts.people[j]
	count(person.roles[k].term) < min_count
	msg := sprintf("Study contact's role term should be least %v characters for study: %v, contact index: %v, role index: %v, contact name: '%v %v'", [min_count, input.investigation.studies[i].identifier, j + 1, k + 1, person.firstName, person.lastName])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Person Roles Term Accession Number is empty.
# description: Study Person Roles Term Accession Number should be defined.
# custom:
#  rule_id: rule_i_100_360_009_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_009_01 contains result if {
	min_count = 1
	some i, j, k
	person := input.investigation.studies[i].studyContacts.people[j]
	count(person.roles[k].termAccessionNumber) < min_count
	value := person.roles[k].termAccessionNumber
	msg := sprintf("Study person's (%v) role term accession number '%v' should be least %v characters for study: %v, contact index: %v, role index %v", [person.email, value, min_count, input.investigation.studies[i].identifier, j + 1, k + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# # METADATA
# # title: Valid study contact role source reference
# # description: Study contact role source reference should be set for a study contact
# # custom:
# #  rule_id: rule_i_100_360_010_01
# #  type: WARNING
# #  priority: HIGH
# #  section: investigation.studyContacts
# rule_i_100_360_STUDY_CONTACTS contains result if {
# 	min_count = 2
# 	some i, j, k
#     person := input.investigation.studies[i].studyContacts.people[j]
#     value := person.roles[k].termSourceRef
# 	count(value) < min_count
# 	msg := sprintf("Study contact's (%v) role term accession number '%v' should be least %v characters for study: %v, contact index: %v, role index %v", [person.email, value, min_count, input.investigation.studies[i].identifier, j + 1, k + 1])
# 	source := input.investigationFilePath
#	result := f.format(rego.metadata.rule(), msg, source)
# }

# METADATA
# title: Study Person Roles Term Source REF not referenced in investigation file.
# description: Study Person Roles Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_360_010_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_010_01 contains result if {
	some i, j
	def := data.metabolights.validation.v2.phase1.definitions 
	person := input.investigation.studies[i].studyContacts.people[j]
	count(person.roles[k].termSourceRef) > 0
	not person.roles[k].termSourceRef in def._ONTOLOGY_SOURCE_REFERENCE_NAMES
	msg := sprintf("Study person role source reference is not in ontology source reference list. Study: %v, index: '%v', current value '%v'", [input.investigation.studies[i].identifier, j + 1, input.investigation.studies[i].studyContacts.people[j].roles[k].termSourceRef])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Person Roles Term Source REF not in prioritised control list.
# description: A prioritised control list is defined. Review and select from the prioritised control list if possible.
# custom:
#  rule_id: rule_i_100_360_010_02
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studyContacts
rule_i_100_360_010_02 contains result if {
	some i, j
	def := data.metabolights.validation.v2.phase1.definitions 
	person := input.investigation.studies[i].studyContacts.people[j]
	count(person.roles[k].termSourceRef) > 0
	not person.roles[k].termSourceRef in def.CL_STUDY_CONTACT_ROLE_REF_SOURCES
	msg := sprintf("Study contact role source reference is not in the control list. Study: %v, contact index: %v, role index: %v, current value '%v', expected: [%v]", [input.investigation.studies[i].identifier, j + 1, k + 1, input.investigation.studies[i].studyContacts.people[j].roles[k].termSourceRef, def.CL_STUDY_CONTACT_ROLE_REF_SOURCES_STR])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Study Person Roles Term Source REF is empty.
# description: Study Person Roles Term Source REF should be defined.
# custom:
#  rule_id: rule_i_100_360_010_03
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_010_03 contains result if {
	some i, j
	person := input.investigation.studies[i].studyContacts.people[j]
	count(person.roles[k].termSourceRef) == 0
	msg := sprintf("Study contact role source reference is empty. Study: %v, contact index: %v, role index: %v", [input.investigation.studies[i].identifier, j + 1, k + 1])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: There is no study contact with Principal Investigator role.
# description: At least one study contact must have Principal Investigator role.
# custom:
#  rule_id: rule_i_100_360_011_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyContacts
rule_i_100_360_011_01 contains result if {
	some i
	pi := { person | 
		some person in input.investigation.studies[i].studyContacts.people
		some role in person.roles
		count(role.term) > 0
		lower(role.term) == "principal investigator"
	}
	count(pi) < 1
	msg := sprintf("There is no study contact with Principal Investigator role for study: %v", [input.investigation.studies[i].identifier])
	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Principal Investigator contact details not defined.
# description: Principal Investigator first name, last name, ORCID, affiliation, affiliation ROR id and email must be defined.
# custom:
#  rule_id: rule_i_100_360_011_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyContacts
rule_i_100_360_011_02 contains result if {
	some study in input.investigation.studies
	comments = study.studyContacts.comments
	pi_set := { idx: person | 
		some idx, person in study.studyContacts.people
		some role in person.roles
		count(role.term) > 0
		contains(lower(role.term), "principal investigator")
	}
	count(pi_set) > 0
	orcid_idx_set := { comment_idx | 
			some comment_idx, comment in comments
			comment.name == "Study Person ORCID"
	}
	affiliation_ror_id_idx_set := { ror_idx | 
			some ror_idx, comment in comments
			comment.name == "Study Person Affiliation ROR ID"
	}

	valid_pi_set := { idx: person | 
		some idx, person in pi_set
		orcid_set := [ orcid | 
			some orcid_idx in orcid_idx_set
			count(comments[orcid_idx].value) >= idx
			orcid := comments[orcid_idx].value[idx]
			count(orcid) > 0
		]
		affiliation_ror_id_set := { ror_id | 
			some ror_id_idx in affiliation_ror_id_idx_set
			count(comments[ror_id_idx].value) >= idx
			ror_id := comments[ror_id_idx].value[idx]
			count(ror_id) > 0
		}
		count(orcid_set) == count(orcid_idx_set)
		count(person.email) > 0
		count(person.firstName) > 0
		count(person.lastName) > 0
		count(person.affiliation) > 0
		count(affiliation_ror_id_set) == count(affiliation_ror_id_idx_set)
	}
	invalid_pi_set := { idx: person | 
		some idx, person in pi_set
		object.get(valid_pi_set, idx, null) == null
	}
	count(invalid_pi_set) > 0
	some idx, person in invalid_pi_set
	msg := sprintf("%v. contact [%v %v %v] has Principal Investigator role. This contact's first name, last name, ORCID, affiliation, affiliation ROR ID and email fields must be defined.", [idx + 1, person.email, person.firstName, person.lastName])

	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Study Person Affiliation ROR ID is not valid.
# description: Study Person ROR ID must have valid format. e.g., https //ror.org/02catss52 . If your affiliation ROR ID is not defined, you may provide wikidata URL of your primary affiliation. e.g., https //www.wikidata.org/wiki/Q1341845
# custom:
#  rule_id: rule_i_100_360_011_03
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_011_03 contains result if {
	some study in input.investigation.studies
	comments = study.studyContacts.comments

	affiliation_ror_id_idx_set := { ror_idx | 
		some ror_idx, comment in comments
		comment.name == "Study Person Affiliation ROR ID"
	}
	some idx, person in study.studyContacts.people
	pattern := `^(https://ror\.org/[0-9a-z]{9}|https://www\.wikidata\.org/wiki/Q[1-9][0-9]{0,19})$`

	invalid_affiliation_ror_id_set := { ror_id | 
		some ror_id_idx in affiliation_ror_id_idx_set
		count(comments[ror_id_idx].value) >= idx
		ror_id := comments[ror_id_idx].value[idx]
		count(ror_id) > 0
		not regex.match(pattern, ror_id)
	}
	count(invalid_affiliation_ror_id_set) > 0
	invalid_ror_ids := concat(", ", invalid_affiliation_ror_id_set)
	msg := sprintf("%v. contact [%v %v %v] has an invalid Affiliation ROR ID (or Wikidata ID): %v.", [idx + 1, person.email, person.firstName, person.lastName, invalid_ror_ids])

	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Person ORCID is not valid.
# description: Study Person ORCID must have valid format.
# custom:
#  rule_id: rule_i_100_360_011_04
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_011_04 contains result if {
	some study in input.investigation.studies
	comments = study.studyContacts.comments

	orcid_idx_set := { orcid_idx | 
		some orcid_idx, comment in comments
		comment.name == "Study Person ORCID"
	}
	some idx, person in study.studyContacts.people
	pattern := `^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{3}[X0-9]$`

	invalid_orcid_set := { orcid | 
		some orcid_idx in orcid_idx_set
		count(comments[orcid_idx].value) >= idx
		orcid := comments[orcid_idx].value[idx]
		count(orcid) > 0
		not regex.match(pattern, orcid)
	}
	count(invalid_orcid_set) > 0
	invalid_orcids := concat(", ", invalid_orcid_set)
	msg := sprintf("%v. contact [%v %v %v] has an invalid ORCID: %v.", [idx + 1, person.email, person.firstName, person.lastName, invalid_orcids])

	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Study Person Additional Email Address is not valid.
# description: Study Person Additional Email Address must have valid format.
# custom:
#  rule_id: rule_i_100_360_011_05
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_011_05 contains result if {
	some study in input.investigation.studies
	comments = study.studyContacts.comments

	alternative_email_idx_set := { alternative_email_idx | 
		some alternative_email_idx, comment in comments
		comment.name == "Study Person Alternative Email"
	}
	some idx, person in study.studyContacts.people
	pattern := `^[\w-\.]+@([\w-]+\.)+[\w-]+$`

	invalid_email_set := { email | 
		some alternative_email_idx in alternative_email_idx_set
		count(comments[alternative_email_idx].value) >= idx
		email := comments[alternative_email_idx].value[idx]
		count(email) > 0
		not regex.match(pattern, email)
	}
	count(invalid_email_set) > 0
	invalid_emails := concat(", ", invalid_email_set)
	msg := sprintf("%v. contact [%v %v %v] has an invalid Alternative Email: %v.", [idx + 1, person.email, person.firstName, person.lastName, invalid_emails])

	source := input.investigationFilePath
	result := f.format(rego.metadata.rule(), msg, source)
}