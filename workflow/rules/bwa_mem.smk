rule bwa_mem:
    input:
        reads=[
            "results/bbnorm/normalised_fwd.fastq",
            "results/bbnorm/normalised_rev.fastq",
        ],
        idx=multiext(
            "results/bwa_index/trinity.Trinity.fasta",
            ".amb",
            ".ann",
            ".bwt",
            ".pac",
            ".sa",
        ),
    output:
        "results/bwa_mem/mapped.bam",
    log:
        "logs/bwa_mem.log",
    params:
        sorting="samtools",  # Can be 'none', 'samtools' or 'picard'.
        sort_order="coordinate",  # Can be 'queryname' or 'coordinate'.
    wrapper:
        "v9.4.2/bio/bwa/mem"
