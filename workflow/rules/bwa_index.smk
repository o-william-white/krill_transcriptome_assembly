rule bwa_index:
    input:
        "results/trinity/trinity.Trinity.fasta",
    output:
        idx=multiext(
            "results/bwa_index/trinity.Trinity.fasta",
            ".amb",
            ".ann",
            ".bwt",
            ".pac",
            ".sa",
        ),
    log:
        "logs/bwa_index.log",
    wrapper:
        "v5.10.0/bio/bwa/index"
