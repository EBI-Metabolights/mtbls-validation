| # |Header  | Column Structure  | Default Value  | Required | Min Length | Max Length | Controlled Terms |
|---|--------|-------------------|----------------|----------|------------|------------|------------------|
| 1 | Source Name | single column |  | True | 3 | 128 | |
| 2 | Characteristics[Organism] | ontology column |  | True | 5 | - | [Controlled Terms](../../../docs/prioritised-control-lists/sample-file-control-lists/sample-file.md#characteristicsorganism)|
| 3 | Characteristics[Organism part] | ontology column |  | True | 3 | - | [Controlled Terms](../../../docs/prioritised-control-lists/sample-file-control-lists/sample-file.md#characteristicsorganism-part)|
| 4 | Characteristics[Variant] | ontology column |  | False | - | - | |
| 5 | Characteristics[Sample type] | ontology column |  | False | - | - | [Controlled Terms](../../../docs/prioritised-control-lists/sample-file-control-lists/sample-file.md#characteristicssample-type)|
| 6 | Protocol REF | single column | Sample collection | True | 1 | - | |
| 7 | Sample Name | single column |  | True | 3 | 128 | |
