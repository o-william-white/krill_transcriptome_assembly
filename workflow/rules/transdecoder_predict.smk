rule transdecoder_predict:
    input:
        pep="results/transdecoder/longest_orfs.pep",
        fasta=TRINITY_FASTA,
        pfam="results/pfam/pfam.txt",
        blastp="results/diamond/blastp.txt",
    output:
        TRANSDECODER_CDS,
        TRANSDECODER_PEP,
        TRANSDECODER_GFF3,
    log:
        "logs/transdecoder_predict.log",
    conda:
        "../envs/transdecoder.yaml"
    shell:
        """
        # rm checkpoints if they already exist for a previous run
        rm -rf results/transdecoder/.__checkpoints
        # run predict
        TransDecoder.Predict \
            -t {input.fasta} \
            --retain_pfam_hits {input.pfam} \
            --retain_blastp_hits {input.blastp} \
            -O results/transdecoder/ 2>{log} \
            && mv trinity_{config[assembly_prefix]}.Trinity.fasta.transdecoder.* results/transdecoder/
        """
