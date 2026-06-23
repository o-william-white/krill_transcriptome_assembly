rule salmon_index:
    input:
        sequences=TRINITY_FASTA,
    output:
        multiext(
            "results/salmon_index/",
            "duplicate_clusters.tsv",
            "index.ctab",
            "index.ectab",
            "index.refinfo",
            "index.ssi",
            "index.ssi.mphf",
            "info.json",
            "refseq.bin",
            "refseq_offsets.json",
        ),
        directory("results/salmon_index"),  # need to specifiy output direcotry here so it can be picked up by salmon quant
    log:
        "logs/salmon/salmon_index.log",
    conda:
        "../envs/salmon.yaml"
    shell:
        "salmon index -t {input.sequences} -i results/salmon_index > {log} 2>&1"
