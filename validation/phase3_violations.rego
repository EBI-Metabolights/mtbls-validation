# METADATA
# scope: subpackages
# schemas:
#   - input: schema["study-model-schema"]
package metabolights.validation.v2.phase3.violations

import data.metabolights.validation.v2.functions as f
import rego.v1

# #########################################################################################################
# #########################################################################################################
# # METABOLITE ASSIGNMENT GENERAL VALIDATION RULES
# #########################################################################################################
# #########################################################################################################

# METADATA
# title: Values with trailing or leading spaces in metabolite assignment file.
# description: Values in metabolite assignment file should not start or end with space characters.
# custom:
#  rule_id: rule_m_300_090_001_01
#  type: ERROR
#  priority: HIGH
#  section: metabolites.general
rule_m_300_090_001_01 contains result if {
	some file_name, sheet in input.metaboliteAssignments
	some column_index, column_name in sheet.table.columns
	some _, header in sheet.table.headers
	header.columnIndex == column_index

	violated_values := [sprintf("[row: %03v, value:'%v']", [x, y]) |
		some j, value in sheet.table.data[column_name]
		count(value) > 0
		count(value) != count(trim_space(value))
		x := (sheet.table.rowOffset + j) + 1
		y := value
	]

	# source := file_name; fileColumnHeader := columnHeader; fileColumnIndex := column_index + 1
	result := f.format_with_values(rego.metadata.rule(), file_name, column_index + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Values for required columns not in metabolite assignment file.
# description: All required column values should be defined in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_090_005_01
#  type: ERROR
#  priority: HIGH
#  section: metabolites.general
rule_m_300_090_005_01 contains result if {
	some file_name, sheet in input.metaboliteAssignments

	template_type := input.metaboliteAssignments[file_name].assayTechnique.mainTechnique
	some header_index, header in sheet.table.headers
	row_offset := sheet.table.rowOffset
	template_list := data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates[template_type]
	some template in template_list
	template.version == "v1.0"
	some template_header in template.headers
	template_header.required == true
		

	header.columnHeader == template_header.columnHeader
	column_name := sheet.table.columns[header.columnIndex]
	violated_values := f.empty_value_check(input.metaboliteAssignments, file_name, column_name, row_offset)
	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Values do not meet minimum length requirement.
# description: Each row must have a value equal or greater than the minimum length.
# custom:
#  rule_id: rule_m_300_090_005_02
#  type: ERROR
#  priority: HIGH
#  section: metabolites.general
rule_m_300_090_005_02 contains result if {
	some file_name, sheet in input.metaboliteAssignments
	some header_index, header in sheet.table.headers
	row_offset := sheet.table.rowOffset
	template_type := sheet.assayTechnique.mainTechnique
	template_list := data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates[template_type]

	some template in template_list
	template.version == "v1.0"
	some template_header in template.headers
	template_header.minLength > 0

	header.columnHeader == template_header.columnHeader
	column_name := sheet.table.columns[header.columnIndex]
	violated_values := f.min_length_check(input.metaboliteAssignments, file_name, column_name, template_header.minLength, row_offset)
	result := f.format_with_desc(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values, "Required minimum value length for this column", template_header.minLength)
}

# METADATA
# title: Values do not meet maximum length requirement.
# description: Each row must have a value equal or less than the maximum length.
# custom:
#  rule_id: rule_m_300_090_005_03
#  type: ERROR
#  priority: HIGH
#  section: metabolites.general
rule_m_300_090_005_03 contains result if {
	some file_name, sheet in input.metaboliteAssignments
	some header_index, header in sheet.table.headers
	row_offset := sheet.table.rowOffset
	template_type := sheet.assayTechnique.mainTechnique
	template_list := data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates[template_type]

	some template in template_list
	template.version == "v1.0"
	some template_header in template.headers
	template_header.maxLength > 0

	header.columnHeader == template_header.columnHeader
	column_name := sheet.table.columns[header.columnIndex]
	violated_values := f.max_length_check(input.metaboliteAssignments, file_name, column_name, template_header.maxLength, row_offset)
	result := f.format_with_desc(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values, "Maximum value length for this column", template_header.maxLength)
}

# METADATA
# title: mass_to_charge column has empty values in metabolite assignment file.
# description: All 'mass_to_charge' column values must be defined in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_100_001_01
#  type: ERROR
#  priority: HIGH
#  section: metabolites.lcms
rule_m_300_100_001_01 contains result if {
	some file_name, sheet in input.metaboliteAssignments
	some header_index, header in sheet.table.headers

	sheet.assayTechnique.mainTechnique == "MS"
	header.columnHeader == "mass_to_charge"
	values := {sprintf("Row %v", [j]) |
		some row, value in sheet.table.data[header.columnName]
		count(trim_space(value)) == 0
		j := sheet.table.rowOffset + row + 1

	}
	count(values) > 0

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, values)
}

# METADATA
# title: retention_time column has empty values in metabolite assignment file.
# description: All 'retention_time' column values must be defined in metabolite assignment file for LC-MS / GC-MS.
# custom:
#  rule_id: rule_m_300_100_001_02
#  type: ERROR
#  priority: HIGH
#  section: metabolites.lcms
rule_m_300_100_001_02 contains result if {
	some file_name, sheet in input.metaboliteAssignments
	some header_index, header in sheet.table.headers

	sheet.assayTechnique.mainTechnique == "MS"
	header.columnHeader == "retention_time"
	assays := {assay | 
		some assay_name, assay in input.assays
		assay.assayTechnique.name in {"LC-MS", "GC-MS"}
		file_name in assay.referencedAssignmentFiles
	}
	count(assays) > 0

	values := {sprintf("Row %v", [j]) |
		some row, value in sheet.table.data[header.columnName]
		count(trim_space(value)) == 0
		j := sheet.table.rowOffset + row + 1
	}
	count(values) > 0

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, values)
}

# METADATA
# title: retention_time column values not numeric in metabolite assignment file.
# description: All 'retention_time' column values should be numeric.
# custom:
#  rule_id: rule_m_300_100_001_03
#  type: WARNING
#  priority: HIGH
#  section: metabolites.lcms
rule_m_300_100_001_03 contains result if {
	pattern := `^[0-9]*(\.[0-9]+)?(\|[0-9]*(\.[0-9]+)?)*$`

	some file_name, sheet in input.metaboliteAssignments
	some header_index, header in sheet.table.headers

	sheet.assayTechnique.mainTechnique == "MS"
	header.columnHeader == "retention_time"
	values := {sprintf("Row: %v value: '%v'", [j, value]) |
		some row, value in sheet.table.data[header.columnName]
		not regex.match(pattern, value)
		j := sheet.table.rowOffset + row + 1
	}
	count(values) > 0

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, values)
}

# METADATA
# title: chemical_shift column has empty values in metabolite assignment file.
# description: All 'chemical_shift' column values should be defined in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_200_001_01
#  type: WARNING
#  priority: CRITICAL
#  section: metabolites.nmr
rule_m_300_200_001_01 contains result if {
	some file_name, sheet in input.metaboliteAssignments
	some header_index, header in sheet.table.headers

	sheet.assayTechnique.mainTechnique == "NMR"
	header.columnHeader == "chemical_shift"
	values := {sprintf("Row: %v", [j]) |
		some row, value in sheet.table.data[header.columnName]
		count(trim_space(value)) == 0
		j := sheet.table.rowOffset + row + 1
	}
	count(values) > 0

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, values)
}

# METADATA
# title: chemical_shift column values not numeric in metabolite assignment file.
# description: All 'chemical_shift' column values should be numeric in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_200_001_02
#  type: WARNING
#  priority: HIGH
#  section: metabolites.nmr
rule_m_300_200_001_02 contains result if {
	pattern := `^[0-9]*(\.[0-9]+)?(\|[0-9]*(\.[0-9]+)?)*$`

	some file_name, sheet in input.metaboliteAssignments
	some header_index, header in sheet.table.headers

	sheet.assayTechnique.mainTechnique == "NMR"
	header.columnHeader == "chemical_shift"
	values := {sprintf("Row: %v value: '%v'", [j, value]) |
		some row, value in sheet.table.data[header.columnName]
		not regex.match(pattern, value)
		j := sheet.table.rowOffset + row + 1
	}
	count(values) > 0

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, values)
}

# METADATA
# title: multiplicity column has empty values in metabolite assignment file.
# description: All 'multiplicity' column values should be defined in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_200_001_03
#  type: WARNING
#  priority: CRITICAL
#  section: metabolites.nmr
rule_m_300_200_001_03 contains result if {
	some file_name, sheet in input.metaboliteAssignments
	some header_index, header in sheet.table.headers

	sheet.assayTechnique.mainTechnique == "NMR"
	header.columnHeader == "multiplicity"

	values := {sprintf("Row: %v", [j]) |
		some row, value in sheet.table.data[header.columnName]
		count(trim_space(value)) == 0
		j := sheet.table.rowOffset + row + 1
	}
	count(values) > 0

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, values)
}
