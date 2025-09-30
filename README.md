## METABOLIGHTS VALIDATION FRAMEWORK

MetaboLights validation framework is dynamic and based on [Open Policy Agent](https://www.openpolicyagent.org/) 

### Validation Rules and Default Metadata File Structure

| #  | SECTION | FILE TEMPLATES | VALIDATION RULES | DEFAULT FILE COLUMNS | PRIORITISED CONTROL LISTS|
|----|---------|----------------|------------------|----------------------|--------------------------|
| 1  | ALL | | [Validation Rules](docs/MetaboLightsRules.md) | - | - |
| 2  | INVESTIGATION FILE (i_Investigation.txt) |[i_Investigation.txt](docs/templates/investigation-file/i_Investigation.txt) | [Validation Rules](docs/validation-rules/investigation-validation-rules.md) | - | [Prioritised Control Lists](docs/prioritised-control-lists/investigation-file-control-lists/investigation-file.md) |
| 3  | SAMPLE FILE (s_REQxxx.txt or s_MTBLSxxx.txt) | [s_REQXXX.txt](docs/templates/sample-file/s_template.txt) | [Validation Rules](docs/validation-rules/sample-validation-rules.md) |[Default Sample File](docs/file-structures/sample-file-structure/2.0/sample-file.md) | [Characteristics & Factors](docs/prioritised-control-lists/sample-file-control-lists/sample-file.md), [Units](docs/prioritised-control-lists/unit-columns-control-lists/unit-columns.md) |
| 4  | ASSAY FILE (a_REQxxx.txt or a_MTBLSxxx.txt) | [LC-MS](docs/templates/assay-file/a_template_LC-MS-phase_metabolite_profiling.txt), [GC-MS](docs/templates/assay-file/a_template_GC-MS-phase_metabolite_profiling.txt), [GCxGC-MS](docs/templates/assay-file/a_template_GCxGC-phase_metabolite_profiling.txt), [DI-MS](docs/templates/assay-file/a_template_DI-MS-phase_metabolite_profiling.txt), [FIA-MS](docs/templates/assay-file/a_template_FIA-MS-phase_metabolite_profiling.txt), [LC-DAD](docs/templates/assay-file/a_template_LC-DAD-phase_metabolite_profiling.txt), [CE-MS](docs/templates/assay-file/a_template_CE-MS-phase_metabolite_profiling.txt), [MS Imaging](docs/templates/assay-file/a_template_MSImaging-phase_metabolite_profiling.txt), [GC-FID](docs/templates/assay-file/a_template_GC-FID-phase_metabolite_profiling.txt), [MALDI-MS](docs/templates/assay-file/a_template_MALDI-MS-phase_metabolite_profiling.txt), [MS](docs/templates/assay-file/a_template_MS-phase_metabolite_profiling.txt), [NMR](docs/templates/assay-file/a_template_NMR-phase_metabolite_profiling.txt), [MR Imaging](docs/templates/assay-file/a_template_MRImaging-phase_metabolite_profiling.txt) | [Validation Rules](docs/validation-rules/assay-validation-rules.md) | [LC-MS](docs/file-structures/assay-file-structure/2.0/lc-ms.md), [GC-MS](docs/file-structures/assay-file-structure/2.0/gc-ms.md), [GCxGC-MS](docs/file-structures/assay-file-structure/2.0/gcxgc-ms.md), [DI-MS](docs/file-structures/assay-file-structure/2.0/di-ms.md), [FIA-MS](docs/file-structures/assay-file-structure/2.0/fia-ms.md), [LC-DAD](docs/file-structures/assay-file-structure/2.0/lc-dad.md), [CE-MS](docs/file-structures/assay-file-structure/2.0/ce-ms.md), [MS Imaging](docs/file-structures/assay-file-structure/2.0/msimaging.md), [GC-FID](docs/file-structures/assay-file-structure/2.0/gc-fid.md), [MALDI-MS](docs/file-structures/assay-file-structure/2.0/maldi-ms.md), [MS](docs/file-structures/assay-file-structure/2.0/ms.md), [NMR](docs/file-structures/assay-file-structure/2.0/nmr.md), [MR Imaging](docs/file-structures/assay-file-structure/2.0/mrimaging.md) | [LC-MS](docs/prioritised-control-lists/assay-file-control-lists/lc-ms.md), [GC-MS](docs/prioritised-control-lists/assay-file-control-lists/gc-ms.md), [FIA-MS](docs/prioritised-control-lists/assay-file-control-lists/fia-ms.md), [DI-MS](docs/prioritised-control-lists/assay-file-control-lists/di-ms.md), [GCxGC-MS](docs/prioritised-control-lists/assay-file-control-lists/gcxgc-ms.md), [MALDI-MS](docs/prioritised-control-lists/assay-file-control-lists/maldi-ms.md), [MSImaging](docs/prioritised-control-lists/assay-file-control-lists/msimaging.md), [NMR](docs/prioritised-control-lists/assay-file-control-lists/nmr.md), [Units](docs/prioritised-control-lists/unit-columns-control-lists/unit-columns.md) |
| 5  | MAF FILE (m_REQxxx.tsv or a_MTBLSxxx.tsv) | [MAF file for MS Assays](docs/templates/maf-file/m_template_MS_metabolite_profiling_v2_maf.tsv), [MAF file for NMR Assays](docs/templates/maf-file/m_template_NMR_metabolite_profiling_v2_maf.tsv) | [Validation Rules](docs/validation-rules/metabolite-validation-rules.md) | [MAF File for MS Assays](docs/file-structures/maf-file-structure/2.0/ms.md), [MAF File for NMR Assays](docs/file-structures/maf-file-structure/2.0/nmr.md) |  | 
| 6  | DATA FILES | | [Validation Rules](docs/validation-rules/file-validation-rules.md) | | |


## Validate your study on local
Step 1:  Download opa executable from [here](https://www.openpolicyagent.org/docs/latest/#running-opa) 

Step 2: Create Validation Rule bundle
```
opa version

git pull https://github.com/EBI-Metabolights/mtbls-validation.git
cd validation
rm -f bundle.tar.gz
opa test . -v
opa build  --ignore tests --ignore input.json .
mv bundle.tar.gz ..
cd ..
```

Step 3: Install metabolights-utils (>1.4.0)
```
pip install --upgrade metabolights-utils --no-cache
# test mtbls commandline tool
mtbls --version
```

Step 4: Create metabolights json data model (input of validation) from local storage
```
# First argument is path of study folder, second argument is path of output file
mtbls model create tests/test-data/MTBLS1 -o ./MTBLS1.json
```

Step 5: Run validation:
```
# update input json file
opa eval --data bundle.tar.gz 'data.metabolights.validation.v2.report.complete_report.violations' -i ./MTBLS1.json
```

## Open Policy Agent Deployment 

### Development with vscode

- Install Open Policy Agent extension (tsandall.opa)