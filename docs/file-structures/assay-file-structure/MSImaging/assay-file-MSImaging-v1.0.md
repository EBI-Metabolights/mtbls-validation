# MSImaging Assay File Default Structure v1.0

Download file template as [zip file](../../../template-files/assay-file/MSImaging/a_template-MSImaging-metabolite_profiling-v1.0.txt.zip) or [txt file](../../../template-files/assay-file/MSImaging/a_template-MSImaging-metabolite_profiling-v1.0.txt)

| Header  | Column Structure  | Constraints | <div style="width: 300px">Description</div> | <div style="width: 100px">Examples</div> |
|--------|-------------------|----------|-------------|----------
| Sample Name | single column | *Required*<br/>MinLength: 1<br/><br/>[Controls](../../../prioritised-control-lists/assay-file-control-lists/MSImaging/MSImaging-v1.0.md#sample-name){:target="_blank"} |  |  |
| Protocol REF | single column | *Required*<br/>Default: Preparation |  |  |
| Parameter Value[Sample mounting] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Sample preservation] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Tissue modification] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Sectioning instrument] | single column |  |  |  |
| Parameter Value[Section thickness] | single column and unit ontology |  |  |  |
| Parameter Value[Matrix] | single column |  |  |  |
| Parameter Value[Matrix application] | single column |  |  |  |
| Extract Name | single column |  |  |  |
| Labeled Extract Name | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Mass spectrometry |  |  |
| Parameter Value[Scan polarity] | single column | *Required*<br/>MinLength: 1<br/><br/>[Controls](../../../prioritised-control-lists/assay-file-control-lists/MSImaging/MSImaging-v1.0.md#parameter-valuescan-polarity){:target="_blank"} |  |  |
| Parameter Value[Scan m/z range] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Instrument] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Instrument manufacturer] | single column |  |  |  |
| Parameter Value[Ion source] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Mass analyzer] | single column | *Required*<br/>MinLength: 1<br/><br/>[Controls](../../../prioritised-control-lists/assay-file-control-lists/MSImaging/MSImaging-v1.0.md#parameter-valuemass-analyzer){:target="_blank"} |  |  |
| Parameter Value[Solvent] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Target material] | single column |  |  |  |
| Parameter Value[Spatial resolution] | single column and unit ontology |  |  |  |
| Parameter Value[Pixel size x] | single column and unit ontology |  |  |  |
| Parameter Value[Pixel size y] | single column and unit ontology |  |  |  |
| Parameter Value[Max count of pixel x] | single column |  |  |  |
| Parameter Value[Max count of pixel y] | single column |  |  |  |
| Parameter Value[Max dimension x] | single column and unit ontology |  |  |  |
| Parameter Value[Max dimension y] | single column and unit ontology |  |  |  |
| Parameter Value[Inlet type] | single column |  |  |  |
| Parameter Value[Detector] | single column |  |  |  |
| Parameter Value[Detector mode] | single column |  |  |  |
| Parameter Value[Resolving power] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Resolving power m/z] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Native spectrum identifier format] | single column |  |  |  |
| Parameter Value[Data file content] | single column |  |  |  |
| Parameter Value[Spectrum representation] | single column |  |  |  |
| Parameter Value[Raw data file format] | single column |  |  |  |
| Parameter Value[Instrument software] | single column |  |  |  |
| Parameter Value[Instrument software version] | single column |  |  |  |
| Parameter Value[Line scan direction] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Linescan sequence] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Scan pattern] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Scan type] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Number of scans] | single column |  |  |  |
| MS Assay Name | single column | [Controls](../../../prioritised-control-lists/assay-file-control-lists/MSImaging/MSImaging-v1.0.md#ms-assay-name){:target="_blank"} |  |  |
| Raw Spectral Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Histology |  |  |
| Parameter Value[Stain] | single column |  |  |  |
| Parameter Value[High-res image] | single column |  |  |  |
| Parameter Value[Low-res image] | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Data transformation |  |  |
| Normalization Name | single column |  |  |  |
| Derived Spectral Data File | single column |  |  |  |
| Parameter Value[Data Transformation software] | single column |  |  |  |
| Parameter Value[Data Transformation software version] | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Metabolite identification |  |  |
| Data Transformation Name | single column |  |  |  |
| Metabolite Assignment File | single column | *Required*<br/>MinLength: 1 |  |  |
