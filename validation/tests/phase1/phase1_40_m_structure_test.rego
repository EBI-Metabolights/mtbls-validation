package metabolights.validation.v2.rules.phase1.tests

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

#########################################################################################################
# rule_m_100_100_001_01
#########################################################################################################

# METADATA
# title: all default columns are in metabolite assignment file
# description: all default columns are in metabolite assignment file
test_rule_m_100_100_001_01_no_violation_01 if {
	result := rules.rule_m_100_100_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 0},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 0},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 4},
			],
		}]}
	count(result) == 0
}

# METADATA
# title: Some default columns are missing in metabolite assignment file
# description: Some default columns are missing in metabolite assignment file
test_rule_m_100_100_001_01_violation_01 if {
	result := rules.rule_m_100_100_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 0},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 3},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 0},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 4},
			],
		}]}

	count(result) == 1
}

#########################################################################################################
# rule_m_100_100_001_02
#########################################################################################################

# METADATA
# title: Columns are ordered in the metabolite assignment file.
# description: Columns are ordered in the metabolite assignment file.
test_rule_m_100_100_001_02_no_violation_01 if {
	result := rules.rule_m_100_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 5},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 5},
			],
		}]}
	count(result) == 0
}

# METADATA
# title: Unordered columns in the metabolite assignment file.
# description: Unordered columns in the metabolite assignment file.
test_rule_m_100_100_001_02_violation_01 if {
	result := rules.rule_m_100_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
				],
			}},
			"m_MTBLS2.txt": {"table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 3},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 5},
				],
			}},
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 5},
			],
		}]}
	count(result) == 1
}

#########################################################################################################
# rule_m_100_100_001_03
#########################################################################################################

# METADATA
# title: Metabolite assignment file has no empty column headers.
# description: Metabolite assignment file has empty column headers.
test_rule_m_100_100_001_03_no_violation_01 if {
	result := rules.rule_m_100_100_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 5},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 5},
			],
		}]}
	count(result) == 0
}

# METADATA
# title: Metabolite assignment file has no empty column headers.
# description: Metabolite assignment file has empty column headers.
test_rule_m_100_100_001_03_violation_01 if {
	result := rules.rule_m_100_100_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
				],
			}},
			"m_MTBLS2.txt": {"table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": " ", "defaultColumnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 3},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "", "defaultColumnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 5},
				],
			}},
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 5},
			],
		}]}
	count(result) == 1
}



#########################################################################################################
# rule_m_100_100_001_04
#########################################################################################################

# METADATA
# title: Metabolite assignment file has no empty column headers.
# description: Metabolite assignment file has empty column headers.
test_rule_m_100_100_001_04_no_violation_01 if {
	result := rules.rule_m_100_100_001_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 5},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 5},
			],
		}]}
	count(result) == 0
}

# METADATA
# title: Metabolite assignment file has no empty column headers.
# description: Metabolite assignment file has empty column headers.
test_rule_m_100_100_001_04_violation_01 if {
	result := rules.rule_m_100_100_001_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 3},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 5},
				],
			}},
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 5},
			],
		}]}
	count(result) == 1
}

#########################################################################################################
# rule_m_100_100_002_01
#########################################################################################################

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
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "Sample2", "Sample3", "Sample5"],
						"MS Assay Name": ["", "", "", ""],
					}
				}
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample4",
					"Sample5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "Sample2", "Sample4", "Sample5"],
						"MS Assay Name": ["", "", "", ""],
					}
				}
			}
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {
				"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, 
				"table": { "rowOffset": 0, "totalRowCount": 0,
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
					]
				}
			}
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "Sample2", "Sample3", "Sample5"],
						"MS Assay Name": ["", "", "", ""],
					}
				}
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample4",
					"Sample5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "Sample2", "Sample4", "Sample5"],
						"MS Assay Name": ["", "", "", ""],
					}
				}
			}
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {
				"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, 
				"table": { "rowOffset": 0, "totalRowCount": 0,
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample1", "columnIndex": 6},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample4", "columnIndex": 7},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample5", "columnIndex": 8},
					]
				}
			}
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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
				"sampleNames": [
					"Sample1"
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "", "", ""],
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 3", "MS Assay Name 4"],
					}
				}
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"Sample Name": ["Sample1", "Sample2", "", ""],
						"MS Assay Name": ["", "", "", ""],
					}
				}
			}
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {
				"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, 
				"table": { "rowOffset": 0, "totalRowCount": 0,
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample1", "columnIndex": 6},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 1", "columnIndex": 7},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 2", "columnIndex": 8},
					]
				}
			}
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 4", "MS Assay Name 5"],
						"Sample Name": ["Sample1", "", "", ""],
					}
				}
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 3",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 3", "MS Assay Name 5"],
						"Sample Name": ["", "", "", ""],
					}
				}
			}
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {
				"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, 
				"table": { "rowOffset": 0, "totalRowCount": 0,
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 2", "columnIndex": 7},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 5", "columnIndex": 8},
					]
				}
			}
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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

#########################################################################################################
# rule_m_100_100_002_02
#########################################################################################################


# METADATA
# title: MS Assay Name or NMR Assay Name columns are not in metabolite assignment file.
# description: MS Assay Name or NMR Assay Name columns are  not in metabolite assignment file.
test_rule_m_100_100_002_02_no_violation_01 if {
	result := rules.rule_m_100_100_002_02 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 4",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 4", "MS Assay Name 5"],
						"Sample Name": ["", "", "", ""],
					}
				}
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 3",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 3", "MS Assay Name 5"],
						"Sample Name": ["", "", "", ""],
					}
				}
			}
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {
				"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, 
				"table": { "rowOffset": 0, "totalRowCount": 0,
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 1", "columnIndex": 6},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 2", "columnIndex": 7},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 3", "columnIndex": 7},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 4", "columnIndex": 7},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 5", "columnIndex": 8},
					]
				}
			}
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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
# title: One sample name column in maf file. 
# description: One sample name column in maf file.
test_rule_m_100_100_002_02_no_violation_02 if {
	result := rules.rule_m_100_100_002_02 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"MS Assay Name 2",
					"MS Assay Name 4",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 4", "MS Assay Name 5"],
						"Sample Name": ["Sample1", "", "", ""],
					}
				}
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 3",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 3", "MS Assay Name 5"],
						"Sample Name": ["", "", "", ""],
					}
				}
			}
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {
				"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, 
				"table": { "rowOffset": 0, "totalRowCount": 0,
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample1", "columnIndex": 6},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 2", "columnIndex": 7},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 5", "columnIndex": 8},
					]
				}
			}
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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
# title: MS Assay Name or NMR Assay Name columns are not in metabolite assignment file.
# description: MS Assay Name or NMR Assay Name columns are  not in metabolite assignment file.
test_rule_m_100_100_002_02_violation_01 if {
	result := rules.rule_m_100_100_002_02 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
					"Sample4",
				],
				"assayNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 4",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 4", "MS Assay Name 5"],
						"Sample Name": ["", "", "", ""],
					}
				}
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
					"Sample4",
				],
				"assayNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 4",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 3", "MS Assay Name 5"],
						"Sample Name": ["", "", "", ""],
					}
				}
			}
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {
				"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, 
				"table": { "rowOffset": 0, "totalRowCount": 0,
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 1", "columnIndex": 6},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 2", "columnIndex": 7},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 5", "columnIndex": 8},
					]
				}
			}
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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
test_rule_m_100_100_002_02_violation_02 if {
	result := rules.rule_m_100_100_002_02 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
					"Sample4",
				],
				"assayNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 4",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 4", "MS Assay Name 5"],
						"Sample Name": ["Sample1", "", "", ""],
					}
				}
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
					"Sample4",
				],
				"assayNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 4",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 3", "MS Assay Name 5"],
						"Sample Name": ["", "", "", ""],
					}
				}
			}
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {
				"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, 
				"table": { "rowOffset": 0, "totalRowCount": 0,
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 2", "columnIndex": 7},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name 5", "columnIndex": 8},
					]
				}
			}
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 4},
			],
		}]}
	count(result) == 1
}


# METADATA
# title: Sample Name/MS Assay Name columns are missing in metabolite assignment file
# description: Sample Name/MS Assay Name columns are missing in metabolite assignment file
test_rule_m_100_100_002_02_violation_04 if {
	result := rules.rule_m_100_100_002_02 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
					"Sample4",
				],
				"assayNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 4",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 4", "MS Assay Name 5"],
						"Sample Name": ["Sample1", "", "", ""],
					}
				}
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
					"Sample4",
				],
				"assayNames": [
					"MS Assay Name 1",
					"MS Assay Name 2",
					"MS Assay Name 4",
					"MS Assay Name 5",
				],
				"table" : {
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 2},
					],
					"data": {
						"MS Assay Name": ["MS Assay Name 1", "MS Assay Name 2", "MS Assay Name 3", "MS Assay Name 5"],
						"Sample Name": ["", "", "", ""],
					}
				}
			}
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {
				"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, 
				"table": { "rowOffset": 0, "totalRowCount": 0,
					"headers": [
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
						{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
						{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4}
					]
				}
			}
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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

#########################################################################################################
# rule_m_100_100_004_01
#########################################################################################################

# METADATA
# title: Metabolite assignment file name is referenced in an assay file.
# description: MMetabolite assignment file name is referenced in an assay file.
test_rule_m_100_100_004_01_no_violation_01 if {
	result := rules.rule_m_100_100_004_01 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
				],
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample2",
					"Sample3",
					"Sample4",
				],
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample1", "columnIndex": 5},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample2", "columnIndex": 6},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample3", "columnIndex": 7},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample4", "columnIndex": 8},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}

	count(result) == 0
}

# METADATA
# title: Metabolite assignment file name is not referenced in an assay file.
# description: Metabolite assignment file name is not referenced in an assay file.
test_rule_m_100_100_004_01_violation_01 if {
	result := rules.rule_m_100_100_004_01 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
				],
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample2",
					"Sample3",
					"Sample4",
				],
			},
		},
		"investigationFilePath": "i_Investigation.txt",
				"metaboliteAssignments": {
			"m_MTBLS3.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample1", "columnIndex": 5},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample4", "columnIndex": 8},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	count(result) == 1
}

#########################################################################################################
# rule_m_100_100_005_01
#########################################################################################################

# METADATA
# title: Assignment file name is valid.
# description:  Assignment file name is valid.
test_rule_m_100_100_005_01_no_violation_01 if {
	result := rules.rule_m_100_100_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Assignment file name is not valid.
# description:  Assignment file name is not valid.
test_rule_m_100_100_005_01_violation_01 if {
	result := rules.rule_m_100_100_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"a_MTBLS1.tsv": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Assignment file name is not valid.
# description:  Assignment file name is not valid.
test_rule_m_100_100_005_01_violation_02 if {
	result := rules.rule_m_100_100_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Assignment file name is not valid.
# description:  Assignment file name is not valid.
test_rule_m_100_100_005_01_violation_03 if {
	result := rules.rule_m_100_100_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}

#########################################################################################################
# rule_m_100_100_006_01
#########################################################################################################

# METADATA
# title: There are more rows in the metabolite assignment file.
# description:  There are more rows in the metabolite assignment file.
test_rule_m_100_100_006_01_no_violation_01 if {
	result := rules.rule_m_100_100_006_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"a_MTBLS1.tsv": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is no row in the metabolite assignment file.
# description:  There is no row in the metabolite assignment file.
test_rule_m_100_100_006_01_violation_01 if {
	result := rules.rule_m_100_100_006_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"a_MTBLS1.tsv": {"table": {"rowOffset": 0, "totalRowCount": 0}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}

#########################################################################################################
# rule_m_100_100_006_02
#########################################################################################################

# METADATA
# title: There are more rows in the metabolite assignment file.
# description:  There are more rows in the metabolite assignment file.
test_rule_m_100_100_006_02_no_violation_01 if {
	result := rules.rule_m_100_100_006_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"a_MTBLS1.tsv": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is one row in the metabolite assignment file.
# description:  There is one row in the metabolite assignment file.
test_rule_m_100_100_006_02_violation_01 if {
	result := rules.rule_m_100_100_006_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"a_MTBLS1.tsv": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}
