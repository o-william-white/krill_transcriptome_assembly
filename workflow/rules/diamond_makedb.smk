rule diamond_makedb:
    input:
        fname="resources/swissprot_db/uniprot_sprot.fasta",
    output:
        fname="resources/swissprot_db/uniprot_sprot.dmnd",
    log:
        "logs/diamond/makedb.log",
    params:
        extra="",
    wrapper:
        "v9.8.0/bio/diamond/makedb"
