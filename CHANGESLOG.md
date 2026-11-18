# METABOLIGHTS VALIDATION RULE UPDATES

## Validation Rule Versions

### 11/04/2025 -  v2.0.16

- Fix: rule_f_400_090_002_01. Empty values will filtered and a message will be created only for non empty rows.

### 07/04/2025 -  v2.0.16

- mzMLb file format is now accepted (rule_a_200_500_001_01) as a valid derived file format.

### 07/04/2025 -  v2.0.15

- New validation rule (rule_a_200_090_006_01) is introduced to check invalid terms for Parameter Value[\* Instrument] columns. Some invalid terms: undefined, N/A, not available, lc instrument, liquid chromatography. You can find blacklist terms on [invalid instrument terms](validation/metabolights/validation/v2/blackLists/assayColumns/Parameter%20Value[Instrument].json)

- rule_s_200_100_001_01 and rule_s_200_100_001_02 are removed and new validation rule (rule_s_200_090_007_01) is introduced to check invalid terms. Black list terms are defined for sample Characteristics[\*] columns. Some black list terms: undefined, N/A, not available. You can find blacklist terms on [invalid characteristic terms](validation/metabolights/validation/v2/blackLists/sampleColumns/Characteristics[Organism].json).
