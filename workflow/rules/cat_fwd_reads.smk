rule cat_fwd_reads:
    input:
        expand(
            "results/sortmerna/{sample}_unpaired_1.fastq",
            sample=sample_data.index.tolist(),
        ),
    output:
        temp("results/cat_reads/nonRNA_reads_fwd.fastq"),
    log:
        "logs/cat_fwd_reads.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        cat {input} 1>{output} 2>{log}
        """
