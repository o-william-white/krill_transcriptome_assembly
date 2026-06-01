rule seqkit_stats:
    input:
        fastx=["results/cat_reads/nonRNA_reads_fwd.fastq",
               "results/cat_reads/nonRNA_reads_rev.fastq"]
    output:
        stats="results/cat_reads/seqkit_stats.tsv",
    log:
        "logs/seqkit_stats.log",
    params:
        command="stats",
        extra="--all --tabular",
    threads: 2
    wrapper:
        "v9.4.1/bio/seqkit"