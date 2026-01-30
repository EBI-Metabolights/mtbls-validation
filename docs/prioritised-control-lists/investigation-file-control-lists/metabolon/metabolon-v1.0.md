# metabolon - Investigation File Field Controls

## Common

| Attribute | Value |
|---|------|
| Rule Name | default\-investigation\-file\-rule\-01 |
| Rule Description | default |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | any-ontology-term |
| Recommended Ontologies [Ordered] | OBI, EFO, CHMO, NCIT, NCBITaxon, MS, BTO, CHEBI, UO, MESH, BAO, OMIT, GO, ENVO, MSIO, PO, MONDO, UBERON, SNOMED, CL, CLO, MI, EDAM, HP, MP |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\], \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Unexpected Terms | unknown, undefined, n/a, na, not applicable, not available, none, null, nill, not specified, not provided, \-, \-\-, \-\-\-, \_, \. |
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

## Study Protocol Type

| Attribute | Value |
|---|------|
| Rule Name | Study Protocol Type\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | ontology-term-in-selected-ontologies |
| Ontologies [Ordered] | EFO, NCIT, MTBLS, CHEBI, CHMO, MONDO, PRIDE, GO, MESH, MI, MS |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\], \[, \] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\] |
| Ontology Term Enforcement Level | recommended |

### Recommended Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | sample collection protocol | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0005518 |
| 2 | sample preparation | MS | http://purl\.obolibrary\.org/obo/MS\_1000831 |
| 3 | chromatography | CHMO | http://purl\.obolibrary\.org/obo/CHMO\_0001000 |
| 4 | mass spectrometry | CHMO | http://purl\.obolibrary\.org/obo/CHMO\_0000470 |
| 5 | data transformation | OBI | http://purl\.obolibrary\.org/obo/OBI\_0200000 |
| 6 | metabolite identification | MI | http://purl\.obolibrary\.org/obo/MI\_2131 |
| 7 | capillary electrophoresis | CHMO | http://purl\.obolibrary\.org/obo/CHMO\_0001024 |
| 8 | flow injection analysis | MS | http://purl\.obolibrary\.org/obo/MS\_1000058 |
| 9 | NMR sample | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_001110 |
| 10 | NMR spectroscopy | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_001111 |
| 11 | NMR assay | MTBLS | http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_001112 |

## Study Design Type

| Attribute | Value |
|---|------|
| Rule Name | Study Design Type\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | any-ontology-term |
| Recommended Ontologies [Ordered] | EFO, MSIO, NCIT, MTBLS, CHEBI, CHMO, MONDO, PRIDE, GO, MESH |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\], \[, \] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\], \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Ontology Term Enforcement Level | recommended |

### Recommended Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | targeted metabolite profiling | MSIO | http://purl\.obolibrary\.org/obo/MSIO\_0000100 |
| 2 | untargeted metabolite profiling | MSIO | http://purl\.obolibrary\.org/obo/MSIO\_0000101 |
| 3 | nuclear magnetic resonance spectroscopy | CHMO | http://purl\.obolibrary\.org/obo/CHMO\_0000591 |
| 4 | ultra\-performance liquid chromatography\-mass spectrometry | CHMO | http://purl\.obolibrary\.org/obo/CHMO\_0000715 |
| 5 | gas chromatography\-mass spectrometry | CHMO | http://purl\.obolibrary\.org/obo/CHMO\_0000497 |
| 6 | tandem mass spectrometry | CHMO | http://purl\.obolibrary\.org/obo/CHMO\_0000575 |
| 7 | Multi\-omics study | PRIDE | http://purl\.obolibrary\.org/obo/PRIDE\_0000461 |
| 8 | microbiome | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0004982 |
| 9 | Aging | NCIT | http://purl\.obolibrary\.org/obo/NCIT\_C16269 |
| 10 | cancer | MONDO | http://purl\.obolibrary\.org/obo/MONDO\_0004992 |

## Study Person Roles

| Attribute | Value |
|---|------|
| Rule Name | Study Person Roles\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | child-ontology-term |
| Ontologies [Ordered] | NCIT |
| Allowed Parent Ontology Terms | \[Personnel, NCIT, http://purl\.obolibrary\.org/obo/NCIT\_C60758\] |
| Ontology Term Enforcement Level | recommended |

### Recommended Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | Principal Investigator | NCIT | http://purl\.obolibrary\.org/obo/NCIT\_C19924 |
| 2 | Investigator | NCIT | http://purl\.obolibrary\.org/obo/NCIT\_C25936 |
| 3 | Author | NCIT | http://purl\.obolibrary\.org/obo/NCIT\_C42781 |

## Study Assay Measurement Type

| Attribute | Value |
|---|------|
| Rule Name | Study Assay Measurement Type\-01 |
| Rule Description |  |
| Applicable Study Categories | ms\-mhd\-enabled |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | selected-ontology-term |
| Ontology Term Enforcement Level | required |

### Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | targeted metabolite profiling | MSIO | http://purl\.obolibrary\.org/obo/MSIO\_0000100 |
| 2 | untargeted metabolite profiling | MSIO | http://purl\.obolibrary\.org/obo/MSIO\_0000101 |

## Study Protocol Components Type

| Attribute | Value |
|---|------|
| Rule Name | Study Protocol Components Type\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | any-ontology-term |
| Recommended Ontologies [Ordered] | EFO, NCIT, MTBLS, CHEBI, CHMO, MONDO, PRIDE, GO, MESH |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\], \[, \] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\], \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |

## Study Protocol Parameter Name

| Attribute | Value |
|---|------|
| Rule Name | Study Protocol Parameter Name\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | any-ontology-term |
| Recommended Ontologies [Ordered] | MS, EFO, NCIT, MTBLS, CHMO, MONDO, PRIDE, GO, MESH, MI |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\], \[, \] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\] |
| Ontology Term Enforcement Level | recommended |

### Recommended Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | Post Extraction |  |  |
| 2 | Derivatization |  |  |
| 3 | Chromatography Instrument |  |  |
| 4 | Autosampler model |  |  |
| 5 | Column model |  |  |
| 6 | Column type |  |  |
| 7 | Guard column |  |  |
| 8 | Scan polarity |  |  |
| 9 | Scan m/z range |  |  |
| 10 | Instrument |  |  |
| 11 | Ion source |  |  |
| 12 | Mass analyzer |  |  |
| 13 | DI Instrument |  |  |
| 14 | FIA Instrument |  |  |
| 15 | CE Instrument |  |  |
| 16 | SPE\-IMS Instrument |  |  |
| 17 | Cartridge type |  |  |
| 18 | Column model 1 |  |  |
| 19 | Column type 1 |  |  |
| 20 | Column model 2 |  |  |
| 21 | Column type 2 |  |  |
| 22 | Detector |  |  |
| 23 | Signal range |  |  |
| 24 | Resolution |  |  |
| 25 | Temperature |  |  |
| 26 | Sample mounting |  |  |
| 27 | Sample preservation |  |  |
| 28 | Tissue modification |  |  |
| 29 | Sectioning instrument |  |  |
| 30 | Section thickness |  |  |
| 31 | Matrix |  |  |
| 32 | Matrix application |  |  |
| 33 | Stain |  |  |
| 34 | High\-res image |  |  |
| 35 | Low\-res image |  |  |
| 36 | Data Transformation software |  |  |
| 37 | Data Transformation software version |  |  |
| 38 | Instrument manufacturer |  |  |
| 39 | Solvent |  |  |
| 40 | Target material |  |  |
| 41 | Spatial resolution |  |  |
| 42 | Pixel size x |  |  |
| 43 | Pixel size y |  |  |
| 44 | Max count of pixel x |  |  |
| 45 | Max count of pixel y |  |  |
| 46 | Max dimension x |  |  |
| 47 | Max dimension y |  |  |
| 48 | Inlet type |  |  |
| 49 | Detector mode |  |  |
| 50 | Resolving power |  |  |
| 51 | Resolving power m/z |  |  |
| 52 | Native spectrum identifier format |  |  |
| 53 | Data file content |  |  |
| 54 | Spectrum representation |  |  |
| 55 | Raw data file format |  |  |
| 56 | Instrument software |  |  |
| 57 | Instrument software version |  |  |
| 58 | Line scan direction |  |  |
| 59 | Linescan sequence |  |  |
| 60 | Scan pattern |  |  |
| 61 | Number of scans |  |  |
| 62 | Scan type |  |  |
| 63 | Tomography |  |  |
| 64 | Field of view |  |  |
| 65 | Magnetic pulse sequence name |  |  |
| 66 | Voxel size |  |  |
| 67 | Localisation pulse sequence name |  |  |
| 68 | Number of transients |  |  |
| 69 | Water inhibition pulse sequence name |  |  |
| 70 | Magnetic field strength |  |  |
| 71 | Extration Method |  |  |
| 72 | NMR tube type |  |  |
| 73 | Sample pH |  |  |
| 74 | NMR Probe |  |  |
| 75 | Pulse sequence name |  |  |

## Study Assay Technology Type

| Attribute | Value |
|---|------|
| Rule Name | Study Assay Technology Type\-01 |
| Rule Description |  |
| Applicable Study Categories | ms\-mhd\-enabled |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | selected-ontology-term |
| Ontology Term Enforcement Level | required |

### Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | mass spectrometry assay | OBI | http://purl\.obolibrary\.org/obo/OBI\_0000470 |

## Study Factor Type

| Attribute | Value |
|---|------|
| Rule Name | Study Factor Type\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | any-ontology-term |
| Recommended Ontologies [Ordered] | EFO, MTBLS, ENVO, MESH, CHEBI, CHMO, NCIT, PO |
| Allowed Placeholders | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/placeholder\], \[, \] |
| Allowed Other Sources | \[MTBLS, http://www\.ebi\.ac\.uk/metabolights/ontology/MTBLS\_\], \[wikidata, https://www\.wikidata\.org/wiki/\], \[ILX, http://uri\.interlex\.org/base/ilx\_\] |
| Ontology Term Enforcement Level | recommended |

### Recommended Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | disease | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0000408 |
| 2 | timepoint | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0000724 |
| 3 | treatment | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0000727 |
| 4 | genotype | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0000513 |
| 5 | age | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0000246 |
| 6 | diet | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0002755 |
| 7 | disease staging | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0000410 |
| 8 | exposure | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0000487 |
| 9 | biological replicate | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0002091 |
| 10 | technical replicate | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0002090 |
| 11 | Collection Date | NCIT | http://purl\.obolibrary\.org/obo/NCIT\_C81286 |

## Omics Type

| Attribute | Value |
|---|------|
| Rule Name | Omics Type\-01 |
| Rule Description |  |
| Applicable Study Categories | ms\-mhd\-enabled |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Validation Type | selected-ontology-term |
| Ontology Term Enforcement Level | required |

### Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | Metabolomics | EDAM | http://edamontology\.org/topic\_3172 |
| 2 | Lipidomics | EDAM | http://edamontology\.org/topic\_0153 |
| 3 | Exposomics |  |  |
| 4 | Fluxomics | EDAM | http://edamontology\.org/topic\_3955 |

## Study Publication Status

| Attribute | Value |
|---|------|
| Rule Name | Study Publication Status\-01 |
| Rule Description |  |
| Applicable Study Categories | All |
| Applicable Template Names | All |
| Applicable Template Versions | All |
| Applicable Only for The Studies | C, r, e, a, t, e, d,  , a, t,  , o, r,  , a, f, t, e, r, :,  , 2, 0, 2, 6, \\, \-, 0, 1, \\, \-, 0, 1, T, 0, 0, :, 0, 0, :, 0, 0 |
| Validation Type | selected-ontology-term |
| Ontology Term Enforcement Level | required |

### Terms

| # |Term  | Term Source  | Term Accession |
|---|------|--------------|----------------|
| 1 | published | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0001796 |
| 2 | submitted | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0001794 |
| 3 | in preparation | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0001795 |
| 4 | preprint | EFO | http://www\.ebi\.ac\.uk/efo/EFO\_0010558 |
| 5 | Learning material | EDAM | http://edamontology\.org/data\_3669 |

