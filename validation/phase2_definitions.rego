package metabolights.validation.v2.phase2.definitions

import rego.v1

_SAMPLES_DEFAULT_CHARACTERISTICS_HEADERS = {x |
	some header in data.metabolights.validation.v2.phase1.definitions.SELECTED_STUDY_SAMPLE_FILE_TEMPLATE_HEADERS
	header.columnCategory == "Characteristics"
	x := header.columnHeader
}

_ONTOLOGY_SOURCE_REFERENCE_NAMES := {x.sourceName | x := input.investigation.ontologySourceReferences.references[_]}

_ONTOLOGY_SOURCE_REFERENCE_NAMES_STR := concat(", ", _ONTOLOGY_SOURCE_REFERENCE_NAMES)

_ALLOWED_CHARS_PATTERN := concat("", data.metabolights.validation.v2.configuration.allowedChars)

CL_UNIT_TERM_REF_SOURCES = [x | x := data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources[_]]

CL_UNIT_TERM_REF_SOURCES_STR = concat(", ", CL_UNIT_TERM_REF_SOURCES)

CL_ORGANISM_TERM_REF_SOURCES = {x | x := data.metabolights.validation.v2.controlLists.prioritisedOrganismRefSources[_]}

CL_ORGANISM_TERM_REF_SOURCES_STR = concat(", ", CL_ORGANISM_TERM_REF_SOURCES)

CL_ORGANISM_PART_TERM_REF_SOURCES = {x | x := data.metabolights.validation.v2.controlLists.prioritisedOrganismPartRefSources[_]}

CL_ORGANISM_PART_TERM_REF_SOURCES_STR = concat(", ", CL_ORGANISM_PART_TERM_REF_SOURCES)

CL_DERIVED_FILE_EXTENSIONS := data.metabolights.validation.v2.configuration.derivedFileExtensions

CL_DERIVED_FILE_EXTENSIONS_STR := concat(",", CL_DERIVED_FILE_EXTENSIONS)

CL_RAW_FILE_EXTENSIONS := data.metabolights.validation.v2.configuration.rawFileExtensions

CL_RAW_FILE_EXTENSIONS_STR := concat(",", CL_RAW_FILE_EXTENSIONS)
