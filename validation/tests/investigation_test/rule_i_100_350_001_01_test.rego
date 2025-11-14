#########################################################################################################
# Unit tests for rule_i_100_350_001_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: No study protocols referenced in investigation file.
# description: At least one study protocols should be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_350_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyProtocols
rule_i_100_350_001_01_test_cases := 1

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
