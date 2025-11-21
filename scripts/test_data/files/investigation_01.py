from metabolights_utils.models.isa import investigation_file as inv
from scripts.test_data.files.sample_01 import sample_file


investigation_file = inv.Investigation(
    ontology_source_references=inv.OntologySourceReferences(
        references=[
            inv.OntologySourceReference(
                source_name="CHMO",
                source_description="Chemical Methods Ontology",
                source_file="http://purl.obolibrary.org/obo/chmo/releases/2025-10-21/chmo.owl",
                source_version="2025-10-21",
            ),
            inv.OntologySourceReference(
                source_name="EFO",
                source_description="Experimental Factor Ontology",
                source_file="http://www.ebi.ac.uk/efo/efo.owl",
                source_version="2018-09-08",
            ),
            inv.OntologySourceReference(
                source_name="MI",
                source_description="Molecular Interactions Controlled Vocabulary",
                source_file=" http://purl.obolibrary.org/obo/mi.owl",
                source_version="2.5.5",
            ),
            inv.OntologySourceReference(
                source_name="MS",
                source_description="PSI-MS controlled vocabulary",
                source_file="http://purl.obolibrary.org/obo/ms/4.1.213/ms.owl",
                source_version="4.1.213",
            ),
            inv.OntologySourceReference(
                source_name="MSIO",
                source_description="Metabolomics Standards Initiative Ontology (MSIO)",
                source_file="http://purl.obolibrary.org/obo/msio.owl",
                source_version="1.0.1",
            ),
            inv.OntologySourceReference(
                source_name="NCIT",
                source_description="NCI Thesaurus OBO Edition",
                source_file="http://purl.obolibrary.org/obo/ncit/releases/2025-08-06/ncit.owl",
                source_version="2025-08-06",
            ),
            inv.OntologySourceReference(
                source_name="OBI",
                source_description="Ontology for Biomedical Investigations",
                source_file="http://purl.obolibrary.org/obo/obi.owl",
                source_version="2024-06-10",
            ),
        ]
    ),
    studies=[
        inv.Study(
            identifier="REQ2025111188888",
            title="MetaboLights Test Study Minimum 01",
            description="MetaboLights Test Study Minimum 01 Description",
            submission_date="2025-10-10",
            public_release_date="2025-11-11",
            file_name=sample_file.file_path,
            study_category="other",
            sample_template="minimum",
            mhd_model_version="0.1",
            dataset_license="CC0 1.0 Universal",
            funders=[
                inv.Funder(
                    funder_id="https://ror.org/029chgv08",
                    funder_name="Wellcome Trust",
                    grant_ids=["grant001"],
                )
            ],
            study_design_descriptors=inv.StudyDesignDescriptors(
                design_types=[
                    inv.ExtendedOntologyAnnotation(
                        term="tandem mass spectrometry",
                        term_source_ref="EFO",
                        term_accession_number="http://www.ebi.ac.uk/efo/EFO_0030056",
                    ),
                    inv.ExtendedOntologyAnnotation(
                        term="untargeted metabolite profiling"
                    ),
                ]
            ),
            study_factors=inv.StudyFactors(
                factors=[
                    inv.Factor(
                        name="Disease",
                        type=inv.OntologyAnnotation(
                            term="disease",
                            term_source_ref="EFO",
                            term_accession_number="http://www.ebi.ac.uk/efo/EFO_0000408",
                        ),
                    ),
                    inv.Factor(name="Dose", type=inv.OntologyAnnotation(term="dose")),
                ]
            ),
            study_publications=inv.StudyPublications(
                publications=[
                    inv.Publication(
                        title="Metabolights Test Study Minimum 1",
                        author_list="MetaboLights User 1",
                        doi="10.0001/abc101",
                        pub_med_id="123456",
                        status=inv.OntologyAnnotation(
                            term="published",
                            term_source_ref="EFO",
                            term_accession_number="http://www.ebi.ac.uk/efo/EFO_0001796",
                        ),
                    ),
                    inv.Publication(
                        title="Metabolights Test Study Minimum 1 In preperation",
                        author_list="MetaboLights User 1",
                        status=inv.OntologyAnnotation(
                            term="in preparation",
                            term_source_ref="EFO",
                            term_accession_number="http://www.ebi.ac.uk/efo/EFO_0001795",
                        ),
                    ),
                ]
            ),
            study_contacts=inv.StudyContacts(
                people=[
                    inv.Person(
                        last_name="Test User Last Name",
                        first_name="Test User First Name",
                        email="metabolights@ebi.ac.uk",
                        affiliation="European Bioinformatics Institute",
                        orcid="1234-1234-1234-1234",
                        roles=[
                            inv.OntologyAnnotation(
                                term="Principal Investigator",
                                term_source_ref="NCIT",
                                term_accession_number="http://purl.obolibrary.org/obo/NCIT_C19924",
                            )
                        ],
                    )
                ]
            ),
            study_protocols=inv.StudyProtocols(
                protocols=[
                    inv.Protocol(
                        name="Sample collection",
                        description="Sample collection - Species: Homo sapiens. Organism parts: blood",
                        protocol_type=inv.OntologyAnnotation(
                            term="sample collection protocol",
                            term_source_ref="EFO",
                            term_accession_number="http://www.ebi.ac.uk/efo/EFO_0005518",
                        ),
                    ),
                    inv.Protocol(
                        name="Extraction",
                        description="Sample collection - Species: Homo sapiens. Organism parts: blood",
                        protocol_type=inv.OntologyAnnotation(
                            term="sample preparation",
                            term_source_ref="MS",
                            term_accession_number="http://purl.obolibrary.org/obo/MS_1000831",
                        ),
                        parameters=[
                            inv.ParameterDefinition(term="Post Extraction"),
                            inv.ParameterDefinition(term="Derivatization"),
                        ],
                    ),
                    inv.Protocol(
                        name="Mass spectrometry",
                        description="Mass spectrometry protocol description with details.",
                        protocol_type=inv.OntologyAnnotation(
                            term="mass spectrometry",
                            term_source_ref="CHMO",
                            term_accession_number="http://purl.obolibrary.org/obo/CHMO_0000470",
                        ),
                        parameters=[
                            inv.ParameterDefinition(term="Scan polarity"),
                            inv.ParameterDefinition(term="Scan m/z range"),
                            inv.ParameterDefinition(term="Instrument"),
                            inv.ParameterDefinition(term="Ion source"),
                            inv.ParameterDefinition(term="Mass analyzer"),
                        ],
                    ),
                    inv.Protocol(
                        name="Data transformation",
                        description="Data transformation protocol description with details.",
                        protocol_type=inv.OntologyAnnotation(
                            term="data transformation",
                            term_source_ref="OBI",
                            term_accession_number="http://purl.obolibrary.org/obo/OBI_0200000",
                        ),
                    ),
                    inv.Protocol(
                        name="Metabolite identification",
                        description="Metabolite identification protocol description with details.",
                        protocol_type=inv.OntologyAnnotation(
                            term="metabolite identification",
                            term_source_ref="MI",
                            term_accession_number="http://purl.obolibrary.org/obo/MI_2131",
                        ),
                    ),
                ]
            ),
            study_assays=inv.StudyAssays(
                assays=[
                    inv.Assay(
                        assay_identifier="REQ2025111188888-01",
                        file_name="a_REQ2025111188888-01_MS_metabolite_profiling.txt",
                        assay_type=inv.OntologyAnnotation(
                            term="mass spectrometry assay",
                            term_source_ref="OBI",
                            term_accession_number="http://purl.obolibrary.org/obo/OBI_0000470",
                        ),
                        technology_type=inv.OntologyAnnotation(
                            term="mass spectrometry assay",
                            term_source_ref="OBI",
                            term_accession_number="http://purl.obolibrary.org/obo/OBI_0000470",
                        ),
                        measurement_type=inv.OntologyAnnotation(
                            term="untargeted metabolite profiling",
                            term_source_ref="MSIO",
                            term_accession_number="http://purl.obolibrary.org/obo/MSIO_0000101",
                        ),
                        omics_type=inv.OntologyAnnotation(
                            term="Lipidomics",
                            term_source_ref="EDAM",
                            term_accession_number="http://edamontology.org/topic_0153",
                        ),
                        technology_platform="Mass spectrometry",
                    )
                ]
            ),
        )
    ],
)
