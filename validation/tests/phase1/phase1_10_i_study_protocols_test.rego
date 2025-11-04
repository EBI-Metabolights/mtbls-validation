package metabolights.validation.v2.rules.phase1.tests

import rego.v1
import data.metabolights.validation.v2.rules.phase1.violations as rules

#########################################################################################################
# rule_i_100_350_001_01
#########################################################################################################

# METADATA
# title: There is a study protocol
# description: There is one study protocol in i_Investigation.txt.
test_rule_i_100_350_001_01_no_violation_01 if {
	result := rules.rule_i_100_350_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [{
			"name": "Sample collection",
			"protocolType": {
				"term": "Sample collection",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"description": "<p>The<strong> </strong>Prostate, Lung, Colorectal, and Ovarian (<strong>PLCO)</strong> Cancer Screening Trial is a randomized multicenter trial in the United States that aimed to evaluate the impact of early detection procedures for prostate, lung, colorectal and ovarian cancer on disease-specific mortality. Detailed information regarding the PLCO cohort is provided elsewhere<strong>[1]</strong>. The study included <strong>173 pancreatic cancer cases </strong>that were diagnosed within 5 yr of blood draw and <strong>863 matched non-cases</strong> from 10 participating PLCO study centers. Pancreatic cancer cases were identified by self-report in annual mail-in surveys, state cancer registries, death certificates, physician referrals and reports from next of kin for deceased individuals. All medical and pathologic records related to pancreatic cancer diagnosis and supporting documentation were obtained and confirmed by PLCO staff.</p><p><br></p><p><strong>Ref:</strong></p><p><strong>[1]</strong> Fahrmann, J.F., Schmidt, C.M., Mao, X., Irajizad, E., Loftus, M., Zhang, J., Patel, N., Vykoukal, J., Dennison, J.B., Long, J.P., et al. (2020). Lead-Time Trajectory of CA19-9 as an Anchor Marker for Pancreatic Cancer Early Detection. Gastroenterology. 10.1053/j.gastro.2020.11.052.</p>",
			"uri": "",
			"version": "",
			"parameters": [],
			"components": [],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There are two study protocols
# description: There are two study protocols in i_Investigation.txt.
test_rule_i_100_350_001_01_no_violation_02 if {
	result := rules.rule_i_100_350_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sample collection",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "<p>The<strong> </strong>Prostate, Lung, Colorectal, and Ovarian (<strong>PLCO)</strong> Cancer Screening Trial is a randomized multicenter trial in the United States that aimed to evaluate the impact of early detection procedures for prostate, lung, colorectal and ovarian cancer on disease-specific mortality. Detailed information regarding the PLCO cohort is provided elsewhere<strong>[1]</strong>. The study included <strong>173 pancreatic cancer cases </strong>that were diagnosed within 5 yr of blood draw and <strong>863 matched non-cases</strong> from 10 participating PLCO study centers. Pancreatic cancer cases were identified by self-report in annual mail-in surveys, state cancer registries, death certificates, physician referrals and reports from next of kin for deceased individuals. All medical and pathologic records related to pancreatic cancer diagnosis and supporting documentation were obtained and confirmed by PLCO staff.</p><p><br></p><p><strong>Ref:</strong></p><p><strong>[1]</strong> Fahrmann, J.F., Schmidt, C.M., Mao, X., Irajizad, E., Loftus, M., Zhang, J., Patel, N., Vykoukal, J., Dennison, J.B., Long, J.P., et al. (2020). Lead-Time Trajectory of CA19-9 as an Anchor Marker for Pancreatic Cancer Early Detection. Gastroenterology. 10.1053/j.gastro.2020.11.052.</p>",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Extraction",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "<p>The<strong> </strong>Prostate, Lung, Colorectal, and Ovarian (<strong>PLCO)</strong> Cancer Screening Trial is a randomized multicenter trial in the United States that aimed to evaluate the impact of early detection procedures for prostate, lung, colorectal and ovarian cancer on disease-specific mortality. Detailed information regarding the PLCO cohort is provided elsewhere<strong>[1]</strong>. The study included <strong>173 pancreatic cancer cases </strong>that were diagnosed within 5 yr of blood draw and <strong>863 matched non-cases</strong> from 10 participating PLCO study centers. Pancreatic cancer cases were identified by self-report in annual mail-in surveys, state cancer registries, death certificates, physician referrals and reports from next of kin for deceased individuals. All medical and pathologic records related to pancreatic cancer diagnosis and supporting documentation were obtained and confirmed by PLCO staff.</p><p><br></p><p><strong>Ref:</strong></p><p><strong>[1]</strong> Fahrmann, J.F., Schmidt, C.M., Mao, X., Irajizad, E., Loftus, M., Zhang, J., Patel, N., Vykoukal, J., Dennison, J.B., Long, J.P., et al. (2020). Lead-Time Trajectory of CA19-9 as an Anchor Marker for Pancreatic Cancer Early Detection. Gastroenterology. 10.1053/j.gastro.2020.11.052.</p>",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is no study protocol.
# description: There is no study protocol in i_Investigation.txt.
test_rule_i_100_350_001_01_violation_01 if {
	result := rules.rule_i_100_350_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": []}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_350_001_02
#########################################################################################################

# METADATA
# title: study protocol file name is not empty
# description: study protocol file name is not empty.
test_rule_i_100_350_001_02_no_violation_01 if {
	result := rules.rule_i_100_350_001_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sample collection",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Extraction",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1_metabolite_profiling.txt": {"assayTechnique": {
			"name": "LC-MS",
			"mainTechnique": "MS",
			"technique": "LC-MS",
			"subTechnique": "LC",
		}}},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_MERGED_STUDY_PROTOCOLS as [
			"Extraction",
			"Sample collection",
		]
		with data.metabolights.validation.v2.rules.phase1.definitions._PROTOCOL_TECHNOLOGY_MAP as {
			"Extraction": ["LC-MS"],
			"Sample collection": ["LC-MS"],
		}
	count(result) == 0
}

# METADATA
# title: study protocol is missing.
# description:  study protocol is missing.
test_rule_i_100_350_001_02_violation_01 if {
	result := rules.rule_i_100_350_001_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sample collection",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Extraction",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1_metabolite_profiling.txt": {"assayTechnique": {
			"name": "LC-MS",
			"mainTechnique": "MS",
			"technique": "LC-MS",
			"subTechnique": "LC",
		}}},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_MERGED_STUDY_PROTOCOLS as [
			"Extraction",
			"Sample collection",
			"Mass spectrometry",
			"Metabolite identification",
		]
		with data.metabolights.validation.v2.rules.phase1.definitions._PROTOCOL_TECHNOLOGY_MAP as {
			"Extraction": ["LC-MS"],
			"Sample collection": ["LC-MS"],
			"Mass spectrometry": ["LC-MS"],
			"Metabolite identification": ["LC-MS"],
		}
	count(result) == 2
}

# METADATA
# title: study protocol is missing.
# description:  study protocol is missing.
test_rule_i_100_350_001_02_violation_02 if {
	result := rules.rule_i_100_350_001_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sample collection",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Extraction",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
		"assays": {
			"a_MTBLS1_metabolite_profiling.txt": {"assayTechnique": {
				"name": "LC-MS",
				"mainTechnique": "MS",
				"technique": "LC-MS",
				"subTechnique": "LC",
			}},
			"a_MTBLS1_2_metabolite_profiling.txt": {"assayTechnique": {
				"name": "GC-MS",
				"mainTechnique": "MS",
				"technique": "GC-MS",
				"subTechnique": "GC",
			}},
		},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_MERGED_STUDY_PROTOCOLS as [
			"Extraction",
			"Sample collection",
			"Mass spectrometry",
			"Metabolite identification1",
			"Metabolite identification2",
		]
		with data.metabolights.validation.v2.rules.phase1.definitions._PROTOCOL_TECHNOLOGY_MAP as {
			"Extraction": ["LC-MS", "GC-MS"],
			"Sample collection": ["LC-MS", "GC-MS"],
			"Mass spectrometry": ["LC-MS", "GC-MS"],
			"Metabolite identification1": ["GC-MS"],
			"Metabolite identification2": ["GC-MS"],
		}
	count(result) == 3
}

#########################################################################################################
# rule_i_100_350_002_01
#########################################################################################################

# METADATA
# title: study protocol name is valid.
# description: study protocol name is valid.
test_rule_i_100_350_002_01_no_violation_01 if {
	result := rules.rule_i_100_350_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sam",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Mass spectrometry",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Mass",
				"protocolType": {
					"term": "Mass spectrometry",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study protocol name is not valid.
# description: study protocol name is not valid.
test_rule_i_100_350_002_01_violation_01 if {
	result := rules.rule_i_100_350_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sa",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "M",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "",
				"protocolType": {
					"term": "Mass spectrometry",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 3
}

#########################################################################################################
# rule_i_100_350_003_01
#########################################################################################################

# METADATA
# title: study protocol description is valid.
# description: study protocol description is valid.
test_rule_i_100_350_003_01_no_violation_01 if {
	result := rules.rule_i_100_350_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol Description Description.",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Mass spectrometry",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol. Description of study protocol Description Description.",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study protocol description is not valid.
# description: study protocol description is not valid.
test_rule_i_100_350_003_01_violation_01 if {
	result := rules.rule_i_100_350_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sa",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "M",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Please update this protocol description",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "",
				"protocolType": {
					"term": "Mass spectrometry",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 3
}

#########################################################################################################
# rule_i_100_350_003_02
#########################################################################################################

# METADATA
# title: study protocol description is valid.
# description: study protocol description is valid.
test_rule_i_100_350_003_02_no_violation_01 if {
	result := rules.rule_i_100_350_003_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol.",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Mass spectrometry",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol. Description of study protocol.",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study protocol description is not valid.
# description: study protocol description is not valid.
test_rule_i_100_350_003_02_violation_01 if {
	result := rules.rule_i_100_350_003_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sa",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description ⋿of study protocol\u000e",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "M",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "\t",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "",
				"protocolType": {
					"term": "Mass spectrometry",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "\t\n\b",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 3
}


#########################################################################################################
# rule_i_100_350_003_02
#########################################################################################################

# METADATA
# title: study protocol description is valid.
# description: study protocol description is valid.
test_rule_i_100_350_003_03_no_violation_01 if {
	result := rules.rule_i_100_350_003_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol.",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Mass spectrometry",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol. Description of study protocol.",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study protocol description is not valid.
# description: study protocol description is not valid.
test_rule_i_100_350_003_03_violation_01 if {
	result := rules.rule_i_100_350_003_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Please update this protocol description.",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Mass spectrometry",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Please update this protocol.",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}


#########################################################################################################
# rule_i_100_350_004_01
#########################################################################################################

# METADATA
# title: study protocol type term is valid.
# description: study protocol type term is valid.
test_rule_i_100_350_004_01_no_violation_01 if {
	result := rules.rule_i_100_350_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol.",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Mass spectrometry",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol. Description of study protocol.",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study protocol type term is not valid.
# description: study protocol type term is not valid.
test_rule_i_100_350_004_01_violation_01 if {
	result := rules.rule_i_100_350_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sa",
				"protocolType": {
					"term": "Sa",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "M",
				"protocolType": {
					"term": "M",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "",
				"protocolType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 3
}

#########################################################################################################
# rule_i_100_350_007_01
#########################################################################################################

# METADATA
# title: study protocol parameter is missing.
# description:  study protocol parameter is missing.
test_rule_i_100_350_007_01_no_violation_01 if {
	result := rules.rule_i_100_350_007_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [{
			"name": "Extraction",
			"protocolType": {
				"term": "Extraction",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"description": "",
			"uri": "",
			"version": "",
			"parameters": [
				{
					"term": "Derivatization",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				{
					"term": "Post Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			],
			"components": [],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_MERGED_STUDY_PROTOCOL_PARAMETERS as {"Extraction": [
			"Derivatization",
			"Post Extraction",
		]}
	count(result) == 0
}

# METADATA
# title: study protocol parameter is missing.
# description:  study protocol parameter is missing.
test_rule_i_100_350_007_01_violation_01 if {
	result := rules.rule_i_100_350_007_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sample collection",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Chromatography",
				"protocolType": {
					"term": "Chromatography",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Extraction",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_MERGED_STUDY_PROTOCOL_PARAMETERS as {
			"Sample collection": [
				"Instrument",
				"Ion source",
				"Mass analyzer",
				"Scan m/z range",
				"Scan polarity",
			],
			"Extraction": [
				"Derivatization",
				"Post Extraction",
			],
			"Chromatography": [
				"Autosampler model",
				"Chromatography Instrument",
				"Column model",
				"Column type",
				"Guard column",
			],
		}
	count(result) == 3
}

#########################################################################################################
# rule_i_100_350_008_01
#########################################################################################################

# METADATA
# title: study protocol type parameter term is valid.
# description: study protocol type parameter term is valid.
test_rule_i_100_350_008_01_no_violation_01 if {
	result := rules.rule_i_100_350_008_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol.",
				"uri": "",
				"version": "",
				"parameters": [{
					"term": "Post Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				}],
				"components": [],
			},
			{
				"name": "Mass spectrometry",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol. Description of study protocol.",
				"uri": "",
				"version": "",
				"parameters": [
					{
						"term": "UO",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					{
						"term": "Derivatization",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
				],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study protocol type parameter term is not valid.
# description: study protocol type parameter term is not valid.
test_rule_i_100_350_008_01_violation_01 if {
	result := rules.rule_i_100_350_008_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [{
			"name": "Sa",
			"protocolType": {
				"term": "Sa",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"description": "Description of study protocol",
			"uri": "",
			"version": "",
			"parameters": [
				{
					"term": "UFO",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				{
					"term": "U",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				{
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			],
			"components": [],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}
