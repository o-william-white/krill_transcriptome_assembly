rule rfam_db:
    output:
        "resources/rfam_db/Rfam.cm",
        multiext(
            "resources/rfam_db/Rfam.cm",
            ".i1f",
            ".i1i",
            ".i1m",
            ".i1p",
        ),
        "resources/rfam_db/Rfam.clanin",
    log:
        "logs/rfam_db.log",
    conda:
        "../envs/infernal.yaml"
    shell:
        """
        wget --wait 10 --random-wait -P resources/rfam_db https://ftp.ebi.ac.uk/pub/databases/Rfam/CURRENT/Rfam.cm.gz &>{log}
        gunzip resources/rfam_db/Rfam.cm.gz &>>{log}
        cmpress resources/rfam_db/Rfam.cm &>>{log}
        wget --wait 10 --random-wait -P resources/rfam_db https://ftp.ebi.ac.uk/pub/databases/Rfam/CURRENT/Rfam.clanin &>>{log}
        """
