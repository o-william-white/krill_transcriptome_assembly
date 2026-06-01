rule diamond_blastp:
    input:
        fname_fasta="results/transdecoder/longest_orfs.pep",
        fname_db="resources/swissprot_db/uniprot_sprot.dmnd",
    output:
        fname="results/diamond/blastp.txt",
    log:
        "logs/diamond/blastp.log",
    params:
        extra="-f 6 -k 1",  # Additional arguments
    wrapper:
        "v9.8.0/bio/diamond/blastp"