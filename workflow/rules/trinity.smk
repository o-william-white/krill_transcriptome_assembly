rule trinity:
    input:
        fwd="results/bbnorm/normalised_fwd.fastq",
        rev="results/bbnorm/normalised_rev.fastq",
    output:
        directory("results/trinity"),
        fas="results/trinity/trinity.Trinity.fasta",
        map="results/trinity/trinity.Trinity.fasta.gene_trans_map",
    log:
        "logs/trinity.log",
    container:
        "docker://trinityrnaseq/trinityrnaseq:latest"
    shell:
        """
        Trinity \
            --max_memory 900G \
            --seqType fq \
            --left {input.fwd} \
            --right {input.rev} \
            --CPU {threads} \
            --no_normalize_reads \
            --full_cleanup \
            --bflyHeapSpaceMax 40G \
            --output results/trinity/trinity 2>{log}
        """
