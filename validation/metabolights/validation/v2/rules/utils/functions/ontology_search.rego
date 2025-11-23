package metabolights.validation.v2.utils.functions

import rego.v1

get_table_ontologies(meta, files) := result if {
	result := {{
		"identifier": meta.custom.rule_id,
		"title": meta.title,
		"description": meta.description,
		"type": meta.custom.type,
		"priority": meta.custom.priority,
		"section": meta.custom.section,
		"sourceFile": filename,
		"sourceColumnIndex": header.columnIndex,
		"sourceColumnHeader": header.columnHeader,
		"values": values,
		"hasMoreViolations": false,
		"totalViolations": count(values),
		"violation": msg,
	} |
		some filename, table_file in input.assays

		some header in table_file.table.headers

		header.columnStructure == "ONTOLOGY_COLUMN"
		column_name = header.columnName

		source_ref_name = table_file.table.columns[header.columnIndex + 1]
		accession_name = table_file.table.columns[header.columnIndex + 2]
		values := {sprintf("[%v, %v, %v]", [x, y, z]) |
			some idx, x in table_file.table.data[column_name]
			y := table_file.table.data[source_ref_name][idx]
			z := table_file.table.data[accession_name][idx]
			count(z) > 0
			count(y) > 0
			count(x) > 0
		}
		count(values) > 0
		values_list = [x | some x in values]
		values_str := concat(",", values_list)
		msg := sprintf("Ontology terms defined in %v are not validated on ontology search services: %v", [header.columnHeader, values_str])
	}
}

get_table_unit_ontologies(meta, files) := result if {
	result := {{
		"identifier": meta.custom.rule_id,
		"title": meta.title,
		"description": meta.description,
		"type": meta.custom.type,
		"priority": meta.custom.priority,
		"section": meta.custom.section,
		"sourceFile": filename,
		"sourceColumnIndex": header.columnIndex,
		"sourceColumnHeader": header.columnHeader,
		"values": values,
		"hasMoreViolations": false,
		"totalViolations": count(values),
		"violation": msg,
	} |
		some filename, table_file in input.assays

		some header in table_file.table.headers

		header.columnStructure == "SINGLE_COLUMN_AND_UNIT_COLUMN"

		column_name = header.columnName
		print(column_name)
		unit_name = table_file.table.columns[header.columnIndex + 1]
		source_ref_name = table_file.table.columns[header.columnIndex + 2]
		accession_name = table_file.table.columns[header.columnIndex + 3]
		values := {sprintf("[%v, %v, %v]", [x, y, z]) |
			some idx, x in table_file.table.data[unit_name]
			y := table_file.table.data[source_ref_name][idx]
			z := table_file.table.data[accession_name][idx]
			count(z) > 0
			count(y) > 0
			count(x) > 0
		}
		count(values) > 0
		values_list = [x | some x in values]
		values_str := concat(",", values_list)
		msg := sprintf("Unit ontology terms defined in %v column are not validated on ontology search services: %v", [header.columnHeader, values_str])
	}
}
