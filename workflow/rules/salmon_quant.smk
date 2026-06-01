rule salmon_quant_reads:
    input:
        # If you have multiple fastq files for a single sample (e.g. technical replicates)
        # use a list for r1 and r2.
        r1="results/bbnorm/normalised_fwd.fastq",
        r2="results/bbnorm/normalised_rev.fastq",
        index="result/salmon_index/",
    output:
        quant="results/salmon/quant.sf",
        lib="results/salmon/lib_format_counts.json",
    log:
        "logs/salmon/salmon_quant.log",
    params:
        # optional parameters
        libtype="A",
        extra="",
    threads: 2
    wrapper:
        "v9.4.0/bio/salmon/quant"