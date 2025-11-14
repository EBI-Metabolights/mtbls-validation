#########################################################################################################
# Unit tests for rule_i_100_310_002_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules
import rego.v1

# METADATA
# title: Study Design Type is not in the control list or selected ontologies..
# description: Study Design Type value MUST be selected from the control list.
# custom:
#  rule_id: rule_i_100_310_002_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_002_01_test_cases := 1

# METADATA
# title: Study Design Type term is in the control list
# description: Study Design Type term is in the control list
test_rule_i_100_310_002_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UO",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is wikidata input
# description: Study Design Type term is wikidata input
test_rule_i_100_310_002_01_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "https://www.wikidata.org/wiki/Q11570",
				"termSourceRef": "wikidata",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term has missing data input value
# description: Study Design Type term has missing data input value
test_rule_i_100_310_002_01_no_violation_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Not Applicable",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C48660",
				"termSourceRef": "NCIT",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term has placeholder value
# description: Study Design Type term has placeholder value
test_rule_i_100_310_002_01_no_violation_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Example",
				"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/placeholder",
				"termSourceRef": "MTBLS",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is in the selected ontologies
# description: Study Design Type term is in the selected ontologies
test_rule_i_100_310_002_01_no_violation_selected_ontologies_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [
				{
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UO",
				},
				{
					"term": "Mus musculus",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCBITaxon_10090",
					"termSourceRef": "NCBITAXON",
				},
			],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.selected_ontologies_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is wikidata input
# description: Study Design Type term is wikidata input
test_rule_i_100_310_002_01_no_violation_selected_ontologies_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "https://www.wikidata.org/wiki/Q11570",
				"termSourceRef": "wikidata",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.selected_ontologies_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term has missing data input value
# description: Study Design Type term has missing data input value
test_rule_i_100_310_002_01_no_violation_selected_ontologies_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Not Applicable",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C48660",
				"termSourceRef": "NCIT",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.selected_ontologies_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term has placeholder value
# description: Study Design Type term has placeholder value
test_rule_i_100_310_002_01_no_violation_selected_ontologies_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Example",
				"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/placeholder",
				"termSourceRef": "MTBLS",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.selected_ontologies_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is a child of the selected ontology terms
# description: Study Design Type term is a child of the selected ontology terms
test_rule_i_100_310_002_01_no_violation_child_ontology_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [
				{
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UO",
				},
				{
					"term": "Kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C28252",
					"termSourceRef": "NCIT",
				},
			],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.child_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is wikidata input
# description: Study Design Type term is wikidata input
test_rule_i_100_310_002_01_no_violation_child_ontology_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "https://www.wikidata.org/wiki/Q11570",
				"termSourceRef": "wikidata",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.child_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term has missing data input value
# description: Study Design Type term has missing data input value
test_rule_i_100_310_002_01_no_violation_child_ontology_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Not Applicable",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C48660",
				"termSourceRef": "NCIT",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.child_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term has placeholder value
# description: Study Design Type term has placeholder value
test_rule_i_100_310_002_01_no_violation_child_ontology_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Example",
				"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/placeholder",
				"termSourceRef": "MTBLS",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.child_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is a child of the selected ontology terms
# description: Study Design Type term is a child of the selected ontology terms
test_rule_i_100_310_002_01_no_violation_any_ontology_term_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [
				{
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UO",
				},
				{
					"term": "Kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C28252",
					"termSourceRef": "NCIT",
				},
			],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is wikidata input
# description: Study Design Type term is wikidata input
test_rule_i_100_310_002_01_no_violation_any_ontology_term_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "https://www.wikidata.org/wiki/Q11570",
				"termSourceRef": "wikidata",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term has missing data input value
# description: Study Design Type term has missing data input value
test_rule_i_100_310_002_01_no_violation_any_ontology_term_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Not Applicable",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C48660",
				"termSourceRef": "NCIT",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term has placeholder value
# description: Study Design Type term has placeholder value
test_rule_i_100_310_002_01_no_violation_any_ontology_term_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Example",
				"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/placeholder",
				"termSourceRef": "MTBLS",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term has an empty placeholder value
# description: Study Design Type term has an empty placeholder value
test_rule_i_100_310_002_01_no_violation_any_ontology_term_05 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Test Data",
				"termAccessionNumber": "",
				"termSourceRef": "",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is  empty
# description: Study Design Type term is empty
test_rule_i_100_310_002_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UO",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01

	count(result) == 1
}

# METADATA
# title: Study Design Type term source ref is  empty
# description: Study Design Type term  source ref is empty
test_rule_i_100_310_002_01_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Design Type term accession is  empty
# description: Study Design Type term accession is empty
test_rule_i_100_310_002_01_violation_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "",
				"termSourceRef": "UO",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Design Type term is not in the control list
# description: Study Design Type term is not in the control list
test_rule_i_100_310_002_01_violation_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "microgram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000023",
				"termSourceRef": "UO",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Design Type term has invalid placeholder value
# description: Study Design Type term has invalid placeholder value
test_rule_i_100_310_002_01_violation_05 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Example",
				"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS1",
				"termSourceRef": "MTBLS",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Design Type term has an ontology term not in the control list
# description: Study Design Type term has an ontology term not in the control list
test_rule_i_100_310_002_01_violation_06 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Design Type term is  not in the selected ontologies
# description: Study Design Type term is not in the selected ontologies
test_rule_i_100_310_002_01_violation_selected_ontologies_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C28252",
				"termSourceRef": "NCIT",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Design Type term source ref is  empty
# description: Study Design Type term  source ref is empty
test_rule_i_100_310_002_01_violation_selected_ontologies_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Design Type term has invalid placeholder value
# description: Study Design Type term has invalid placeholder value
test_rule_i_100_310_002_01_violation_selected_ontologies_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Example",
				"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS1",
				"termSourceRef": "MTBLS",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Design Type term is not a child of the selected ontology terms
# description: Study Design Type term is not a child of the selected ontology terms
test_rule_i_100_310_002_01_violation_child_ontology_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "Mus musculus",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/NCBITaxon_10090",
				"termSourceRef": "NCBITAXON",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.child_ontology_term_01
	count(result) == 1
}
