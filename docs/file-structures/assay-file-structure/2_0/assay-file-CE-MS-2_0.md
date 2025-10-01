# CE-MS Assay File Default Structure v2.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Sample Name | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#sample-name-column) | |
| 2 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#protocol-ref-column) | Extraction|
| 3 | Parameter Value[Post Extraction] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#parameter-valuepost-extraction-column) | |
| 4 | Parameter Value[Derivatization] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#parameter-valuederivatization-column) | |
| 5 | Extract Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#extract-name-column) | |
| 6 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#protocol-ref-column) | Capillary Electrophoresis|
| 7 | Parameter Value[CE Instrument] | ontology column | True | 5 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#parameter-valuece-instrument-column) | |
| 8 | Parameter Value[Column model] | ontology column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#parameter-valuecolumn-model-column) | |
| 9 | Parameter Value[Column type] | ontology column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#parameter-valuecolumn-type-column) | |
| 10 | Labeled Extract Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#labeled-extract-name-column) | |
| 11 | Label | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#label-column) | |
| 12 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#protocol-ref-column) | Mass spectrometry|
| 13 | Parameter Value[Scan polarity] | ontology column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#parameter-valuescan-polarity-column) | |
| 14 | Parameter Value[Scan m/z range] | single column and unit ontology | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#parameter-valuescan-m/z-range-column) | |
| 15 | Parameter Value[Instrument] | ontology column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#parameter-valueinstrument-column) | |
| 16 | Parameter Value[Ion source] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#parameter-valueion-source-column) | |
| 17 | Parameter Value[Mass analyzer] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#parameter-valuemass-analyzer-column) | |
| 18 | MS Assay Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#ms-assay-name-column) | |
| 19 | Raw Spectral Data File | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#raw-spectral-data-file-column) | |
| 20 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#protocol-ref-column) | Data transformation|
| 21 | Normalization Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#normalization-name-column) | |
| 22 | Derived Spectral Data File | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#derived-spectral-data-file-column) | |
| 23 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#protocol-ref-column) | Metabolite identification|
| 24 | Data Transformation Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#data-transformation-name-column) | |
| 25 | Metabolite Assignment File | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-CE-MS-2_0.md#metabolite-assignment-file-column) | |
