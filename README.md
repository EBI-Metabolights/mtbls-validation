# METABOLIGHTS VALIDATION FRAMEWORK

MetaboLights validation framework is dynamic and based on [Open Policy Agent](https://www.openpolicyagent.org/)

You can find details on [MetaboLights Validation Framework Documentation](https://ebi-metabolights.github.io/mtbls-validation)

Download the latest MetaboLights Validation OPA bundle [as tar.gz](https://ebi-metabolights.github.io/mtbls-validation/bundle.tar.gz)

Download the latest validation rules  [as JSON](https://ebi-metabolights.github.io/mtbls-validation/json/all_rules.json)

Download the latest Controls [as JSON](https://ebi-metabolights.github.io/mtbls-validation/json/all_controls.json)

Download the latest Templates [as JSON](https://ebi-metabolights.github.io/mtbls-validation/json/all_templates.json)

## Validate Your Study on Local

Step 1:  Download requirements:

* OPA executable from [OPA Download Page](https://www.openpolicyagent.org/docs/latest/#running-opa)
* metabolights validation opa bundle from [MetaboLights Validation Framework Documentation Page](https://ebi-metabolights.github.io/mtbls-validation/bundle.tar.gz)
* (Optional) Test Data from [Github mtbls-validation repository](https://github.com/EBI-Metabolights/mtbls-validation)

```bash
opa version

git clone https://github.com/EBI-Metabolights/mtbls-validation
cd mtbls-validation

```

Step 2: Install metabolights-utils (>1.4.12)

```bash
pip install --upgrade metabolights-utils --no-cache
# test mtbls command line tool
mtbls --version
```

Step 3: Create metabolights json data model (input of validation) from local storage

```bash
# First argument is path of study folder, second argument is path of output file
# NOTE: data files must be stored on FILES subfolder
mtbls model create tests/test-data/MTBLS1 -o ./MTBLS1.json
```

Step 4: Run validation:

```bash

# validate input json file
# 
opa eval --data docs/bundle.tar.gz 'data.metabolights.validation.v2.report.complete_report.violations' -i ./MTBLS1.json
```

## Open Policy Agent Deployment

### Development with vscode

- Install Open Policy Agent extension (tsandall.opa)
