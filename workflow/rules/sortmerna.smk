rule sortmerna:
    input:
        ref=["resources/sortmerna_db/smr_v4.3_default_db.fasta"],
        reads=["results/fastp/{sample}_R1.fastq", "results/fastp/{sample}_R2.fastq"],
    output:
        aligned=["results/sortmerna/{sample}_aligned_1.fastq", "results/sortmerna/{sample}_aligned_2.fastq"],
        other=["results/sortmerna/{sample}_unpaired_1.fastq", "results/sortmerna/{sample}_unpaired_2.fastq"],
        stats="results/sortmerna/{sample}_sortmerna_stats.log",
    params:
        extra="--idx-dir idx --paired_in --out2",
    threads: 16
    resources:
        mem_mb=3072,  # amount of memory for building the index
    log:
        "logs/sortmerna/{sample}.log",
    wrapper:
        "v7.0.0/bio/sortmerna"
