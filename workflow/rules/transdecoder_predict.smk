rule transdecoder_predict:
    input:
        pep="results/transdecoder/longest_orfs.pep",
        fasta="results/trinity/trinity.Trinity.fasta",
        pfam="results/pfam/pfam.txt",
        blastp="results/diamond/blastp.txt",
    output:
        "results/transdecoder/trinity.Trinity.fasta.transdecoder.cds",
        "results/transdecoder/trinity.Trinity.fasta.transdecoder.pep",
        "results/transdecoder/trinity.Trinity.fasta.transdecoder.gff3"
    log:
        "logs/transdecoder_predict.log"
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
            -O results/transdecoder/ 2> {log} && \
        mv trinity.Trinity.fasta.transdecoder.*  results/transdecoder/
        """
