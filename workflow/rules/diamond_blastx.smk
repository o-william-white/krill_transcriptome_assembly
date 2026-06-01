rule diamond_blastx:
    input:
        fname_fastq=TRINITY_FASTA,
        fname_db="resources/swissprot_db/uniprot_sprot.dmnd",
    output:
        fname="results/diamond/blastx.txt",
    log:
        "logs/diamond/blastx.log",
    params:
        extra="-f 6 -k 1",
    wrapper:
        "v9.8.0/bio/diamond/blastx"
