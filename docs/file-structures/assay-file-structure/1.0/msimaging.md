# MSImaging Assay File Default Structure v1.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Sample Name | single column | True | 1 | - |  |  |  | |
| 2 | Protocol REF | single column | True | - | - |  |  |  | Preparation|
| 3 | Parameter Value[Sample mounting] | single column | True | 1 | - |  |  |  | |
| 4 | Parameter Value[Sample preservation] | single column | True | 1 | - |  |  |  | |
| 5 | Parameter Value[Tissue modification] | single column | True | 1 | - |  |  |  | |
| 6 | Parameter Value[Sectioning instrument] | single column | False | - | - |  |  |  | |
| 7 | Parameter Value[Section thickness] | single column and unit ontology | False | - | - |  |  |  | |
| 8 | Parameter Value[Matrix] | single column | False | - | - |  |  |  | |
| 9 | Parameter Value[Matrix application] | single column | False | - | - |  |  |  | |
| 10 | Extract Name | single column | False | - | - |  |  |  | |
| 11 | Labeled Extract Name | single column | False | - | - |  |  |  | |
| 12 | Protocol REF | single column | True | - | - |  |  |  | Mass spectrometry|
| 13 | Parameter Value[Scan polarity] | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-file-control-lists/msimaging.md#parameter-valuescan-polarity-column) | |
| 14 | Parameter Value[Scan m/z range] | single column | True | 1 | - |  |  |  | |
| 15 | Parameter Value[Instrument] | single column | True | 1 | - |  |  |  | |
| 16 | Parameter Value[Instrument manufacturer] | single column | False | - | - |  |  |  | |
| 17 | Parameter Value[Ion source] | single column | True | 1 | - |  |  |  | |
| 18 | Parameter Value[Mass analyzer] | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-file-control-lists/msimaging.md#parameter-valuemass-analyzer-column) | |
| 19 | Parameter Value[Solvent] | single column | True | 1 | - |  |  |  | |
| 20 | Parameter Value[Target material] | single column | False | - | - |  |  |  | |
| 21 | Parameter Value[Spatial resolution] | single column and unit ontology | False | - | - |  |  |  | |
| 22 | Parameter Value[Pixel size x] | single column and unit ontology | False | - | - |  |  |  | |
| 23 | Parameter Value[Pixel size y] | single column and unit ontology | False | - | - |  |  |  | |
| 24 | Parameter Value[Max count of pixel x] | single column | False | - | - |  |  |  | |
| 25 | Parameter Value[Max count of pixel y] | single column | False | - | - |  |  |  | |
| 26 | Parameter Value[Max dimension x] | single column and unit ontology | False | - | - |  |  |  | |
| 27 | Parameter Value[Max dimension y] | single column and unit ontology | False | - | - |  |  |  | |
| 28 | Parameter Value[Inlet type] | single column | False | - | - |  |  |  | |
| 29 | Parameter Value[Detector] | single column | False | - | - |  |  |  | |
| 30 | Parameter Value[Detector mode] | single column | False | - | - |  |  |  | |
| 31 | Parameter Value[Resolving power] | single column | True | 1 | - |  |  |  | |
| 32 | Parameter Value[Resolving power m/z] | single column | True | 1 | - |  |  |  | |
| 33 | Parameter Value[Native spectrum identifier format] | single column | False | - | - |  |  |  | |
| 34 | Parameter Value[Data file content] | single column | False | - | - |  |  |  | |
| 35 | Parameter Value[Spectrum representation] | single column | False | - | - |  |  |  | |
| 36 | Parameter Value[Raw data file format] | single column | False | - | - |  |  |  | |
| 37 | Parameter Value[Instrument software] | single column | False | - | - |  |  |  | |
| 38 | Parameter Value[Instrument software version] | single column | False | - | - |  |  |  | |
| 39 | Parameter Value[Line scan direction] | single column | True | 1 | - |  |  |  | |
| 40 | Parameter Value[Linescan sequence] | single column | True | 1 | - |  |  |  | |
| 41 | Parameter Value[Scan pattern] | single column | True | 1 | - |  |  |  | |
| 42 | Parameter Value[Scan type] | single column | True | 1 | - |  |  |  | |
| 43 | Parameter Value[Number of scans] | single column | False | - | - |  |  |  | |
| 44 | MS Assay Name | single column | False | - | - |  |  |  | |
| 45 | Raw Spectral Data File | single column | False | - | - |  |  |  | |
| 46 | Protocol REF | single column | True | - | - |  |  |  | Histology|
| 47 | Parameter Value[Stain] | single column | False | - | - |  |  |  | |
| 48 | Parameter Value[High-res image] | single column | False | - | - |  |  |  | |
| 49 | Parameter Value[Low-res image] | single column | False | - | - |  |  |  | |
| 50 | Protocol REF | single column | True | - | - |  |  |  | Data transformation|
| 51 | Normalization Name | single column | False | - | - |  |  |  | |
| 52 | Derived Spectral Data File | single column | False | - | - |  |  |  | |
| 53 | Parameter Value[Data Transformation software] | single column | False | - | - |  |  |  | |
| 54 | Parameter Value[Data Transformation software version] | single column | False | - | - |  |  |  | |
| 55 | Protocol REF | single column | True | - | - |  |  |  | Metabolite identification|
| 56 | Data Transformation Name | single column | False | - | - |  |  |  | |
| 57 | Metabolite Assignment File | single column | True | 1 | - |  |  |  | |
