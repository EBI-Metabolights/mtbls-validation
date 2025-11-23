# GC-FID Assay File Default Structure v2.0

Download file template as [zip file](../../../template-files/assay-file/GC-FID/a_template-GC-FID-metabolite_profiling-v2.0.txt.zip) or [txt file](../../../template-files/assay-file/GC-FID/a_template-GC-FID-metabolite_profiling-v2.0.txt)

| Header  | Column Structure  | Constraints | <div style="width: 300px">Description</div> | <div style="width: 100px">Examples</div> |
|--------|-------------------|----------|-------------|----------
| Sample Name | single column | *Required*<br/>MinLength: 1<br/><br/>[Controls](../../../prioritised-control-lists/assay-file-control-lists/GC-FID/GC-FID-v2.0.md#sample-name){:target="_blank"} |  |  |
| Protocol REF | single column | *Required*<br/>Default: Extraction |  |  |
| Parameter Value[Post Extraction] | ontology column |  |  |  |
| Parameter Value[Derivatization] | ontology column |  |  |  |
| Extract Name | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Chromatography |  |  |
| Parameter Value[Chromatography Instrument] | ontology column | *Required*<br/>MinLength: 5 |  |  |
| Parameter Value[Autosampler model] | ontology column |  |  |  |
| Parameter Value[Column model] | ontology column | *Required*<br/>MinLength: 5 |  |  |
| Parameter Value[Column type] | ontology column | *Required*<br/>MinLength: 5 |  |  |
| Parameter Value[Guard column] | ontology column |  |  |  |
| Parameter Value[Detector] | ontology column | *Required*<br/>MinLength: 1 |  |  |
| Parameter Value[Temperature] | single column and unit ontology |  |  |  |
| Labeled Extract Name | single column |  |  |  |
| Label | ontology column |  |  |  |
| Raw Spectral Data File | single column |  |  |  |
| Protocol REF | single column | Default: Data transformation |  |  |
| Normalization Name | single column |  |  |  |
| Derived Spectral Data File | single column |  |  |  |
| Protocol REF | single column | *Required*<br/>Default: Metabolite identification |  |  |
| Data Transformation Name | single column |  |  |  |
| Metabolite Assignment File | single column | *Required*<br/>MinLength: 1 |  |  |
