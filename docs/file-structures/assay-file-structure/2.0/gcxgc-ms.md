# GCxGC-MS Assay File Default Structure v2.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Sample Name | single column | True | 1 | - |  |  |  | |
| 2 | Protocol REF | single column | True | - | - |  |  |  | Extraction|
| 3 | Parameter Value[Post Extraction] | single column | False | - | - |  |  |  | |
| 4 | Parameter Value[Derivatization] | single column | False | - | - |  |  |  | |
| 5 | Extract Name | single column | False | - | - |  |  |  | |
| 6 | Protocol REF | single column | True | - | - |  |  |  | Chromatography|
| 7 | Parameter Value[Chromatography Instrument] | ontology column | True | 5 | - |  |  |  | |
| 8 | Parameter Value[Autosampler model] | single column | False | - | - |  |  |  | |
| 9 | Parameter Value[Column model 1] | single column | True | 5 | - |  |  |  | |
| 10 | Parameter Value[Column type 1] | single column | True | 5 | - |  |  |  | |
| 11 | Parameter Value[Guard column] | single column | False | - | - |  |  |  | |
| 12 | Parameter Value[Column model 2] | single column | True | 5 | - |  |  |  | |
| 13 | Parameter Value[Column type 2] | single column | True | 5 | - |  |  |  | |
| 14 | Labeled Extract Name | single column | False | - | - |  |  |  | |
| 15 | Label | ontology column | False | - | - |  |  |  | |
| 16 | Protocol REF | single column | True | - | - |  |  |  | Mass spectrometry|
| 17 | Parameter Value[Scan polarity] | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-file-control-lists/gcxgc-ms.md#parameter-valuescan-polarity-column) | |
| 18 | Parameter Value[Scan m/z range] | single column | True | 1 | - |  |  |  | |
| 19 | Parameter Value[Instrument] | ontology column | True | 1 | - |  |  |  | |
| 20 | Parameter Value[Ion source] | ontology column | False | - | - |  |  |  | |
| 21 | Parameter Value[Mass analyzer] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-file-control-lists/gcxgc-ms.md#parameter-valuemass-analyzer-column) | |
| 22 | MS Assay Name | single column | False | - | - |  |  |  | |
| 23 | Raw Spectral Data File | single column | False | - | - |  |  |  | |
| 24 | Protocol REF | single column | False | - | - |  |  |  | Data transformation|
| 25 | Normalization Name | single column | False | - | - |  |  |  | |
| 26 | Derived Spectral Data File | single column | False | - | - |  |  |  | |
| 27 | Protocol REF | single column | True | - | - |  |  |  | Metabolite identification|
| 28 | Data Transformation Name | single column | False | - | - |  |  |  | |
| 29 | Metabolite Assignment File | single column | True | 1 | - |  |  |  | |
