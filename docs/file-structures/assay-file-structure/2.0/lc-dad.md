# LC-DAD Assay File Default Structure v2.0

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
| 13 | Parameter Value[Signal range] | single column | False | - | - |  |  |  | |
| 14 | Parameter Value[Resolution] | single column | False | - | - |  |  |  | |
| 15 | Labeled Extract Name | single column | False | - | - |  |  |  | |
| 16 | Label | ontology column | False | - | - |  |  |  | |
| 17 | Raw Spectral Data File | single column | False | - | - |  |  |  | |
| 18 | Protocol REF | single column | True | - | - |  |  |  | Data transformation|
| 19 | Normalization Name | single column | False | - | - |  |  |  | |
| 20 | Derived Spectral Data File | single column | False | - | - |  |  |  | |
| 21 | Protocol REF | single column | True | - | - |  |  |  | Metabolite identification|
| 22 | Data Transformation Name | single column | False | - | - |  |  |  | |
| 23 | Metabolite Assignment File | single column | True | 1 | - |  |  |  | |
