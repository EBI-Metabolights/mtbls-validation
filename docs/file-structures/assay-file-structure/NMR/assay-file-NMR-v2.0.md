# NMR Assay File Default Structure v2.0

Download file template as [zip file](../../../template-files/assay-file/NMR/a_template-NMR-metabolite_profiling-v2.0.txt.zip) or [txt file](../../../template-files/assay-file/NMR/a_template-NMR-metabolite_profiling-v2.0.txt)

| Header  | Column Structure  | Constraints | <div style="width: 300px">Description</div> | <div style="width: 100px">Examples</div> |
|--------|-------------------|----------|-------------|----------
| Sample Name | single column | *Required*<br/>MinLength: 1<br/><br/>[Controls](../../../prioritised-control-lists/assay-file-control-lists/NMR/NMR-v2.0.md#sample-name){:target="_blank"} | A unique identifier from a particular source (a batch of samples can have a unique Sample name as identified in the Sample table). It’s usually associated with an output spectral data filename. | pas101220_104 |
| Protocol REF | single column | *Required*<br/>Default: Extraction | This is the column marking the start of data pertaining to *Extraction protocol*. The 'Extraction' term MUST be present in all rows of this column. | Extraction |
| Parameter Value[Extraction Method] | ontology column |  | This how a sample was extracted from its source material. | Methanol |
| Extract Name | single column |  | Leave blank if you don’t have one. |  |
| Protocol REF | single column | *Required*<br/>Default: NMR sample | This is the column marking the start of data pertaining to *NMR sample protocol*. The 'NMR sample' term MUST be present in all rows of this column. | NMR sample |
| Parameter Value[NMR tube type] | ontology column | *Required*<br/>MinLength: 1 | Size and type of tube. | standard 5 mm glass NMR tube (Wilmad, LabGlass, USA) |
| Parameter Value[Solvent] | ontology column | *Required*<br/>MinLength: 1 | Solvent used in the NMR sample. | D2O |
| Parameter Value[Sample pH] | single column and unit ontology | *Required*<br/>MinLength: 1 | Sample pH value. | 7 |
| Parameter Value[Temperature] | single column and unit ontology | *Required*<br/>MinLength: 1 | Sample Temperature value. Define the unit of the temperature value on the next column. | 298 Celsius |
| Labeled Extract Name | single column |  | Leave blank if you don’t have one. |  |
| Label | ontology column |  | If you used a chemical or biochemical marker in the sample such as a radioactive isotope of fluorescent dye which is bound to a material in order to make it detectable in an analytical instrument then enter it here. | hydrogen molecular entity |
| Protocol REF | single column | *Required*<br/>Default: NMR spectroscopy | This is the column marking the start of data pertaining to *NMR spectroscopy protocol*. The 'NMR spectroscopy' term MUST be present in all rows of this column. | NMR spectroscopy |
| Parameter Value[Instrument] | ontology column | *Required*<br/>MinLength: 1 | Add the full name of the instrument you used for the NMR study in this assay, including the model number and its operating frequency. | Varian Unity Inova 500 MHz spectrometer |
| Parameter Value[NMR Probe] | ontology column | *Required*<br/>MinLength: 1 | Add a full description including the name and type of probe used.This information can be found in the ‘Acquisition Parameter Data File’, ‘acqus.txt’ found within the Bruker raw data file structure, in the field marked ‘ $PROBHD= ’. | 5 mm CPTCI 1H-13C/15N/D Z-GRD |
| Parameter Value[Number of transients] | single column and unit ontology | *Required*<br/>MinLength: 1 | The number of scans acquired. This information can be found in the ‘Acquisition Parameter Data File’, ‘acqus.txt’ found within the Bruker raw data file structure, in the field marked ‘$NS=’. | 128 |
| Parameter Value[Pulse sequence name] | ontology column | *Required*<br/>MinLength: 1 | The pulse sequence program used with a short description.This information can be found in the ‘Acquisition Parameter Data File’, ‘acqus.txt’ found within the Bruker raw data file structure, in the field marked ‘ $PULPROG= ’ and in the file ‘pulseprogram.txt’. | 1D 1H with presaturation (presat) |
| Parameter Value[Magnetic field strength] | single column and unit ontology | *Required*<br/>MinLength: 1 | In Tesla (T). Unit will be defined in the next column. | 11.7 Tesla |
| Acquisition Parameter Data File | single column |  | These should contain the acquisition parameter data. In the Bruker raw data file structure, the file is called ‘acqus.txt’. | 17_QC1.zip<br/>acqus1.txt |
| Protocol REF | single column | *Required*<br/>Default: NMR assay | This is the column marking the start of data pertaining to *NMR assay protocol*. The 'NMR sample' term MUST be present in all rows of this column. | NMR assay |
| NMR Assay Name | single column | [Controls](../../../prioritised-control-lists/assay-file-control-lists/NMR/NMR-v2.0.md#nmr-assay-name){:target="_blank"} | This can be, but doesn’t have to be, the same as the ‘Sample Name’. | 17_QC1 |
| Free Induction Decay Data File | single column |  | This is where you should enter, either the folder or the zipped NMR raw files for each sample in this study. | 17_QC1.zip |
| Protocol REF | single column | Default: Data transformation | This is the column marking the start of data pertaining to *Data transformation protocol*. The 'Data transformation' term MUST be present in all rows of this column. | Data transformation |
| Normalization Name | single column |  | These should contain the normalization data files. | Total sum |
| Derived Spectral Data File | single column |  | If your data has been transformed into one of the open-source raw data formats e.g. JCAMP , nmrML , then add them here.Please add full path of the file in the cell. | 17_QC1.nmrML<br/>FILES/DERIVED_FILES/NMR/17_QC1.nmrML |
| Protocol REF | single column | *Required*<br/>Default: Metabolite identification | This is the column marking the start of data pertaining to *Metabolite identification protocol*. The 'Metabolite identification' term MUST be present in all rows of this column. | Metabolite identification |
| Data Transformation Name | single column |  | These should contain the data transformation files. |  |
| Metabolite Assignment File | single column | *Required*<br/>MinLength: 1 | A TSV file containing information about the metabolites investigated in the study. Information regarding database accession IDs , where in the spectra the metabolite is found and data pertaining to its abundance within the study samples should be in this file. | m_MTBLS1_NMR_spectroscopy_v2_maf.tsv |
