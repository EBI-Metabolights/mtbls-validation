# LC-DAD Assay File Default Structure v1.0

Download file template as [zip file](../../../template-files/assay-file/LC-DAD/a_template-LC-DAD-metabolite_profiling-v1.0.txt.zip) or [txt file](../../../template-files/assay-file/LC-DAD/a_template-LC-DAD-metabolite_profiling-v1.0.txt)

| Header  | Column Structure  | Constraints | <div style="width: 300px">Description</div> | <div style="width: 100px">Examples</div> |
|--------|-------------------|----------|-------------|----------
| Sample Name | single column | *Required*<br/>MinLength: 1<br/><br/>[Controls](../../../prioritised-control-lists/assay-file-control-lists/LC-DAD/LC-DAD-v1.0.md#sample-name){:target="_blank"} |  |  |
| Protocol REF | single column | *Required*<br/>Default: Extraction |  |  |
| Parameter Value[Post Extraction] | single column |  |  |  |
| Parameter Value[Derivatization] | single column |  |  |  |
| Extract Name | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Chromatography |  |  |
| Parameter Value[Chromatography Instrument] | ontology column | *Required*<br/>MinLength: 5 |  |  |
| Parameter Value[Autosampler model] | single column |  |  |  |
| Parameter Value[Column model] | single column | *Required*<br/>MinLength: 5 |  |  |
| Parameter Value[Column type] | single column | *Required*<br/>MinLength: 5 |  |  |
| Parameter Value[Guard column] | single column |  |  |  |
| Parameter Value[Detector] | single column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Signal range] | single column |  |  |  |
| Parameter Value[Resolution] | single column |  |  |  |
| Labeled Extract Name | single column |  |  |  |
| Label | ontology column |  |  |  |
| Raw Spectral Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Data transformation |  |  |
| Normalization Name | single column |  |  |  |
| Derived Spectral Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Metabolite identification |  |  |
| Data Transformation Name | single column |  |  |  |
| Metabolite Assignment File | single column | *Required*<br/>MinLength: 1 |  |  |
