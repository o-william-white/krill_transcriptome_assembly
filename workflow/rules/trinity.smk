rule trinity:
    input:
        fwd="results/bbnorm/normalised_fwd.fastq",
        rev="results/bbnorm/normalised_rev.fastq",
    output:
        directory("results/trinity"),
        fas=TRINITY_FASTA,
        map=TRINITY_MAP,
    log:
        "logs/trinity.log",
    container:
        "docker://trinityrnaseq/trinityrnaseq:latest"
    params:
        prefix=config["assembly_prefix"],
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
            --output results/trinity/trinity_{params.prefix} 2>{log}
        """
