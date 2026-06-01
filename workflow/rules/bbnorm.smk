rule bbnorm:
    input:
        fwd="results/cat_reads/nonRNA_reads_fwd.fastq",
        rev="results/cat_reads/nonRNA_reads_rev.fastq",
    output:
        fwd="results/bbnorm/normalised_fwd.fastq",
        rev="results/bbnorm/normalised_rev.fastq",
    log:
        "logs/bbnorm.log",
    conda:
        "../envs/bbtools.yaml"
    shell:
        """
        bbnorm.sh \
            in1={input.fwd} \
            in2={input.rev} \
            out1={output.fwd} \
            out2={output.rev} \
            target=50 \
            min=1 \
            threads={threads} \
            2>{log}
        """
