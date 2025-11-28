package metabolights.validation.v2.rules.phase1.definitions

import data.metabolights.validation.v2.utils.field_match as field_match
import data.metabolights.validation.v2.utils.functions as f
import rego.v1

ONTOLOGY_SOURCE_REFERENCE_NAMES := {x.sourceName |
	some x in input.investigation.ontologySourceReferences.references
}

_ALLOWED_CHARS_PATTERN := concat("", data.metabolights.validation.v2.configuration.allowedChars)

match_criteria(
	criteria,
	isa_file_type,
	template_name,
	linked_field,
	linked_field_value,
) if {
	field_match.match_field_control_criteria(
		criteria,
		STUDY_TEMPLATE_VERSION,
		STUDY_CATEGORY,
		STUDY_CREATED_AT,
		isa_file_type,
		template_name,
		linked_field,
		linked_field_value,
	)
}

get_investigation_field_validation(controls, field_name) := rule if {
	control_list := controls[field_name]
	selected_controls := [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria,
			STUDY_TEMPLATE_VERSION,
			STUDY_CATEGORY,
			STUDY_CREATED_AT,
			"investigation",
			null, null, null,
		)
	]
	count(selected_controls) > 0
	rule := selected_controls[0]
}

get_sample_field_validation(controls, field_name) := rule if {
	control_list := controls[field_name]
	selected_controls := [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria,
			STUDY_TEMPLATE_VERSION,
			STUDY_CATEGORY,
			STUDY_CREATED_AT,
			"sample",
			STUDY_SAMPLE_TEMPLATE_NAME, null, null,
		)
	]
	count(selected_controls) > 0
	rule := selected_controls[0]
}

get_assay_field_validation(controls, field_name) := rule if {
	control_list := controls[field_name]
	selected_controls := [x |
		some x in control_list
		criteria = x.selectionCriteria
		field_match.match_field_control_criteria(
			criteria,
			STUDY_TEMPLATE_VERSION,
			STUDY_CATEGORY,
			STUDY_CREATED_AT,
			"sample",
			null, null, null,
		)
	]
	count(selected_controls) > 0
	rule := selected_controls[0]
}

__INVESTIGATION_RULES__ := data.metabolights.validation.v2.controls.investigationFileControls
__SAMPLE_RULES__ := data.metabolights.validation.v2.controls.sampleFileControls
__ASSAY_RULES__ := data.metabolights.validation.v2.controls.assayFileControls

RULE_PUBLICATION_STATUS := get_investigation_field_validation(__INVESTIGATION_RULES__, "Study Publication Status")
RULE_ASSAY_MEASUREMENT_TYPE := get_investigation_field_validation(__INVESTIGATION_RULES__, "Study Assay Measurement Type")
RULE_ASSAY_TECHNOLOGY_TYPE := get_investigation_field_validation(__INVESTIGATION_RULES__, "Study Assay Technology Type")
RULE_STUDY_PERSON_ROLES := get_investigation_field_validation(__INVESTIGATION_RULES__, "Study Person Roles")
RULE_STUDY_DESIGN_TYPE := get_investigation_field_validation(__INVESTIGATION_RULES__, "Study Design Type")
RULE_STUDY_FACTOR_TYPE := get_investigation_field_validation(__INVESTIGATION_RULES__, "Study Factor Type")

RULE_DEFAULT_ONTOLOGIES := get_investigation_field_validation(__INVESTIGATION_RULES__, "__default__")

RULE_SAMPLE_DEFAULT := get_sample_field_validation(__SAMPLE_RULES__, "__default__")
RULE_SAMPLE_DEFAULT_FACTOR_VALUE := get_sample_field_validation(__SAMPLE_RULES__, "__default_factor_value__")
RULE_SAMPLE_DEFAULT_CHARACTERISTIC := get_sample_field_validation(__SAMPLE_RULES__, "__default_characteristic__")

RULE_ASSAY_DEFAULT := get_sample_field_validation(__ASSAY_RULES__, "__default__")

DB_STUDY_CREATED_AT := input.studyDbMetadata.createdAt
METADATA_STUDY_CREATED_AT := input.investigation.studies[0].createdAt
STUDY_CREATED_AT := DB_STUDY_CREATED_AT if {
	count(DB_STUDY_CREATED_AT) > 0
}

STUDY_CREATED_AT := METADATA_STUDY_CREATED_AT if {
	count(DB_STUDY_CREATED_AT) == 0
	count(METADATA_STUDY_CREATED_AT) > 0
}

STUDY_CREATED_AT := result if {
	count(DB_STUDY_CREATED_AT) == 0
	count(METADATA_STUDY_CREATED_AT) == 0
	current_iso8601 := time.now_ns()
	result := time.format(current_iso8601)
}

DB_STUDY_TEMPLATE_VERSION := input.studyDbMetadata.templateVersion

METADATA_STUDY_TEMPLATE_VERSION := input.investigation.studies[0].templateVersion

STUDY_TEMPLATE_VERSION := DB_STUDY_TEMPLATE_VERSION if {
	count(DB_STUDY_TEMPLATE_VERSION) > 0
}

STUDY_TEMPLATE_VERSION := METADATA_STUDY_TEMPLATE_VERSION if {
	count(DB_STUDY_TEMPLATE_VERSION) == 0
	count(METADATA_STUDY_TEMPLATE_VERSION) > 0
}

STUDY_TEMPLATE_VERSION := data.metabolights.validation.v2.templates.configuration.defaultTemplateVersion if {
	count(DB_STUDY_TEMPLATE_VERSION) == 0

	count(METADATA_STUDY_TEMPLATE_VERSION) == 0
}

DEFAULT_STUDY_CATEGORIES := data.metabolights.validation.v2.templates.configuration.studyCategoryIndexMapping

DB_STUDY_CATEGORY := DEFAULT_STUDY_CATEGORIES[sprintf("%v", [input.studyDbMetadata.studyCategory])]

METADATA_STUDY_CATEGORY := input.investigation.studies[0].studyCategory

STUDY_CATEGORY := DB_STUDY_CATEGORY if {
	count(DB_STUDY_CATEGORY) > 0
}

STUDY_CATEGORY := METADATA_STUDY_CATEGORY if {
	count(DB_STUDY_CATEGORY) == 0
	count(METADATA_STUDY_CATEGORY) > 0
}

STUDY_CATEGORY := data.metabolights.validation.v2.templates.configuration.versions[STUDY_TEMPLATE_VERSION].defaultStudyCategory if {
	count(DB_STUDY_CATEGORY) == 0
	count(METADATA_STUDY_CATEGORY) == 0
}

DB_SAMPLE_TEMPLATE := input.studyDbMetadata.sampleTemplate

METADATA_SAMPLE_TEMPLATE := input.investigation.studies[0].sampleTemplate

STUDY_SAMPLE_TEMPLATE_NAME := DB_SAMPLE_TEMPLATE if {
	count(DB_SAMPLE_TEMPLATE) > 0
}

STUDY_SAMPLE_TEMPLATE_NAME := METADATA_SAMPLE_TEMPLATE if {
	count(DB_SAMPLE_TEMPLATE) == 0
	count(METADATA_SAMPLE_TEMPLATE) > 0
}

STUDY_SAMPLE_TEMPLATE_NAME := data.metabolights.validation.v2.templates.configuration.versions[STUDY_TEMPLATE_VERSION].defaultSampleTemplate if {
	count(DB_SAMPLE_TEMPLATE) == 0
	count(METADATA_SAMPLE_TEMPLATE) == 0
}

SELECTED_STUDY_SAMPLE_FILE_TEMPLATE := template if {
	some template_name, templates in data.metabolights.validation.v2.templates.sampleFileHeaderTemplates
	template_name == STUDY_SAMPLE_TEMPLATE_NAME

	some template in templates
	template.version == STUDY_TEMPLATE_VERSION
}

_DEFAULT_SAMPLE_FILE_HEADERS := {header.columnHeader: header |
	template := SELECTED_STUDY_SAMPLE_FILE_TEMPLATE
	some header in template.headers
}

SELECTED_STUDY_SAMPLE_FILE_TEMPLATE_HEADERS := [header |
	template := SELECTED_STUDY_SAMPLE_FILE_TEMPLATE
	some header in template.headers
]

_DEFAULT_ASSAY_HEADERS := {assay_file_name: assay_headers |
	some i, j
	assay_file_name := input.investigation.studies[i].studyAssays.assays[j].fileName
	technology := input.assays[assay_file_name].assayTechnique.name
	assay_headers := data.metabolights.validation.v2.templates.assayFileHeaderTemplates[technology]
}

_DEFAULT_ASSAY_HEADER_NAMES := {file_name: y |
	some file_name, headers_set in _DEFAULT_ASSAY_HEADERS
	some template in headers_set
	template.version == STUDY_TEMPLATE_VERSION
	header_names := [t.columnHeader | some t in template.headers]
	y := header_names
}

_DEFAULT_SAMPLE_HEADER_NAMES := {x.columnHeader | some x in _DEFAULT_SAMPLE_FILE_HEADERS}

_DEFAULT_STUDY_PROTOCOLS := {technology: protocol_names |
	technology := input.assays[j].assayTechnique.name
	protocol_names := [x.name | x := data.metabolights.validation.v2.templates.studyProtocolTemplates[technology].protocols[t]]
}

_ALL_STUDY_PROTOCOL_PARAMS := {technology: protocol_names |
	some technology, items in data.metabolights.validation.v2.templates.studyProtocolTemplates
	protocol_names := [x.name | x := items.protocols[t]]
}

_ALL_STUDY_PROTOCOLS := {protocol_name |
	some technology, items in data.metabolights.validation.v2.templates.studyProtocolTemplates
	some protocol in items.protocols
	protocol_name = protocol.name
}

_DEFAULT_MERGED_STUDY_PROTOCOLS := {x |
	x := _DEFAULT_STUDY_PROTOCOLS[_][_]
}

_DEFAULT_MERGED_STUDY_PROTOCOL_PARAMETERS := {protocol_name: parameters |
	technologies := {x |
		some j
		_DEFAULT_STUDY_PROTOCOLS[j]
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
	default_values := [header |
		some template in data.metabolights.validation.v2.templates.assayFileHeaderTemplates[assay_type]
		template.version == STUDY_TEMPLATE_VERSION
		some header in template.headers
		startswith(header.columnHeader, "Protocol REF")
	]
}

__ASSAY_PROTOCOL_HEADER_COLUMNS := {file_name: columns |
	some file_name, _ in input.assays
	columns := [header.columnIndex |
		some header in input.assays[file_name].table.headers
		header.columnHeader == "Protocol REF"
	]
}

__ASSAY_TECHNIQUES := {file_name: technology |
	some assay_name, _ in input.assays
	file_name := assay_name
	technology := input.assays[assay_name].assayTechnique.name
}
