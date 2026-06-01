rule pfam:
    input:
        fasta="results/transdecoder/longest_orfs.pep",
        hmm="resources/pfam_db/Pfam-A.hmm",
        db=multiext("resources/pfam_db/Pfam-A.hmm", ".h3f", ".h3i", ".h3m", ".h3p"),
    output:
        "results/pfam/pfam.txt",
    log:
        "logs/pfam.log",
    conda:
        "../envs/hmmer.yaml"
    threads: 16
    shell:
        """
        hmmsearch --cpu {threads} --domtblout {output} {input.hmm} {input.fasta} >/dev/null 2>{log}
        """
