# DI-MS Assay File Default Structure v2.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Sample Name | single column | True | 1 | - |  |  |  | |
| 2 | Protocol REF | single column | True | - | - |  |  |  | Extraction|
| 3 | Parameter Value[Post Extraction] | single column | False | - | - |  |  |  | |
| 4 | Parameter Value[Derivatization] | single column | False | - | - |  |  |  | |
| 5 | Extract Name | single column | False | - | - |  |  |  | |
| 6 | Protocol REF | single column | True | - | - |  |  |  | Direct infusion|
| 7 | Parameter Value[DI Instrument] | ontology column | True | 5 | - |  |  |  | |
| 8 | Labeled Extract Name | single column | False | - | - |  |  |  | |
| 9 | Label | ontology column | False | - | - |  |  |  | |
| 10 | Protocol REF | single column | True | - | - |  |  |  | Mass spectrometry|
| 11 | Parameter Value[Scan polarity] | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-file-control-lists/di-ms.md#parameter-valuescan-polarity-column) | |
| 12 | Parameter Value[Scan m/z range] | single column | True | 1 | - |  |  |  | |
| 13 | Parameter Value[Instrument] | ontology column | True | 1 | - |  |  |  | |
| 14 | Parameter Value[Ion source] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-file-control-lists/di-ms.md#parameter-valueion-source-column) | |
| 15 | Parameter Value[Mass analyzer] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-file-control-lists/di-ms.md#parameter-valuemass-analyzer-column) | |
| 16 | MS Assay Name | single column | False | - | - |  |  |  | |
| 17 | Raw Spectral Data File | single column | False | - | - |  |  |  | |
| 18 | Protocol REF | single column | True | - | - |  |  |  | Data transformation|
| 19 | Normalization Name | single column | False | - | - |  |  |  | |
| 20 | Derived Spectral Data File | single column | False | - | - |  |  |  | |
| 21 | Protocol REF | single column | True | - | - |  |  |  | Metabolite identification|
| 22 | Data Transformation Name | single column | False | - | - |  |  |  | |
| 23 | Metabolite Assignment File | single column | True | 1 | - |  |  |  | |
