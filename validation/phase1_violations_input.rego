package metabolights.validation.v2.phase1.violations

import data.metabolights.validation.v2.functions as f
import rego.v1

#########################################################################################################
#########################################################################################################
# INPUT DATA VALIDATIONS
#########################################################################################################
#########################################################################################################

# METADATA
# title: There is no input data.
# description: There is no input.
# custom:
#  rule_id: rule___100_100_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: input
rule___100_100_001_01 contains result if {
	not input
	
	result := f.format(rego.metadata.rule(), "Input is not defined.", "input")
}

# METADATA
# title: Input data format is not valid.
# description: Input data must have valid schema.
# custom:
#  rule_id: rule___100_100_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: input
rule___100_100_001_02 contains result if {
	[_, errors] := json.match_schema(input, data.schemas)
	count(errors) > 0
	result := f.format_schema_error(rego.metadata.rule(), errors)
}

# METADATA
# title: There is a critical file parse error for i_Investigation.txt.
# description: Update i_Investigation.txt file considering error messages.
# custom:
#  rule_id: rule___100_100_100_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.parserMessages
rule___100_100_100_01 contains result if {
	some j
	file_name := input.investigationFilePath
	message := input.parserMessages[file_name][j]
	message.type == "CRITICAL"
	desc := sprintf("'%v':'%v' line: %v, column: %v", [message.short, message.detail, message.line, message.column])
	msg := regex.replace(desc, `\s`, " ")
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: There is a file parse error for i_Investigation.txt.
# description: Update i_Investigation.txt file considering error messages.
# custom:
#  rule_id: rule___100_100_100_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.parserMessages
rule___100_100_100_02 contains result if {
	file_name := input.investigationFilePath

	message := input.parserMessages[file_name][j]
	message.type == "ERROR"
	desc := sprintf("'%v':'%v' line: %v, column: %v", [message.short, message.detail, message.line, message.column])
	msg := regex.replace(desc, `\s`, " ")
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: There is a file parse warning for i_Investigation.txt.
# description: Update i_Investigation.txt file considering warning messages.
# custom:
#  rule_id: rule___100_100_100_03
#  type: WARNING
#  priority: HIGH
#  section: investigation.parserMessages
rule___100_100_100_03 contains result if {
	file_name := input.investigationFilePath
	message := input.parserMessages[file_name][j]
	message.type == "WARNING"
	desc := sprintf("%v - '%v':'%v' line: %v, column: %v", [input.investigationFilePath, message.short, message.detail, message.line, message.column])

	msg := regex.replace(desc, `\s`, " ")

	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Investigation file name is not i_Investigation.txt
# description: Update investigation name as i_Investigation.txt
# custom:
#  rule_id: rule___100_100_100_04
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.general
rule___100_100_100_04 contains result if {
	configuration := data.metabolights.validation.v2.configuration
	input.investigationFilePath != configuration.investigationFileName
	msg := sprintf("Investigation file name should be '%v' found: '%v'", [configuration.investigationFileName, input.investigationFilePath])
	result := f.format(rego.metadata.rule(), msg, input.investigationFilePath)
}

# METADATA
# title: There is no parser information for i_Investigation.txt.
# description: Define i_Investigation.txt in parserMessages.
# custom:
#  rule_id: rule___100_100_100_05
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.parserMessages
rule___100_100_100_05 contains result if {
	template_file_name := data.metabolights.validation.v2.configuration.investigationFileName
	input.parserMessages
	not input.parserMessages[template_file_name]

	msg := sprintf("There is no parser information for '%v' in input data", [template_file_name])

	result := f.format(rego.metadata.rule(), msg, "input")
}

# METADATA
# title: Unreferenced investigation files.
# description: Delete multiple investigation file within study folder.
# custom:
#  rule_id: rule___100_100_100_06
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.general
rule___100_100_100_06 contains result if {
	referenced_files := { input.investigationFilePath }

	all_files := { file |
		some file, _ in input.studyFolderMetadata.files
		startswith(file, "i_")
	}
	extra_files = all_files - referenced_files
	count(extra_files) > 0
	some file_name in extra_files

	msg := sprintf("Unreferenced investigation file '%v'", [file_name])
	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: There is a critical file parse error for the sample file.
# description: There is a critical file parse error for the sample file.
# custom:
#  rule_id: rule___100_200_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.parserMessages
rule___100_200_001_01 contains result if {
	input.samples[fileName]
	values := {x |
		some j
		msg := input.parserMessages[fileName][j]
		msg.type == "CRITICAL"
		x := sprintf("[%v - '%v':'%v' line: %v, column: %v]", [msg.type, msg.short, msg.detail, msg.line, msg.column])
	}
	sourceFile := fileName
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}

# METADATA
# title: There is a file parse error for the sample file.
# description: There is a file parse error for the sample file.
# custom:
#  rule_id: rule___100_200_001_02
#  type: ERROR
#  priority: HIGH
#  section: samples.parserMessages
rule___100_200_001_02 contains result if {
	input.samples[fileName]
	values := {x |
		some j
		msg := input.parserMessages[fileName][j]
		msg.type == "ERROR"
		x := sprintf("[%v - '%v':'%v' line: %v, column: %v]", [msg.type, msg.short, msg.detail, msg.line, msg.column])
	}
	sourceFile := fileName
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}

# METADATA
# title: There is a file parse warning for the sample file.
# description: There is a file parse warning for the sample file.
# custom:
#  rule_id: rule___100_200_001_03
#  type: WARNING
#  priority: MEDIUM
#  section: samples.parserMessages
rule___100_200_001_03 contains result if {
	input.samples[fileName]
	values := {x |
		some j
		msg := input.parserMessages[fileName][j]
		msg.type == "WARNING"
		x := sprintf("[%v - '%v':'%v' line: %v, column: %v]", [msg.type, msg.short, msg.detail, msg.line, msg.column])
	}
	sourceFile := fileName
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}

# METADATA
# title: There is no parser information for sample file.
# description: Define sample file in parserMessages.
# custom:
#  rule_id: rule___100_200_001_04
#  type: ERROR
#  priority: HIGH
#  section: samples.parserMessages
rule___100_200_001_04 contains result if {
	some file_name, _ in input.samples
	not input.parserMessages[file_name]
	msg := sprintf("There is no parser information for '%v' in input data", [file_name])

	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: There is no sample file for the study.
# description: Define a sample file for the study.
# custom:
#  rule_id: rule___100_200_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: samples.parserMessages
rule___100_200_001_05 contains result if {
	count(input.samples) == 0

	# count(input.investigation.studies[i].fileName) > 0
	count(input.investigation.studies) == 1
	msg := sprintf("There is no sample file in input data. Expected '%v'", [input.investigation.studies[0].fileName])
	result := f.format(rego.metadata.rule(), msg, "input")
}

# METADATA
# title: There are multiple sample files.
# description: Define only one sample file for the study.
# custom:
#  rule_id: rule___100_200_001_06
#  type: ERROR
#  priority: CRITICAL
#  section: samples.general
rule___100_200_001_06 contains result if {
	count(input.samples) > 1
	count(input.investigation.studies) == 1

	# study := input.investigation.studies[0]
	# count(study.fileName) > 0
	msg := "There are multiple sample files in input data."
	result := f.format(rego.metadata.rule(), msg, "input")
}


# METADATA
# title: Sample file name pattern is not correct.
# description: Sample file name must start with 's_', contain study identifier and have extension '.txt'.
# custom:
#  rule_id: rule___100_200_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: samples.general
rule___100_200_001_08 contains result if {
	pattern := `^s_(MTBLS|REQ)\d{1,20}\.txt$`
	some file_name, _ in input.samples
	not regex.match(pattern, file_name)
	msg := sprintf("Invalid sample file name '%v'. Sample file should start s_ and follow study acession number / submission id (s_<<MTBLSxxx/REQxxx>>.txt).", [file_name])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Sample file is not referenced in i_Investigation.txt file.
# description: Update i_Investigation.txt file to reference the sample file or delete it.
# custom:
#  rule_id: rule___100_200_001_09
#  type: ERROR
#  priority: CRITICAL
#  section: samples.general
rule___100_200_001_09 contains result if {
	referenced_files := { x |
		some _, study in input.investigation.studies
		x := study.fileName
	}

	all_files := { file |
		some file, _ in input.samples
		startswith(file, "s_")
	}
	extra_files = all_files - referenced_files
	count(extra_files) > 0
	some file_name in extra_files

	msg := sprintf("Unreferenced sample file '%v'", [file_name])
	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: There is a critical file parse error for the assay file.
# description: There is a critical file parse error for the assay file.
# custom:
#  rule_id: rule___100_300_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_01 contains result if {
	some file_name, _ in input.assays
	values := {x |
		some j
		msg := input.parserMessages[file_name][j]
		msg.type == "CRITICAL"
		x := sprintf("[%v - '%v':'%v' line: %v, column: %v]", [msg.type, msg.short, msg.detail, msg.line, msg.column])
	}
	sourceFile := file_name
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}

# METADATA
# title: There is a file parse error for the assay file.
# description: There is a file parse error for the assay file.
# custom:
#  rule_id: rule___100_300_001_02
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule___100_300_001_02 contains result if {
	input.assays[fileName]
	values := {x |
		some j
		msg := input.parserMessages[fileName][j]
		msg.type == "ERROR"
		x := sprintf("[%v - '%v':'%v' line: %v, column: %v]", [msg.type, msg.short, msg.detail, msg.line, msg.column])
	}
	sourceFile := fileName
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}

# METADATA
# title: There is a file parse warning for the assay file.
# description: There is a file parse warning for the assay file.
# custom:
#  rule_id: rule___100_300_001_03
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule___100_300_001_03 contains result if {
	input.assays[fileName]
	values := {x |
		some j
		msg := input.parserMessages[fileName][j]
		msg.type == "WARNING"
		x := sprintf("[%v - '%v':'%v' line: %v, column: %v]", [msg.type, msg.short, msg.detail, msg.line, msg.column])
	}
	sourceFile := fileName
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}

# METADATA
# title: There is no parser information for assay file.
# description: Define assay file in parserMessages.
# custom:
#  rule_id: rule___100_300_001_04
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule___100_300_001_04 contains result if {
	some file_name, _ in input.assays
	not input.parserMessages[file_name]
	msg := sprintf("There is no parser information for '%v' in input data", [file_name])

	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: There is no assay file for the study.
# description: Define an assay file for the study.
# custom:
#  rule_id: rule___100_300_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_05 contains result if {
	count(input.assays) == 0
	msg := "There is no assay file for study in input data."
	result := f.format(rego.metadata.rule(), msg, "input")
}

# METADATA
# title: Technology type not defined for assay file.
# description: Assay file technology type must be defined to execute validation rules.
# custom:
#  rule_id: rule___100_300_001_06
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_06 contains result if {
	some file_name, _ in input.assays
	not data.metabolights.validation.v2.phase1.definitions.__ASSAY_TECHNIQUES[file_name]

	msg := sprintf("Assay file technology type is not determined for '%v'", [file_name])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Technology type not supported for assay file.
# description: Assay file technology type not supported.
# custom:
#  rule_id: rule___100_300_001_07
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_07 contains result if {
	some file_name, _ in input.assays

	assay_type := data.metabolights.validation.v2.phase1.definitions.__ASSAY_TECHNIQUES[file_name]
	supported_assay_types := {x | some x, _ in data.metabolights.validation.v2.templates.assayFileHeaderTemplates}
	not assay_type in supported_assay_types

	msg := sprintf("Assay file technology type is not supported for '%v'", [file_name])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Assay file name not correct pattern.
# description: Assay file name must start with 'a_' and have extension '.txt'.
# custom:
#  rule_id: rule___100_300_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_08 contains result if {
	pattern := `^a_.+\.txt$`
	count(input.assays) > 0
	some file_name, _ in input.assays
	not regex.match(pattern, file_name)
	msg := sprintf("Invalid assay file name '%v'.", [file_name])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}


# METADATA
# title: Assay file is not referenced in i_Investigation.txt file.
# description: Update i_Investigation.txt file to reference the assay file or delete it.
# custom:
#  rule_id: rule___100_300_001_09
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_09 contains result if {
	referenced_files := { x |
		some _, study in input.investigation.studies
		some _, assay in study.studyAssays.assays
		x := assay.fileName
	}
	all_files := { file |
		some file, _ in input.assays
		startswith(file, "a_")
	}
	extra_files = all_files - referenced_files
	count(extra_files) > 0
	some file_name in extra_files

	msg := sprintf("Unreferenced assay file '%v'", [file_name])
	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: Assay file name contains invalid characters.
# description: Use only .-_A-Za-z0-9 characters for an assay file name. e.g. a_REQ2025010211233_LC-MS_negative_reverse-phase_metabolite_profiling.txt
# custom:
#  rule_id: rule___100_300_001_10
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_10 contains result if {
	some file, assay in input.assays

	count(file) > 0
	matches = regex.find_n("[^A-Za-z0-9/._-]", file, -1)
	matches_set := {x | x := matches[_]}
	matches_str := concat(" ", matches_set)
	not matches_str == ""
	msg := sprintf("Assay file name ('%v') contains invalid characters. Do not use special characters: %v", [file, matches_str])
	source := file
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: There is a critical file parse error for the metabolite assignment file.
# description: There is a critical file parse error for the metabolite assignment file.
# custom:
#  rule_id: rule___100_400_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.parserMessages
rule___100_400_001_01 contains result if {
	input.metaboliteAssignments[fileName]
	values := {x |
		some j
		msg := input.parserMessages[fileName][j]
		msg.type == "CRITICAL"
		x := sprintf("[%v - '%v':'%v' line: %v, column: %v]", [msg.type, msg.short, msg.detail, msg.line, msg.column])
	}
	sourceFile := fileName
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}

# METADATA
# title: There is a file parse error for the metabolite assignment file.
# description: There is a file parse error for the metabolite assignment file.
# custom:
#  rule_id: rule___100_400_001_02
#  type: ERROR
#  priority: HIGH
#  section: metabolites.parserMessages
rule___100_400_001_02 contains result if {
	input.metaboliteAssignments[fileName]
	values := {x |
		some j
		msg := input.parserMessages[fileName][j]
		msg.type == "ERROR"
		x := sprintf("[%v - '%v':'%v' line: %v, column: %v]", [msg.type, msg.short, msg.detail, msg.line, msg.column])
	}
	sourceFile := fileName
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}

# METADATA
# title: There is a file parse warning for the metabolite assignment file.
# description: There is a file parse warning for the metabolite assignment file.
# custom:
#  rule_id: rule___100_400_001_03
#  type: WARNING
#  priority: MEDIUM
#  section: metabolites.parserMessages
rule___100_400_001_03 contains result if {
	input.metaboliteAssignments[fileName]
	values := {x |
		some j
		msg := input.parserMessages[fileName][j]
		msg.type == "WARNING"
		x := sprintf("[%v - '%v':'%v' line: %v, column: %v]", [msg.type, msg.short, msg.detail, msg.line, msg.column])
	}
	sourceFile := fileName
	result := f.format_with_file_and_values(rego.metadata.rule(), sourceFile, values)
}

# METADATA
# title: There is no parser information for metabolite assignment file.
# description: Define metabolite assignment file in parserMessages.
# custom:
#  rule_id: rule___100_400_001_04
#  type: ERROR
#  priority: HIGH
#  section: metabolites.parserMessages
rule___100_400_001_04 contains result if {
	some file_name, _ in input.metaboliteAssignments
	not input.parserMessages[file_name]
	msg := sprintf("There is no parser information for '%v' in input data", [file_name])

	result := f.format(rego.metadata.rule(), msg, file_name)
}


# METADATA
# title: Technology type not defined for metabolite assignment file.
# description: Assignment file technology type must be defined to execute file type validation rules.
# custom:
#  rule_id: rule___100_400_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule___100_400_001_05 contains result if {
	some file_name, assignment in input.metaboliteAssignments
	count(input.metaboliteAssignments[file_name].assayTechnique.name) == 0
	msg := sprintf("Assignment file technology type is not determined for '%v'", [file_name])

	sourceFile := file_name
	result := f.format(rego.metadata.rule(), msg, sourceFile)
}

# METADATA
# title: Metabolite assignment file is not referenced in assay file(s).
# description: Update assay files to reference the metabolite assignment or delete it.
# custom:
#  rule_id: rule___100_400_001_06
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule___100_400_001_06 contains result if {
	all_files := { x |
		some x, _ in input.metaboliteAssignments
	}
	referenced_files := { file |
		some _, assay in input.assays
		some _, file in assay.referencedAssignmentFiles
	}
	extra_files = all_files - referenced_files
	count(extra_files) > 0
	some file_name in extra_files

	msg := sprintf("Unreferenced metabolite assignment file '%v'", [file_name])
	result := f.format(rego.metadata.rule(), msg, file_name)
}


# METADATA
# title: Metabolite assignment file name not correct pattern.
# description: Metabolite assignment file name must start with 'm_' and have extension '.tsv'.
# custom:
#  rule_id: rule___100_400_001_07
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule___100_400_001_07 contains result if {
	pattern := `^m_(.+)\.tsv$`
	some file_name, _ in input.metaboliteAssignments
	not regex.match(pattern, file_name)
	msg := sprintf("Invalid metabolite assignment file name '%v'. It should start with m_ and have '.tsv' extension.", [file_name])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Metabolite assignment file name contains invalid characters.
# description: Use only .-_A-Za-z0-9 characters for an metabolite assignment file name. e.g. m_REQ2025010211233_LC-MS_negative_reverse-phase_metabolite_profiling_v2_maf.tsv
# custom:
#  rule_id: rule___100_400_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule___100_400_001_08 contains result if {
	some file, maf in input.metaboliteAssignments

	count(file) > 0
	matches = regex.find_n("[^A-Za-z0-9/._-]", file, -1)
	matches_set := {x | x := matches[_]}
	matches_str := concat(" ", matches_set)
	not matches_str == ""
	msg := sprintf("Metabolite assignment file name ('%v') contains invalid characters. Do not use special characters: %v. ", [file, matches_str])
	source := file
	result := f.format(rego.metadata.rule(), msg, source)
}

