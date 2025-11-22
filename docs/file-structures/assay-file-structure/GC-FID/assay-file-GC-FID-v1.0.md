# Gc-fid Assay File Default Structure v1.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Sample Name | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#sample-name-column) | |
| 2 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#protocol-ref-column) | Extraction|
| 3 | Parameter Value[Post Extraction] | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#parameter-valuepost-extraction-column) | |
| 4 | Parameter Value[Derivatization] | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#parameter-valuederivatization-column) | |
| 5 | Extract Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#extract-name-column) | |
| 6 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#protocol-ref-column) | Chromatography|
| 7 | Parameter Value[Chromatography Instrument] | ontology column | True | 5 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#parameter-valuechromatography-instrument-column) | |
| 8 | Parameter Value[Autosampler model] | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#parameter-valueautosampler-model-column) | |
| 9 | Parameter Value[Column model] | single column | True | 5 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#parameter-valuecolumn-model-column) | |
| 10 | Parameter Value[Column type] | single column | True | 5 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#parameter-valuecolumn-type-column) | |
| 11 | Parameter Value[Guard column] | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#parameter-valueguard-column-column) | |
| 12 | Parameter Value[Detector] | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#parameter-valuedetector-column) | |
| 13 | Parameter Value[Temperature] | single column and unit ontology | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#parameter-valuetemperature-column) | |
| 14 | Labeled Extract Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#labeled-extract-name-column) | |
| 15 | Label | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#label-column) | |
| 16 | Raw Spectral Data File | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#raw-spectral-data-file-column) | |
| 17 | Protocol REF | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#protocol-ref-column) | Data transformation|
| 18 | Normalization Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#normalization-name-column) | |
| 19 | Derived Spectral Data File | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#derived-spectral-data-file-column) | |
| 20 | Protocol REF | single column | True | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#protocol-ref-column) | Metabolite identification|
| 21 | Data Transformation Name | single column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#data-transformation-name-column) | |
| 22 | Metabolite Assignment File | single column | True | 1 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/assay-control-lists/v1.0/assay-file-GC-FID-v1.0.md#metabolite-assignment-file-column) | |
