rule salmon_index:
    input:
        sequences="results/trinity/trinity.Trinity.fasta",
    output:
        multiext(
            "results/salmon_index/",
            "complete_ref_lens.bin",
            "ctable.bin",
            "ctg_offsets.bin",
            "duplicate_clusters.tsv",
            "info.json",
            "pre_indexing.log",
            "refAccumLengths.bin",
            "ref_indexing.log",
            "reflengths.bin",
            "refseq.bin",
            "sshash.bin",
            "versionInfo.json",
        ),
    log:
        "logs/salmon/salmon_index.log",
    params:
        # optional parameters
        extra="",
    wrapper:
        "v9.4.1/bio/salmon/index"