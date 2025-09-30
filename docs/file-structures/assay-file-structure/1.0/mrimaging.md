# MRImaging Assay File Default Structure v1.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Sample Name | single column | False | - | - |  |  |  | |
| 2 | Protocol REF | single column | True | - | - |  |  |  | Magnetic resonance imaging|
| 3 | Parameter Value[Instrument] | single column | True | - | - |  |  |  | |
| 4 | Parameter Value[Tomography] | single column | True | - | - |  |  |  | |
| 5 | Parameter Value[Temperature] | single column and unit ontology | False | - | - |  |  |  | |
| 6 | Labeled Extract Name | single column | False | - | - |  |  |  | |
| 7 | Label | ontology column | False | - | - |  |  |  | |
| 8 | Protocol REF | single column | True | - | - |  |  |  | In vivo magnetic resonance spectroscopy|
| 9 | Parameter Value[Spatial resolution] | single column and unit ontology | False | - | - |  |  |  | |
| 10 | Parameter Value[Field of view] | single column and unit ontology | False | - | - |  |  |  | |
| 11 | Parameter Value[Matrix] | single column and unit ontology | False | - | - |  |  |  | |
| 12 | Parameter Value[Magnetic pulse sequence name] | single column | False | - | - |  |  |  | |
| 13 | Parameter Value[Voxel size] | single column and unit ontology | False | - | - |  |  |  | |
| 14 | Parameter Value[Localisation pulse sequence name] | single column | False | - | - |  |  |  | |
| 15 | Parameter Value[Number of transients] | single column | False | - | - |  |  |  | |
| 16 | Parameter Value[Water inhibition pulse sequence name] | single column | False | - | - |  |  |  | |
| 17 | Parameter Value[Magnetic field strength] | single column and unit ontology | False | - | - |  |  |  | |
| 18 | Acquisition Parameter Data File | single column | False | - | - |  |  |  | |
| 19 | Protocol REF | single column | True | - | - |  |  |  | In vivo magnetic resonance assay|
| 20 | NMR Assay Name | single column | False | - | - |  |  |  | |
| 21 | Free Induction Decay Data File | single column | False | - | - |  |  |  | |
| 22 | Protocol REF | single column | True | - | - |  |  |  | Data transformation|
| 23 | Normalization Name | single column | False | - | - |  |  |  | |
| 24 | Derived Spectral Data File | single column | False | - | - |  |  |  | |
| 25 | Protocol REF | single column | True | - | - |  |  |  | Metabolite identification|
| 26 | Data Transformation Name | single column | False | - | - |  |  |  | |
| 27 | Metabolite Assignment File | single column | False | - | - |  |  |  | |
