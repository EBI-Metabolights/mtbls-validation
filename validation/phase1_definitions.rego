package metabolights.validation.v2.phase1.definitions

import rego.v1
import data.metabolights.validation.v2.functions.to_string
# import data.metabolights.validation.v2.templates
# import input.investigation
# import input.assays


_ONTOLOGY_SOURCE_REFERENCE_NAMES := {x.sourceName | x := input.investigation.ontologySourceReferences.references[_]}
_ALLOWED_CHARS_PATTERN := concat("", data.metabolights.validation.v2.configuration.allowedChars)

CL_INVALID_ORGANISM_TERMS = {x | x := data.metabolights.validation.v2.configuration.invalidOrganismTerms[_]}

CL_PUBLICATION_STATUS_TERMS := { onto.term |
		some onto in data.metabolights.validation.v2.controlLists.investigationFile["Study Publication Status"].terms
}
CL_PUBLICATION_STATUS_TERMS_STR := to_string(CL_PUBLICATION_STATUS_TERMS)
CL_PREDEFINED_SOURCE_REFERENCES := { name: source_refs |
		some name, item in data.metabolights.validation.v2.controlLists.investigationFile
		source_refs := {x | 
			some x in item.ontologies
		}
}

CL_PUBLICATION_STATUS_REF_SOURCES := CL_PREDEFINED_SOURCE_REFERENCES["Study Publication Status"]
CL_PUBLICATION_STATUS_REF_SOURCES_STR := to_string(CL_PUBLICATION_STATUS_REF_SOURCES)

CL_STUDY_ASSAY_MEASUREMENT_TYPE_REF_SOURCES := CL_PREDEFINED_SOURCE_REFERENCES["Study Assay Measurement Type"]
CL_STUDY_ASSAY_MEASUREMENT_TYPE_REF_SOURCES_STR := to_string(CL_STUDY_ASSAY_MEASUREMENT_TYPE_REF_SOURCES)

CL_STUDY_ASSAY_TECHNOLOGY_TYPE_REF_SOURCES := CL_PREDEFINED_SOURCE_REFERENCES["Study Assay Technology Type"]
CL_STUDY_ASSAY_TECHNOLOGY_TYPE_REF_SOURCES_STR := to_string(CL_STUDY_ASSAY_TECHNOLOGY_TYPE_REF_SOURCES)

CL_STUDY_CONTACT_ROLE_REF_SOURCES = CL_PREDEFINED_SOURCE_REFERENCES["Study Person Roles"]
CL_STUDY_CONTACT_ROLE_REF_SOURCES_STR = to_string(CL_STUDY_CONTACT_ROLE_REF_SOURCES)

CL_STUDY_DESIGN_DESCRIPTOR_REF_SOURCES := CL_PREDEFINED_SOURCE_REFERENCES["Study Design Type"]
CL_STUDY_DESIGN_DESCRIPTOR_REF_SOURCES_STR := to_string(CL_STUDY_DESIGN_DESCRIPTOR_REF_SOURCES)

CL_STUDY_FACTOR_REF_SOURCES := CL_PREDEFINED_SOURCE_REFERENCES["Study Factor Type"]
CL_STUDY_FACTOR_REF_SOURCES_STR := to_string(CL_STUDY_FACTOR_REF_SOURCES)

_DEFAULT_SAMPLE_FILE_HEADERS := {x | 
	some sampleFile in data.metabolights.validation.v2.templates.sampleFileHeaderTemplates
	sampleFile.version == "v1.0"
	some x in sampleFile.headers

}
_DEFAULT_ASSAY_HEADERS := {assay_file_name: assay_headers |
	some i, j
	assay_file_name  := input.investigation.studies[i].studyAssays.assays[j].fileName
	technology := input.assays[assay_file_name].assayTechnique.name
	assay_headers := data.metabolights.validation.v2.templates.assayFileHeaderTemplates[technology]
}

_DEFAULT_ASSAY_HEADER_NAMES := {file_name: y | 
		some file_name, headers_set in _DEFAULT_ASSAY_HEADERS
		some template in headers_set
		template.version == "v1.0"
		header_names := [ t.columnHeader | some t in template.headers]
		y := header_names
	}

_DEFAULT_SAMPLE_HEADER_NAMES = {x.columnHeader | x := _DEFAULT_SAMPLE_FILE_HEADERS[_]}


_DEFAULT_STUDY_PROTOCOLS := {technology: protocol_names |
    technology := input.assays[j].assayTechnique.name
	protocol_names := [x.name | x := data.metabolights.validation.v2.templates.studyProtocolTemplates[technology].protocols[t]]
}

_DEFAULT_MERGED_STUDY_PROTOCOLS := {x |
	x := _DEFAULT_STUDY_PROTOCOLS[_][_]
}

_DEFAULT_MERGED_STUDY_PROTOCOL_PARAMETERS := {protocol_name: parameters |
	technologies := { x| some j;
		_DEFAULT_STUDY_PROTOCOLS[j];
		x := j
	}
	protocol_name := _DEFAULT_MERGED_STUDY_PROTOCOLS[protocol]
	parameters := {x |
		some i, j, k
		data.metabolights.validation.v2.templates.studyProtocolTemplates[i].protocols[j]
		i in technologies
		protocol_name == data.metabolights.validation.v2.templates.studyProtocolTemplates[i].protocols[j].name
		x := data.metabolights.validation.v2.templates.studyProtocolTemplates[i].protocols[j].parameters[k]
	}
}

# Stores protocol name related technology names 
_PROTOCOL_TECHNOLOGY_MAP := {protocol_name: technologies |
	some i
	protocol_name := _DEFAULT_MERGED_STUDY_PROTOCOLS[i]
	technologies := {x | some j; protocol_name in _DEFAULT_STUDY_PROTOCOLS[j]; x := j}
}

__ASSAY_DEFAULT_PROTOCOL_HEADERS := {file_name: default_values | 
		some file_name, sheet in input.assays
        assay_type := sheet.table.assayTechnique.name
        default_values := [ header | 
            some template in data.metabolights.validation.v2.templates.assayFileHeaderTemplates[assay_type]
			template.version == "v1.0"
			some header in template.headers
            header.columnCategory == "Protocol"
		]
}

__ASSAY_PROTOCOL_HEADER_COLUMNS := {file_name: columns | 
		some file_name, _ in input.assays
        columns := [ header.columnIndex | 
            some header in input.assays[file_name].table.headers
            header.columnHeader== "Protocol REF"
        ]
}


__ASSAY_TECHNIQUES := {file_name: technology |
    some assay_name, _ in input.assays
	file_name := assay_name
    technology := input.assays[assay_name].assayTechnique.name
}


# __ASSIGNMENT_FILE_TYPES := {fileName: technology |
#     fileName := input.referencedAssignmentFiles[a]
# 	print(fileName)
#     fileName in input.assays[j].referencedAssignmentFiles

#     technology := __ASSAY_TECHNIQUES[j]
# }

