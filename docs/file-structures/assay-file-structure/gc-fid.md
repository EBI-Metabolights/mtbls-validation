# GC-FID Assay File Default Structure

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
| 9 | Parameter Value[Column model] | single column | True | 5 | - |  |  |  | |
| 10 | Parameter Value[Column type] | single column | True | 5 | - |  |  |  | |
| 11 | Parameter Value[Guard column] | single column | False | - | - |  |  |  | |
| 12 | Parameter Value[Detector] | single column | True | 1 | - |  |  |  | |
| 13 | Parameter Value[Temperature] | single column and unit ontology | False | - | - |  |  |  | |
| 14 | Labeled Extract Name | single column | False | - | - |  |  |  | |
| 15 | Label | ontology column | False | - | - |  |  |  | |
| 16 | Raw Spectral Data File | single column | False | - | - |  |  |  | |
| 17 | Protocol REF | single column | False | - | - |  |  |  | Data transformation|
| 18 | Normalization Name | single column | False | - | - |  |  |  | |
| 19 | Derived Spectral Data File | single column | False | - | - |  |  |  | |
| 20 | Protocol REF | single column | True | - | - |  |  |  | Metabolite identification|
| 21 | Data Transformation Name | single column | False | - | - |  |  |  | |
| 22 | Metabolite Assignment File | single column | True | 1 | - |  |  |  | |
