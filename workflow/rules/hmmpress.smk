rule hmmpress:
    input:
        "resources/pfam_db/Pfam-A.hmm"
    output:
        multiext("resources/pfam_db/Pfam-A.hmm", ".h3f", ".h3i", ".h3m", ".h3p")
    log:
        "logs/hmmpress.log"
    conda:
        "../envs/hmmer.yaml"
    shell:
        "hmmpress {input} 2> {log}"
