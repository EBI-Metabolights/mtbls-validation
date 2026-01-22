# MRImaging Assay File Default Structure v1.0

Download file template as [zip file](../../../template-files/assay-file/MRImaging/a_template-MRImaging-metabolite_profiling-v1.0.txt.zip) or [txt file](../../../template-files/assay-file/MRImaging/a_template-MRImaging-metabolite_profiling-v1.0.txt)

| Header  | Column Structure  | Constraints | <div style="width: 300px">Description</div> | <div style="width: 100px">Examples</div> |
|--------|-------------------|----------|-------------|----------
| Sample Name | single column | [Controls](../../../prioritised-control-lists/assay-file-control-lists/MRImaging/MRImaging-v1.0.md#sample-name){:target="_blank"} |  |  |
| Protocol REF | single column | *Required*<br/>Default: Magnetic resonance imaging |  |  |
| Parameter Value[Instrument] | single column | *Required* |  |  |
| Parameter Value[Tomography] | single column | *Required* |  |  |
| Parameter Value[Temperature] | single column and unit ontology |  |  |  |
| Labeled Extract Name | single column |  |  |  |
| Label | ontology column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: In vivo magnetic resonance spectroscopy |  |  |
| Parameter Value[Spatial resolution] | single column and unit ontology |  |  |  |
| Parameter Value[Field of view] | single column and unit ontology |  |  |  |
| Parameter Value[Matrix] | single column and unit ontology |  |  |  |
| Parameter Value[Magnetic pulse sequence name] | single column |  |  |  |
| Parameter Value[Voxel size] | single column and unit ontology |  |  |  |
| Parameter Value[Localisation pulse sequence name] | single column |  |  |  |
| Parameter Value[Number of transients] | single column |  |  |  |
| Parameter Value[Water inhibition pulse sequence name] | single column |  |  |  |
| Parameter Value[Magnetic field strength] | single column and unit ontology |  |  |  |
| Acquisition Parameter Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: In vivo magnetic resonance assay |  |  |
| NMR Assay Name | single column | [Controls](../../../prioritised-control-lists/assay-file-control-lists/MRImaging/MRImaging-v1.0.md#nmr-assay-name){:target="_blank"} |  |  |
| Free Induction Decay Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Data transformation |  |  |
| Normalization Name | single column |  |  |  |
| Derived Spectral Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Metabolite identification |  |  |
| Data Transformation Name | single column |  |  |  |
| Metabolite Assignment File | single column |  |  |  |
