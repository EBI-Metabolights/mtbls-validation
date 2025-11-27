package metabolights.validation.v2.rules.phase2.definitions

import rego.v1

_SAMPLES_DEFAULT_CHARACTERISTICS_HEADERS := {x |
	some header in data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_STUDY_SAMPLE_FILE_TEMPLATE_HEADERS
	startswith(header.columnHeader, "Characteristics[")

	x := header.columnHeader
}

ONTOLOGY_SOURCE_REFERENCE_NAMES := {x.sourceName | x := input.investigation.ontologySourceReferences.references[_]}

ONTOLOGY_SOURCE_REFERENCE_NAMES_STR := concat(", ", ONTOLOGY_SOURCE_REFERENCE_NAMES)

_ALLOWED_CHARS_PATTERN := concat("", data.metabolights.validation.v2.configuration.allowedChars)

template_version := data.metabolights.validation.v2.rules.phase1.definitions.STUDY_TEMPLATE_VERSION
CL_DERIVED_FILE_EXTENSIONS := data.metabolights.validation.v2.templates.configuration.versions[template_version].derivedFileExtensions

CL_DERIVED_FILE_EXTENSIONS_STR := concat(",", CL_DERIVED_FILE_EXTENSIONS)

CL_RAW_FILE_EXTENSIONS := data.metabolights.validation.v2.templates.configuration.versions[template_version].rawFileExtensions

CL_RAW_FILE_EXTENSIONS_STR := concat(",", CL_RAW_FILE_EXTENSIONS)
