rule salmon_quant:
    input:
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
    threads: 2
    params:
        # optional parameters
        libtype="A",
        extra="",
    wrapper:
        "v9.4.0/bio/salmon/quant"
