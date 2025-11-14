# LC-DAD Assay File Default Structure v2.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Sample Name | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#sample-name-column) | |
| 2 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#protocol-ref-column) | Extraction|
| 3 | Parameter Value[Post Extraction] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#parameter-valuepost-extraction-column) | |
| 4 | Parameter Value[Derivatization] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#parameter-valuederivatization-column) | |
| 5 | Extract Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#extract-name-column) | |
| 6 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#protocol-ref-column) | Chromatography|
| 7 | Parameter Value[Chromatography Instrument] | ontology column | True | 5 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#parameter-valuechromatography-instrument-column) | |
| 8 | Parameter Value[Autosampler model] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#parameter-valueautosampler-model-column) | |
| 9 | Parameter Value[Column model] | ontology column | True | 5 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#parameter-valuecolumn-model-column) | |
| 10 | Parameter Value[Column type] | ontology column | True | 5 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#parameter-valuecolumn-type-column) | |
| 11 | Parameter Value[Guard column] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#parameter-valueguard-column-column) | |
| 12 | Parameter Value[Detector] | ontology column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#parameter-valuedetector-column) | |
| 13 | Parameter Value[Signal range] | single column and unit ontology | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#parameter-valuesignal-range-column) | |
| 14 | Parameter Value[Resolution] | single column and unit ontology | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#parameter-valueresolution-column) | |
| 15 | Labeled Extract Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#labeled-extract-name-column) | |
| 16 | Label | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#label-column) | |
| 17 | Raw Spectral Data File | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#raw-spectral-data-file-column) | |
| 18 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#protocol-ref-column) | Data transformation|
| 19 | Normalization Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#normalization-name-column) | |
| 20 | Derived Spectral Data File | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#derived-spectral-data-file-column) | |
| 21 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#protocol-ref-column) | Metabolite identification|
| 22 | Data Transformation Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#data-transformation-name-column) | |
| 23 | Metabolite Assignment File | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/2_0/assay-file-LC-DAD-2_0.md#metabolite-assignment-file-column) | |
