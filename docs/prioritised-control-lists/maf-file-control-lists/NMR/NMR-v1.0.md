# NMR - MAF File Field Controls

## Common

| Attribute | Value |
|---|------|
| Rule Name | default\-assignment\-file\-rule\-01 |
| Rule Description | default |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | any-ontology-term |
| Recommended Ontologies [Ordered] | CHEBI, EFO, CHMO |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\], \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Unexpected Terms | unknown, undefined, n/a, na, not applicable, not available, none, null, nill, not specified, not provided, \-, \-\-, \-\-\-, \_, \. |
| Unexpected Term Enforcement Level | required |

## Unit

| Attribute | Value |
|---|------|
| Rule Name | MAF\-Unit\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | child-ontology-term |
| Allowed Parent Ontology Terms | \[unit, UO, http://purl\.obolibrary\.org/obo/UO\_0000000\], \[unit, EFO, http://purl\.obolibrary\.org/obo/UO\_0000000\], \[Qualifier, NCIT, http://purl\.obolibrary\.org/obo/NCIT\_C41009\], \[Unit of Measure, NCIT, http://purl\.obolibrary\.org/obo/NCIT\_C25709\] |
| Allowed Parent Ontology Term Exceptions | ^\.\*unit$, ^\.\*Unit of\.\*$ |
| Allowed Other Sources | \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Ontology Term Enforcement Level | recommended |

### Recommended Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | kelvin | UO | http://purl\.obolibrary\.org/obo/UO\_0000012 |
| 2 | tesla | UO | http://purl\.obolibrary\.org/obo/UO\_0000228 |
| 3 | micrometer | UO | http://purl\.obolibrary\.org/obo/UO\_0000017 |
| 4 | millimolar | UO | http://purl\.obolibrary\.org/obo/UO\_0000063 |
| 5 | kilogram | UO | http://purl\.obolibrary\.org/obo/UO\_0000009 |
| 6 | milligram per day | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0004419 |
| 7 | day | UO | http://purl\.obolibrary\.org/obo/UO\_0000033 |
| 8 | hour | UO | http://purl\.obolibrary\.org/obo/UO\_0000032 |
| 9 | degree Fahrenheit | UO | http://purl\.obolibrary\.org/obo/UO\_0000195 |
| 10 | degree Celsius | UO | http://purl\.obolibrary\.org/obo/UO\_0000027 |

