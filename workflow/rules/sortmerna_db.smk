rule sortmerna_db:
    output:
        "resources/sortmerna_db/smr_v4.3_default_db.fasta",
        "resources/sortmerna_db/smr_v4.3_fast_db.fasta",
        "resources/sortmerna_db/smr_v4.3_sensitive_db.fasta",
        "resources/sortmerna_db/smr_v4.3_sensitive_db_rfam_seeds.fasta",
    log:
        "logs/sortmerna_db.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        wget --wait 10 --random-wait -P resources/sortmerna_db https://github.com/biocore/sortmerna/releases/download/v4.3.4/database.tar.gz &> {log}
        tar xvzf resources/sortmerna_db/database.tar.gz --directory resources/sortmerna_db &>> {log}
        rm resources/sortmerna_db/database.tar.gz &>> {log}
        """