# MS Assay File Default Structure v2.0

Download file template as [zip file](../../../template-files/assay-file/MS/a_template-MS-metabolite_profiling-v2.0.txt.zip) or [txt file](../../../template-files/assay-file/MS/a_template-MS-metabolite_profiling-v2.0.txt)

| Header  | Column Structure  | Constraints | <div style="width: 300px">Description</div> | <div style="width: 100px">Examples</div> |
|--------|-------------------|----------|-------------|----------
| Sample Name | single column | *Required*<br/>MinLength: 1<br/><br/>[Controls](../../../prioritised-control-lists/assay-file-control-lists/MS/MS-v2.0.md#sample-name){:target="_blank"} |  |  |
| Protocol REF | single column | *Required*<br/>Default: Extraction |  |  |
| Parameter Value[Post Extraction] | ontology column |  |  |  |
| Parameter Value[Derivatization] | ontology column |  |  |  |
| Extract Name | single column |  |  |  |
| Labeled Extract Name | single column |  |  |  |
| Label | ontology column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Mass spectrometry |  |  |
| Parameter Value[Scan polarity] | ontology column | *Required*<br/>MinLength: 1<br/><br/>[Controls](../../../prioritised-control-lists/assay-file-control-lists/MS/MS-v2.0.md#parameter-valuescan-polarity){:target="_blank"} |  |  |
| Parameter Value[Scan m/z range] | single column and unit ontology | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Instrument] | ontology column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Ion source] | ontology column |  | Where applicable to the instrument. | electron ionization |
| Parameter Value[Mass analyzer] | ontology column | [Controls](../../../prioritised-control-lists/assay-file-control-lists/MS/MS-v2.0.md#parameter-valuemass-analyzer){:target="_blank"} | The analyser/detector of the mass fragments generated during the assay. | quadrupole |
| MS Assay Name | single column | [Controls](../../../prioritised-control-lists/assay-file-control-lists/MS/MS-v2.0.md#ms-assay-name){:target="_blank"} |  |  |
| Raw Spectral Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Data transformation |  |  |
| Normalization Name | single column |  |  |  |
| Derived Spectral Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Metabolite identification |  |  |
| Data Transformation Name | single column |  |  |  |
| Metabolite Assignment File | single column | *Required*<br/>MinLength: 1 |  |  |
