# minimum Sample File Default Structure v1.0

| # |Header  | Column Structure  | Required | Min Length | Max Length | Description | Examples | Controlled Terms| Default Value  |
|---|--------|-------------------|----------|------------|------------|-------------|----------|-----------------|----------------|
| 1 | Source Name | single column | True | 3 | 128 |  |  |  | |
| 2 | Characteristics[Organism] | ontology column | True | 5 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/sample-file-control-lists/sample-file.md#characteristicsorganism) | |
| 3 | Characteristics[Organism part] | ontology column | True | 3 | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/sample-file-control-lists/sample-file.md#characteristicsorganism-part) | |
| 4 | Characteristics[Variant] | ontology column | False | - | - |  |  |  | |
| 5 | Characteristics[Sample type] | ontology column | False | - | - |  |  | [Controlled Terms](../../../docs/prioritised-control-lists/sample-file-control-lists/sample-file.md#characteristicssample-type) | |
| 6 | Protocol REF | single column | True | 1 | - |  |  |  | Sample collection|
| 7 | Sample Name | single column | True | 3 | 128 |  |  |  | |
