# MSImaging - Assay File Field Controls

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

## Parameter Value\[Scan polarity\]

| Attribute | Value |
|---|------|
| Rule Name | Parameter Value\[Scan polarity\]\-01 |
| Rule Description |  |
| Applicable Study Categories | ms\-mhd\-enabled |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | selected-ontology-term |
| Ontologies [Ordered] | AFO |
| Ontology Term Enforcement Level | required |

### Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | negative ionization polarity | AFO | http://purl\.allotrope\.org/ontologies/quality\#AFQ\_0000150 |
| 2 | positive ionization polarity | AFO | http://purl\.allotrope\.org/ontologies/quality\#AFQ\_0000151 |
| 3 | alternating ionization polarity | AFO | http://purl\.allotrope\.org/ontologies/quality\#AFQ\_0000152 |

## Parameter Value\[Mass analyzer\]

| Attribute | Value |
|---|------|
| Rule Name | Parameter Value\[Mass analyzer\]\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | ontology-term-in-selected-ontologies |
| Ontologies [Ordered] | MS |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\], \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Ontology Term Enforcement Level | recommended |

### Recommended Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | orbitrap | MS | http://purl\.obolibrary\.org/obo/MS\_1000484 |
| 2 | triple quadrupole | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_000698 |
| 3 | quadrupole time\-of\-flight | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_000699 |
| 4 | time\-of\-flight | MS | http://purl\.obolibrary\.org/obo/MS\_1000084 |
| 5 | hybrid triple quadrupole\-linear ion trap | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_000695 |
| 6 | ion cyclotron resonance cell | CHMO | http://purl\.obolibrary\.org/obo/CHMO\_0000964 |
| 7 | ion trap | MS | http://purl\.obolibrary\.org/obo/MS\_1000264 |
| 8 | ion trap time\-of\-flight | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_000700 |
| 9 | linear quadrupole ion trap mass\-to\-charge analyser | CHMO | http://purl\.obolibrary\.org/obo/CHMO\_0000969 |
| 10 | quadrupole | MS | http://purl\.obolibrary\.org/obo/MS\_1000081 |
| 11 | quadrupole ion trap | MS | http://purl\.obolibrary\.org/obo/MS\_1000082 |

## MS Assay Name

| Attribute | Value |
|---|------|
| Rule Name | MS Assay Name\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | check-only-constraints |
| Pattern | <code>^[a-zA-Z0-9][a-zA-Z0-9-_ ]+[a-zA-Z0-9]$</code> |
| Pattern Message | Value must be at least 3 characters and contain only alphanumeric characters, space, \- and \_ characters |
| Pattern Enforcement Level | recommended |

