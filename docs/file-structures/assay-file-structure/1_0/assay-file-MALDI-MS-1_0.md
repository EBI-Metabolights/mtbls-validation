# MALDI-MS Assay File Default Structure v1.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Sample Name | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#sample-name-column) | |
| 2 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#protocol-ref-column) | Extraction|
| 3 | Parameter Value[Post Extraction] | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#parameter-valuepost-extraction-column) | |
| 4 | Parameter Value[Derivatization] | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#parameter-valuederivatization-column) | |
| 5 | Extract Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#extract-name-column) | |
| 6 | Labeled Extract Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#labeled-extract-name-column) | |
| 7 | Label | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#label-column) | |
| 8 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#protocol-ref-column) | Mass spectrometry|
| 9 | Parameter Value[Scan polarity] | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#parameter-valuescan-polarity-column) | |
| 10 | Parameter Value[Scan m/z range] | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#parameter-valuescan-m/z-range-column) | |
| 11 | Parameter Value[Instrument] | ontology column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#parameter-valueinstrument-column) | |
| 12 | Parameter Value[Ion source] | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#parameter-valueion-source-column) | |
| 13 | Parameter Value[Mass analyzer] | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#parameter-valuemass-analyzer-column) | |
| 14 | MS Assay Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#ms-assay-name-column) | |
| 15 | Raw Spectral Data File | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#raw-spectral-data-file-column) | |
| 16 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#protocol-ref-column) | Data transformation|
| 17 | Normalization Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#normalization-name-column) | |
| 18 | Derived Spectral Data File | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#derived-spectral-data-file-column) | |
| 19 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#protocol-ref-column) | Metabolite identification|
| 20 | Data Transformation Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#data-transformation-name-column) | |
| 21 | Metabolite Assignment File | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/1_0/assay-file-MALDI-MS-1_0.md#metabolite-assignment-file-column) | |
