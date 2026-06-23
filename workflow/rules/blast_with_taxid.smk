rule blast_with_taxid:
    input:
        blast="results/diamond/blastx.txt",
        acc2tax="resources/swissprot_db/accession_to_taxid.csv",
    output:
        blast="results/diamond/blastx_taxid.txt",
    log:
        "logs/blast_with_taxid.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        python workflow/scripts/blast_with_taxid.py \
            --input {input.blast} \
            --acc2tax {input.acc2tax} \
            --output {output.blast}
        """
