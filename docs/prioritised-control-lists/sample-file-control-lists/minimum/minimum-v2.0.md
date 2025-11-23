# minimum - Sample File Field Controls

## Common

| Attribute | Value |
|---|------|
| Rule Name | default\-sample\-file\-rule\-01 |
| Rule Description | default |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | ontology-term-in-selected-ontologies |
| Ontologies [Ordered] | OBI, EFO, CHMO, NCIT, NCBITAXON, MS, BTO, CHEBI, UO, MESH, BAO, OMIT, GO, ENVO, MSIO, PO, MONDO, UBERON, SNOMED, CL, CLO, MI, EDAM, HP, MP |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\], \[, \] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\], \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Unexpected Terms | unknown, undefined, n/a, na, not applicable, not available, none, null, nill, not specified, not provided, \-, \-\-, \-\-\-, \_, \. |
| Unexpected Term Enforcement Level | required |

## Factor Value \(Common\)

| Attribute | Value |
|---|------|
| Rule Name | default\-sample\-factor\_value\-rule\-01 |
| Rule Description | default |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | ontology-term-in-selected-ontologies |
| Ontologies [Ordered] | OBI, EFO, CHMO, NCIT, NCBITAXON, MS, BTO, CHEBI, UO, MESH, BAO, OMIT, GO, ENVO, MSIO, PO, MONDO, UBERON, SNOMED, CL, CLO, MI, EDAM, HP, MP |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\], \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |

## Characteristic \(Common\)

| Attribute | Value |
|---|------|
| Rule Name | default\-sample\-characteristic\-rule\-01 |
| Rule Description | default |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | ontology-term-in-selected-ontologies |
| Ontologies [Ordered] | OBI, EFO, CHMO, NCIT, NCBITAXON, MS, BTO, CHEBI, UO, MESH, BAO, OMIT, GO, ENVO, MSIO, PO, MONDO, UBERON, SNOMED, CL, CLO, MI, EDAM, HP, MP |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\] |
| Allowed Other Sources | \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |

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

## Source Name

| Attribute | Value |
|---|------|
| Rule Name | Source Name\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | check-only-constraints |
| Pattern | <code>^[a-zA-Z0-9][a-zA-Z0-9-_ ]+[a-zA-Z0-9]$</code> |
| Pattern Message | Value must be at least 3 characters and contain only alphanumeric characters, space, \- and \_ characters |
| Pattern Enforcement Level | recommended |

## Characteristics\[Organism\]

| Attribute | Value |
|---|------|
| Rule Name | Characteristics\[Organism\]\-01 |
| Rule Description |  |
| Applicable Study Categories | ms\-mhd\-enabled |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | ontology-term-in-selected-ontologies |
| Ontologies [Ordered] | NCBITAXON, ENVO |
| Allowed Other Sources | \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Unexpected Terms | cat, chicken, plant, sample, dog, mouse, horse, flower, fish, leave, root, mice, steam, bacteria, value, food, matrix, mus, rat, blood, urine, plasma, hair, fur, skin, saliva, fly, human, man, sheep |
| Unexpected Term Enforcement Level | required |
| Ontology Term Enforcement Level | required |

### Recommended Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | Homo sapiens | NCBITAXON | http://purl\.obolibrary\.org/obo/NCBITaxon\_9606 |
| 2 | Mus musculus | NCBITAXON | http://purl\.obolibrary\.org/obo/NCBITaxon\_10090 |
| 3 | Rattus norvegicus | NCBITAXON | http://purl\.obolibrary\.org/obo/NCBITaxon\_10116 |
| 4 | Arabidopsis thaliana | NCBITAXON | http://purl\.obolibrary\.org/obo/NCBITaxon\_3702 |
| 5 | Vitis vinifera | NCBITAXON | http://purl\.obolibrary\.org/obo/NCBITaxon\_29760 |
| 6 | Escherichia coli | NCBITAXON | http://purl\.obolibrary\.org/obo/NCBITaxon\_562 |
| 7 | Trypanosoma brucei | NCBITAXON | http://purl\.obolibrary\.org/obo/NCBITaxon\_5691 |
| 8 | sea water | ENVO | http://purl\.obolibrary\.org/obo/ENVO\_00002149 |

## Characteristics\[Organism part\]

| Attribute | Value |
|---|------|
| Rule Name | Characteristics\[Organism part\]\-01 |
| Rule Description |  |
| Applicable Study Categories | ms\-mhd\-enabled |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | ontology-term-in-selected-ontologies |
| Ontologies [Ordered] | UBERON, BTO, NCIT, MSIO |
| Allowed Other Sources | \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Ontology Term Enforcement Level | required |

### Recommended Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | blood plasma | BTO | http://purl\.obolibrary\.org/obo/BTO\_0000131 |
| 2 | blood serum | BTO | http://purl\.obolibrary\.org/obo/BTO\_0000133 |
| 3 | urine | BTO | http://purl\.obolibrary\.org/obo/BTO\_0001419 |
| 4 | feces | BTO | http://purl\.obolibrary\.org/obo/BTO\_0000440 |
| 5 | leaf | BTO | http://purl\.obolibrary\.org/obo/BTO\_0000713 |
| 6 | exocarp | BTO | http://purl\.obolibrary\.org/obo/BTO\_0000733 |
| 7 | Whole Organism | NCIT | http://purl\.obolibrary\.org/obo/NCIT\_C13413 |
| 8 | exometabolome | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_000131 |
| 9 | endometabolome | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_000125 |
| 10 | blank | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_002304 |

## Characteristics\[Sample type\]

| Attribute | Value |
|---|------|
| Rule Name | Characteristics\[Sample type\]\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | ontology-term-in-selected-ontologies |
| Ontologies [Ordered] | CHMO, MSIO, MTBLS |
| Ontology Term Enforcement Level | recommended |

### Recommended Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | experimental sample | CHMO | http://purl\.obolibrary\.org/obo/CHMO\_0002746 |
| 2 | pooled quality control sample | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_001090 |
| 3 | experimental blank | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_000218 |
| 4 | solvent blank | MSIO | http://purl\.obolibrary\.org/obo/MSIO\_0000026 |
| 5 | sample preparation blank | MSIO | http://purl\.obolibrary\.org/obo/MSIO\_0000025 |
| 6 | reference compound mix | MSIO | http://purl\.obolibrary\.org/obo/MSIO\_0000024 |

## Characteristics\[Cell type\]

| Attribute | Value |
|---|------|
| Rule Name | Characteristics\[Cell type\]\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | 2\.0 |
| Validation Type | ontology-term-in-selected-ontologies |
| Ontologies [Ordered] | CL, CLO |
| Allowed Other Sources | \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Allowed Missing Terms | \[Not Applicable, NCIT, http://purl\.obolibrary\.org/obo/NCIT\_C48660\] |

## Characteristics\[Disease\]

| Attribute | Value |
|---|------|
| Rule Name | Characteristics\[Disease\]\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | 2\.0 |
| Validation Type | ontology-term-in-selected-ontologies |
| Ontologies [Ordered] | MONDO, MP, SNOMED |
| Allowed Other Sources | \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Allowed Missing Terms | \[Not Applicable, NCIT, http://purl\.obolibrary\.org/obo/NCIT\_C48660\] |

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

