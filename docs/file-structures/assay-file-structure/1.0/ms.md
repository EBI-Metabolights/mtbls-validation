# MS Assay File Default Structure v1.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Sample Name | single column | True | 1 | - |  |  |  | |
| 2 | Protocol REF | single column | True | - | - |  |  |  | Extraction|
| 3 | Parameter Value[Post Extraction] | single column | False | - | - |  |  |  | |
| 4 | Parameter Value[Derivatization] | single column | False | - | - |  |  |  | |
| 5 | Extract Name | single column | False | - | - |  |  |  | |
| 6 | Labeled Extract Name | single column | False | - | - |  |  |  | |
| 7 | Label | ontology column | False | - | - |  |  |  | |
| 8 | Protocol REF | single column | True | - | - |  |  |  | Mass spectrometry|
| 9 | Parameter Value[Scan polarity] | single column | True | 1 | - |  |  |  | |
| 10 | Parameter Value[Scan m/z range] | single column | True | 1 | - |  |  |  | |
| 11 | Parameter Value[Instrument] | ontology column | True | 1 | - |  |  |  | |
| 12 | Parameter Value[Ion source] | ontology column | False | - | - | Where applicable to the instrument. | electron ionization |  | |
| 13 | Parameter Value[Mass analyzer] | ontology column | False | - | - | The analyser/detector of the mass fragments generated during the assay. | quadrupole |  | |
| 14 | MS Assay Name | single column | False | - | - |  |  |  | |
| 15 | Raw Spectral Data File | single column | False | - | - |  |  |  | |
| 16 | Protocol REF | single column | True | - | - |  |  |  | Data transformation|
| 17 | Normalization Name | single column | False | - | - |  |  |  | |
| 18 | Derived Spectral Data File | single column | False | - | - |  |  |  | |
| 19 | Protocol REF | single column | True | - | - |  |  |  | Metabolite identification|
| 20 | Data Transformation Name | single column | False | - | - |  |  |  | |
| 21 | Metabolite Assignment File | single column | True | 1 | - |  |  |  | |
