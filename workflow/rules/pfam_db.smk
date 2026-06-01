rule pfam_db:
    output:
        "resources/pfam_db/Pfam-A.hmm",
    log:
        "logs/pfam_db.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        wget --wait 10 --random-wait -P resources/pfam_db https://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.hmm.gz &> {log}
        gunzip resources/pfam_db/Pfam-A.hmm.gz &>> {log}
        """