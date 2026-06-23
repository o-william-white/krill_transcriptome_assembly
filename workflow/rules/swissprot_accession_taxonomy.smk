rule swissprot_accession_taxonomy:
    input:
        "resources/swissprot_db/uniprot_sprot.fasta",
    output:
        "resources/swissprot_db/accession_to_taxid.csv",
    log:
        "logs/swissprot_accession_taxonomy.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        python workflow/scripts/swissprot_accession_taxonomy.py --input {input} --output {output}
        """
