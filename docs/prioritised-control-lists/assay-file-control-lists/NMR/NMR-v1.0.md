# NMR - Assay File Field Controls

## Common

| Attribute | Value |
|---|------|
| Rule Name | default\-assay\-file\-rule\-01 |
| Rule Description | default |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | any-ontology-term |
| Recommended Ontologies [Ordered] | OBI, EFO, CHMO, NCIT, NCBITAXON, MS, BTO, CHEBI, UO, MESH, BAO, OMIT, GO, ENVO, MSIO, PO, MONDO, UBERON, SNOMED, CL, CLO, MI, EDAM, HP, MP |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\], \[, \] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\], \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Unexpected Terms | unknown, undefined, n/a, na, not applicable, not available, none, null, nill, not specified, not provided, \-, \-\-, \-\-\- |
| Unexpected Term Enforcement Level | required |

## Unit

| Attribute | Value |
|---|------|
| Rule Name | Unit\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | child-ontology-term |
| Allowed Parent Ontology Terms | \[unit, UO, http://purl\.obolibrary\.org/obo/UO\_0000000\], \[unit, EFO, http://purl\.obolibrary\.org/obo/UO\_0000000\], \[Qualifier, NCIT, http://purl\.obolibrary\.org/obo/NCIT\_C41009\], \[Unit of Measure, NCIT, http://purl\.obolibrary\.org/obo/NCIT\_C25709\] |
| Allowed Parent Ontology Term Exceptions | ^\.\*unit$, ^\.\*Unit of\.\*$ |
| Allowed Other Sources | \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Ontology Term Enforcement Level | recommended |

## Sample Name

| Attribute | Value |
|---|------|
| Rule Name | Sample Name\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | check-only-constraints |
| Pattern | <code>^[a-zA-Z0-9][a-zA-Z0-9-_ ]+[a-zA-Z0-9]$</code> |
| Pattern Message | Value must be at least 3 characters and contain only alphanumeric characters, space, \- and \_ characters |
| Pattern Enforcement Level | recommended |

## NMR Assay Name

| Attribute | Value |
|---|------|
| Rule Name | NMR Assay Name\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | check-only-constraints |
| Pattern | <code>^[a-zA-Z0-9][a-zA-Z0-9-_ ]+[a-zA-Z0-9]$</code> |
| Pattern Message | Value must be at least 3 characters and contain only alphanumeric characters, space, \- and \_ characters |
| Pattern Enforcement Level | recommended |

