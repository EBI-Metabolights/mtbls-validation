package metabolights.validation.v2.rules.phase1.tests

import rego.v1
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.metabolights.validation.v2.rules.phase1.definitions as def
#########################################################################################################
# rule_i_100_310_001_01
#########################################################################################################

# METADATA
# title: There is a study design description
# description: There is one study in i_Investigation.txt.
test_rule_i_100_310_001_01_no_violation_01 if {
	result := rules.rule_i_100_310_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "test",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "EFO",
		},
		{
			"term": "test2",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000021",
			"termSourceRef": "EFO",
		},
		{
			"term": "test3",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_00000221",
			"termSourceRef": "EFO",
		}
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is a study design descriptor
# description: There is one study in i_Investigation.txt.
test_rule_i_100_310_001_01_no_violation_02 if {
	result := rules.rule_i_100_310_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [
			{
				"term": "test",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
				"termSourceRef": "EFO",
			},
			{
				"term": "test2",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000002",
				"termSourceRef": "EFO",
			},
			{
				"term": "test3",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000003",
				"termSourceRef": "EFO",
			},
			{
				"term": "test4",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000004",
				"termSourceRef": "EFO",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is no study design descriptor.
# description: There is no study design descriptor in i_Investigation.txt.
test_rule_i_100_310_001_01_violation_01 if {
	result := rules.rule_i_100_310_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": []}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_310_002_01
#########################################################################################################

# METADATA
# title: Study Design Type term is not empty
# description: Study Design Type term is not empty
test_rule_i_100_310_002_01_no_violation_01 if {
	result := rules.rule_i_100_310_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "test",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "EFO",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	} with def.RULE_STUDY_DESIGN_TYPE  as {
        "allowedMissingOntologyTerms": null,
        "allowedOtherSources": [
          {
            "accessionPrefix": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_",
            "sourceLabel": "MTBLS"
          },
          {
            "accessionPrefix": "https://www.wikidata.org/wiki/",
            "sourceLabel": "wikidata"
          },
          {
            "accessionPrefix": "http://uri.interlex.org/base/ilx_",
            "sourceLabel": "ILX"
          }
        ],
        "allowedParentOntologyTerms": null,
        "allowedPlaceholders": [
          {
            "termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/placeholder",
            "termSourceRef": "MTBLS"
          },
          {
            "termAccessionNumber": "",
            "termSourceRef": ""
          }
        ],
        "defaultValue": null,
        "description": "",
        "fieldName": "Study Design Type",
        "ontologies": [
          "EFO",
          "NCIT",
          "MTBLS",
          "CHEBI",
          "CHMO",
          "MONDO",
          "PRIDE",
          "GO",
          "MESH"
        ],
        "ruleName": "Study Design Type-01",
        "selectionCriteria": {
          "isaFileTemplateNameFilter": null,
          "isaFileType": "investigation",
          "linkedFieldAndValueFilter": null,
          "studyCategoryFilter": null,
          "studyCreatedAtOrAfter": null,
          "studyCreatedBefore": null,
          "templateVersionFilter": null
        },
        "terms": [
          {
            "term": "targeted metabolite profiling",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/MSIO_0000100",
            "termSourceRef": "MSIO"
          },
          {
            "term": "untargeted metabolite profiling",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/MSIO_0000101",
            "termSourceRef": "MSIO"
          },
          {
            "term": "nuclear magnetic resonance spectroscopy",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/CHMO_0000591",
            "termSourceRef": "CHMO"
          },
          {
            "term": "ultra-performance liquid chromatography-mass spectrometry",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/CHMO_0000715",
            "termSourceRef": "CHMO"
          },
          {
            "term": "gas chromatography-mass spectrometry",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/CHMO_0000497",
            "termSourceRef": "CHMO"
          },
          {
            "term": "tandem mass spectrometry",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/CHMO_0000575",
            "termSourceRef": "CHMO"
          },
          {
            "term": "Multi-omics study",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/PRIDE_0000461",
            "termSourceRef": "PRIDE"
          },
          {
            "term": "microbiome",
            "termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0004982",
            "termSourceRef": "EFO"
          },
          {
            "term": "aging",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C16269",
            "termSourceRef": "NCIT"
          },
          {
            "term": "cancer",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/MONDO_0004992",
            "termSourceRef": "MONDO"
          }
        ],
        "validationType": "any-ontology-term"
      }
	count(result) == 0
}

# METADATA
# title: Study Design Type term is  empty
# description: Study Design Type term is not empty
test_rule_i_100_310_002_01_violation_01 if {
	result := rules.rule_i_100_310_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "EFO",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	} with def.RULE_STUDY_DESIGN_TYPE as {
        "allowedMissingOntologyTerms": null,
        "allowedOtherSources": [
          {
            "accessionPrefix": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_",
            "sourceLabel": "MTBLS"
          },
          {
            "accessionPrefix": "https://www.wikidata.org/wiki/",
            "sourceLabel": "wikidata"
          },
          {
            "accessionPrefix": "http://uri.interlex.org/base/ilx_",
            "sourceLabel": "ILX"
          }
        ],
        "allowedParentOntologyTerms": null,
        "allowedPlaceholders": [
          {
            "termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/placeholder",
            "termSourceRef": "MTBLS"
          },
          {
            "termAccessionNumber": "",
            "termSourceRef": ""
          }
        ],
        "defaultValue": null,
        "description": "",
        "fieldName": "Study Design Type",
        "ontologies": [
          "EFO",
          "NCIT",
          "MTBLS",
          "CHEBI",
          "CHMO",
          "MONDO",
          "PRIDE",
          "GO",
          "MESH"
        ],
        "ruleName": "Study Design Type-01",
        "selectionCriteria": {
          "isaFileTemplateNameFilter": null,
          "isaFileType": "investigation",
          "linkedFieldAndValueFilter": null,
          "studyCategoryFilter": null,
          "studyCreatedAtOrAfter": null,
          "studyCreatedBefore": null,
          "templateVersionFilter": null
        },
        "terms": [
          {
            "term": "targeted metabolite profiling",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/MSIO_0000100",
            "termSourceRef": "MSIO"
          },
          {
            "term": "untargeted metabolite profiling",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/MSIO_0000101",
            "termSourceRef": "MSIO"
          },
          {
            "term": "nuclear magnetic resonance spectroscopy",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/CHMO_0000591",
            "termSourceRef": "CHMO"
          },
          {
            "term": "ultra-performance liquid chromatography-mass spectrometry",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/CHMO_0000715",
            "termSourceRef": "CHMO"
          },
          {
            "term": "gas chromatography-mass spectrometry",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/CHMO_0000497",
            "termSourceRef": "CHMO"
          },
          {
            "term": "tandem mass spectrometry",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/CHMO_0000575",
            "termSourceRef": "CHMO"
          },
          {
            "term": "Multi-omics study",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/PRIDE_0000461",
            "termSourceRef": "PRIDE"
          },
          {
            "term": "microbiome",
            "termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0004982",
            "termSourceRef": "EFO"
          },
          {
            "term": "aging",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C16269",
            "termSourceRef": "NCIT"
          },
          {
            "term": "cancer",
            "termAccessionNumber": "http://purl.obolibrary.org/obo/MONDO_0004992",
            "termSourceRef": "MONDO"
          }
        ],
        "validationType": "any-ontology-term"
      }
	count(result) == 1
}

#########################################################################################################
# rule_i_100_310_003_01
#########################################################################################################

# METADATA
# title: Study Design Type accession number is not empty
# description: Study Design Type accession number is not empty
test_rule_i_100_310_003_01_no_violation_01 if {
	result := rules.rule_i_100_310_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "test",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "EFO",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study Design Type accession number is  empty
# description: Study Design Type accession number is not empty
test_rule_i_100_310_003_01_violation_01 if {
	result := rules.rule_i_100_310_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "Data",
			"termAccessionNumber": "",
			"termSourceRef": "EFO",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_310_004_01
#########################################################################################################

# METADATA
# title: Study Design Type term source ref is not empty
# description: Study Design Type term source ref is not empty
test_rule_i_100_310_004_01_no_violation_01 if {
	result := rules.rule_i_100_310_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "test",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "EFO",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study Design Type term source ref is  empty
# description: Study Design Type term source ref is not empty
test_rule_i_100_310_004_01_violation_01 if {
	result := rules.rule_i_100_310_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "Data",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_310_004_02
#########################################################################################################

# METADATA
# title: Study Design Type term source ref is in Ontology Source References section.
# description: Study Design Type term source ref is in Ontology Source References section.
test_rule_i_100_310_004_02_no_violation_01 if {
	result := rules.rule_i_100_310_004_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
				"term": "test",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
				"termSourceRef": "EFO",
			}]}}],
			"ontologySourceReferences": {"references": [{
				"sourceName": "EFO",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "EFO",
			}]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Three Study Design Type term source refs are  in Ontology Source References section.
# description: Three Study Design Type term source refs are in Ontology Source References section.
test_rule_i_100_310_004_02_no_violation_02 if {
	result := rules.rule_i_100_310_004_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "MTBLS",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "NCBI",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "EFO",
				},
			]}}],
			"ontologySourceReferences": {"references": [
				{
					"sourceName": "EFO",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "EFO",
				},
				{
					"sourceName": "MTBLS",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "EFO",
				},
				{
					"sourceName": "NCBI",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "EFO",
				},
			]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study Design Type term source ref is not in Ontology Source References section.
# description: Study Design Type term source ref is not in Ontology Source References section.
test_rule_i_100_310_004_02_violation_01 if {
	result := rules.rule_i_100_310_004_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
				"term": "test",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
				"termSourceRef": "1",
			}]}}],
			"ontologySourceReferences": {"references": [{
				"sourceName": "EFO",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "EFO",
			}]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Two Study Design Type term source refs are not in Ontology Source References section.
# description: Two Study Design Type term source ref sare not in Ontology Source References section.
test_rule_i_100_310_004_02_violation_02 if {
	result := rules.rule_i_100_310_004_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "1",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "EFO",
				},
			]}}],
			"ontologySourceReferences": {"references": [{
				"sourceName": "EFO",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "EFO",
			}]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

