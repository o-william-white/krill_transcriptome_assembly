rule cat_rev_reads:
    input:
        expand(
            "results/sortmerna/{sample}_unpaired_2.fastq",
            sample=sample_data.index.tolist(),
        ),
    output:
        "results/cat_reads/nonRNA_reads_rev.fastq",
    log:
        "logs/cat_rev_reads.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        cat {input} 1>{output} 2>{log}
        """
