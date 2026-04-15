# FIA-MS Assay File Default Structure v1.0

Download file template as [zip file](../../../template-files/assay-file/FIA-MS/a_template-FIA-MS-metabolite_profiling-v1.0.txt.zip) or [txt file](../../../template-files/assay-file/FIA-MS/a_template-FIA-MS-metabolite_profiling-v1.0.txt)

| Header  | Column Structure  | Constraints | <div style="width: 300px">Description</div> | <div style="width: 100px">Examples</div> |
|--------|-------------------|----------|-------------|----------
| Sample Name | single column | *Required*<br/>MinLength: 1<br/><br/>[Controls](../../../prioritised-control-lists/assay-file-control-lists/FIA-MS/FIA-MS-v1.0.md#sample-name){:target="_blank"} |  |  |
| Protocol REF | single column | *Required*<br/>Default: Extraction |  |  |
| Parameter Value[Post Extraction] | single column |  |  |  |
| Parameter Value[Derivatization] | single column |  |  |  |
| Extract Name | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Flow Injection Analysis |  |  |
| Parameter Value[FIA Instrument] | ontology column | *Required*<br/>MinLength: 5 |  |  |
| Labeled Extract Name | single column |  |  |  |
| Label | ontology column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Mass spectrometry |  |  |
| Parameter Value[Scan polarity] | single column | *Required*<br/>MinLength: 1<br/><br/>[Controls](../../../prioritised-control-lists/assay-file-control-lists/FIA-MS/FIA-MS-v1.0.md#parameter-valuescan-polarity){:target="_blank"} |  |  |
| Parameter Value[Scan m/z range] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Instrument] | ontology column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Ion source] | ontology column |  |  |  |
| Parameter Value[Mass analyzer] | ontology column | [Controls](../../../prioritised-control-lists/assay-file-control-lists/FIA-MS/FIA-MS-v1.0.md#parameter-valuemass-analyzer){:target="_blank"} |  |  |
| MS Assay Name | single column | [Controls](../../../prioritised-control-lists/assay-file-control-lists/FIA-MS/FIA-MS-v1.0.md#ms-assay-name){:target="_blank"} |  |  |
| Raw Spectral Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Data transformation |  |  |
| Normalization Name | single column |  |  |  |
| Derived Spectral Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Metabolite identification |  |  |
| Data Transformation Name | single column |  |  |  |
| Metabolite Assignment File | single column | *Required*<br/>MinLength: 1 |  |  |
