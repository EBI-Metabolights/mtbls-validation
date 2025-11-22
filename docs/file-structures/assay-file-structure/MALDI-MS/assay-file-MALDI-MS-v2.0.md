# Maldi-ms Assay File Default Structure v2.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Sample Name | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#sample-name-column) | |
| 2 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#protocol-ref-column) | Extraction|
| 3 | Parameter Value[Post Extraction] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#parameter-valuepost-extraction-column) | |
| 4 | Parameter Value[Derivatization] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#parameter-valuederivatization-column) | |
| 5 | Extract Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#extract-name-column) | |
| 6 | Labeled Extract Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#labeled-extract-name-column) | |
| 7 | Label | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#label-column) | |
| 8 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#protocol-ref-column) | Mass spectrometry|
| 9 | Parameter Value[Scan polarity] | ontology column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#parameter-valuescan-polarity-column) | |
| 10 | Parameter Value[Scan m/z range] | single column and unit ontology | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#parameter-valuescan-m/z-range-column) | |
| 11 | Parameter Value[Instrument] | ontology column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#parameter-valueinstrument-column) | |
| 12 | Parameter Value[Ion source] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#parameter-valueion-source-column) | |
| 13 | Parameter Value[Mass analyzer] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#parameter-valuemass-analyzer-column) | |
| 14 | MS Assay Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#ms-assay-name-column) | |
| 15 | Raw Spectral Data File | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#raw-spectral-data-file-column) | |
| 16 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#protocol-ref-column) | Data transformation|
| 17 | Normalization Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#normalization-name-column) | |
| 18 | Derived Spectral Data File | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#derived-spectral-data-file-column) | |
| 19 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#protocol-ref-column) | Metabolite identification|
| 20 | Data Transformation Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#data-transformation-name-column) | |
| 21 | Metabolite Assignment File | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v2.0/assay-file-MALDI-MS-v2.0.md#metabolite-assignment-file-column) | |
