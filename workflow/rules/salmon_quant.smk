rule salmon_quant:
    input:
        # ensure salmon index file created
        multiext(
            "results/salmon_index/",
            "duplicate_clusters.tsv",
            "index.ctab",
            "index.ectab",
            "index.refinfo",
            "index.ssi",
            "index.ssi.mphf",
            "index.tct",
            "index.tdct",
            "info.json",
            "refseq.bin",
            "refseq_offsets.json",
        ),
        # If you have multiple fastq files for a single sample (e.g. technical replicates)
        # use a list for r1 and r2.
        r1="results/bbnorm/normalised_fwd.fastq",
        r2="results/bbnorm/normalised_rev.fastq",
        index="results/salmon_index/",
    output:
        quant="results/salmon/quant.sf",
        lib="results/salmon/lib_format_counts.json",
    log:
        "logs/salmon/salmon_quant.log",
    conda:
        "../envs/salmon.yaml"
    shell:
        """
        salmon quant \
            -i {input.index} \
            -l A \
            -1 {input.r1} \
            -2 {input.r2} \
            -p {threads} \
            -o results/salmon > {log} 2>&1
        """
