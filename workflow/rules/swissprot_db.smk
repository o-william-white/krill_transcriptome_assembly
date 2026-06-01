rule swissprot_db:
    output:
        "resources/swissprot_db/uniprot_sprot.fasta",
    log:
        "logs/swissprot_db.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        wget --wait 10 --random-wait -P resources/swissprot_db https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz &> {log}
        gunzip resources/swissprot_db/uniprot_sprot.fasta.gz &>> {log}
        """