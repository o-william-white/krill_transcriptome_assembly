rule eggnog_db:
    output:
        "resources/eggnog_db/eggnog.db",
        "resources/eggnog_db/eggnog_proteins.dmnd",
        "resources/eggnog_db/eggnog.taxa.db",
    log:
        "logs/eggnog_db.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        # links broken in download_eggnog_data.py
        BASE_URL="http://eggnog6.embl.de/download/emapperdb-5.0.2"
        mkdir -p resources/eggnog_db

        wget -q $BASE_URL/eggnog.db.gz -O resources/eggnog_db/eggnog.db.gz \
            && gunzip resources/eggnog_db/eggnog.db.gz &>{log}

        wget -q $BASE_URL/eggnog_proteins.dmnd.gz -O resources/eggnog_db/eggnog_proteins.dmnd.gz \
            && gunzip resources/eggnog_db/eggnog_proteins.dmnd.gz &>>{log}

        wget -q $BASE_URL/eggnog.taxa.tar.gz -O resources/eggnog_db/eggnog.taxa.tar.gz \
            && tar -zxf resources/eggnog_db/eggnog.taxa.tar.gz -C resources/eggnog_db \
            && rm resources/eggnog_db/eggnog.taxa.tar.gz &>>{log}
        """
