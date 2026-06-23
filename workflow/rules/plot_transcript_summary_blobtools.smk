rule plot_transcript_summary_blobtools:
    input:
        "results/blobtools/table.tsv",
    output:
        "results/blobtools/Blobtools_summary_mqc.png",
    log:
        "logs/plot_transcript_summary_blobtools.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        python \
            workflow/scripts/plot_transcript_summary_blobtools.py \
            --input {input} \
            --output {output}
        """
