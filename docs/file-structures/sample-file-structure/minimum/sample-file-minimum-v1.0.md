# minimum Sample File Default Structure v1.0

Download file template as [zip file](../../../template-files/sample-file/minimum/s_template-minimum-v1.0.txt.zip) or [txt file](../../../template-files/sample-file/minimum/s_template-minimum-v1.0.txt)

| Header  | Column Structure  | Constraints | <div style="width: 300px">Description</div> | <div style="width: 100px">Examples</div> |
|--------|-------------------|----------|-------------|----------
| Source Name | single column | *Required*<br/>MinLength: 3<br/>MaxLength: 128<br/><br/>[Controls](../../../prioritised-control-lists/sample-file-control-lists/minimum/minimum-v1.0.md#source-name){:target="_blank"} |  |  |
| Characteristics[Organism] | ontology column | *Required*<br/>MinLength: 5<br/><br/>[Controls](../../../prioritised-control-lists/sample-file-control-lists/minimum/minimum-v1.0.md#characteristicsorganism){:target="_blank"} |  |  |
| Characteristics[Organism part] | ontology column | *Required*<br/>MinLength: 3<br/><br/>[Controls](../../../prioritised-control-lists/sample-file-control-lists/minimum/minimum-v1.0.md#characteristicsorganism-part){:target="_blank"} |  |  |
| Characteristics[Variant] | ontology column |  |  |  |
| Characteristics[Sample type] | ontology column | [Controls](../../../prioritised-control-lists/sample-file-control-lists/minimum/minimum-v1.0.md#characteristicssample-type){:target="_blank"} |  |  |
| Protocol REF | single column | *Required*<br/>MinLength: 1<br/>Default: Sample collection |  |  |
| Sample Name | single column | *Required*<br/>MinLength: 3<br/>MaxLength: 128<br/><br/>[Controls](../../../prioritised-control-lists/sample-file-control-lists/minimum/minimum-v1.0.md#sample-name){:target="_blank"} |  |  |
