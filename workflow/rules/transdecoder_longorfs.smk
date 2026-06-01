rule transdecoder_longorfs:
    input:
        fasta=TRINITY_FASTA,
        map=TRINITY_MAP,
    output:
        "results/transdecoder/longest_orfs.cds",
        "results/transdecoder/longest_orfs.gff3",
        "results/transdecoder/longest_orfs.pep",
    log:
        "logs/transdecoder_longorfs.log",
    conda:
        "../envs/transdecoder.yaml"
    shell:
        """
        TransDecoder.LongOrfs \
            -t {input.fasta} \
            --gene_trans_map {input.map} \
            -O results/transdecoder/ 2>{log}
        """
