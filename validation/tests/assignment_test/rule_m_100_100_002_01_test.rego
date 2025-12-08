#########################################################################################################
# Unit tests for rule_m_100_100_002_01
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Sample Name columns not in metabolite assignment file.
# description: Sample Name columns must exist in metabolite assignment file.
# custom:
#  rule_id: rule_m_100_100_002_01
#  type: WARNING
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_002_01_test_cases := 1

# METADATA
# title: Sample Name columns are in metabolite assignment file
# description: Sample Name columns are in metabolite assignment file
test_rule_m_100_100_002_01_no_violation_01 if {
	result := rules.rule_m_100_100_002_01 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
					"Sample5",
				],
				"table": {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "Sample2", "Sample3", "Sample5"],
						"MS Assay Name": ["", "", "", ""],
					},
				},
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample4",
					"Sample5",
				],
				"table": {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "Sample2", "Sample4", "Sample5"],
						"MS Assay Name": ["", "", "", ""],
					},
				},
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {
			"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"},
			"table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
					{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
					{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample1", "columnIndex": 6},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample2", "columnIndex": 7},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample3", "columnIndex": 7},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample4", "columnIndex": 7},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample5", "columnIndex": 8},
				],
			},
		}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 4},
			],
		}]}
	count(result) == 0
}

# METADATA
# title: Sample Name columns are missing in metabolite assignment file
# description: Sample Name columns are missing in metabolite assignment file
test_rule_m_100_100_002_01_violation_01 if {
	result := rules.rule_m_100_100_002_01 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
					"Sample5",
				],
				"table": {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "Sample2", "Sample3", "Sample5"],
						"MS Assay Name": ["", "", "", ""],
					},
				},
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample4",
					"Sample5",
				],
				"table": {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "Sample2", "Sample4", "Sample5"],
						"MS Assay Name": ["", "", "", ""],
					},
				},
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {
			"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"},
			"table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
					{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
					{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample1", "columnIndex": 6},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample4", "columnIndex": 7},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample5", "columnIndex": 8},
				],
			},
		}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 4},
			],
		}]}
	count(result) == 1
}

# METADATA
# title: Sample Name columns are missing in metabolite assignment file
# description: Sample Name columns are missing in metabolite assignment file
test_rule_m_100_100_002_01_violation_02 if {
	result := rules.rule_m_100_100_002_01 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": ["Sample1"],
				"table": {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "", "", ""],
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 3", "MS Assay Name 4"],
					},
				},
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
				],
				"table": {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "Sample2", "", ""],
						"MS Assay Name": ["", "", "", ""],
					},
				},
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {
			"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"},
			"table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
					{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
					{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample1", "columnIndex": 6},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 1", "columnIndex": 7},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 2", "columnIndex": 8},
				],
			},
		}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 4},
			],
		}]}
	count(result) == 1
}

# METADATA
# title: No sample name column in maf file.
# description: No sample name column in maf file.
test_rule_m_100_100_002_01_violation_03 if {
	result := rules.rule_m_100_100_002_01 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"MS Assay Name 2",
					"MS Assay Name 4",
					"MS Assay Name 5",
				],
				"table": {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 4", "MS Assay Name 5"],
						"Sample Name": ["Sample1", "", "", ""],
					},
				},
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 3",
					"MS Assay Name 5",
				],
				"table": {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 3", "MS Assay Name 5"],
						"Sample Name": ["", "", "", ""],
					},
				},
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {
			"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"},
			"table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
					{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
					{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 2", "columnIndex": 7},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 5", "columnIndex": 8},
				],
			},
		}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 4},
			],
		}]}
	count(result) == 0
}
