rule trinotate_create_schema:
    """Create SQLite schema directly, bypassing --create and all database downloads."""
    output:
        db="results/trinotate/myTrinotate.sqlite",
    log:
        "logs/trinotate/trinotate_create.log",
    container:
        "docker://trinityrnaseq/trinotate:4.0.2"
    shell:
        """
        perl /usr/local/src/Trinotate/util/admin/util/init_Trinotate_sqlite_db.pl \
            --sqlite {output.db} 2>{log}
        """


rule trinotate_init:
    """Load transcripts and ORFs into the database."""
    input:
        db="results/trinotate/myTrinotate.sqlite",
        fasta=TRINITY_FASTA,
        gene_map=TRINITY_MAP,
        pep=TRANSDECODER_PEP,
    output:
        temp("__init.ok"),
    log:
        "logs/trinotate/trinotate_init.log",
    container:
        "docker://trinityrnaseq/trinotate:4.0.2"
    shell:
        """
        # overwrite any previous run
        rm -f __init.ok
        /usr/local/src/Trinotate/Trinotate \
            --db {input.db} \
            --init \
            --gene_trans_map {input.gene_map} \
            --transcript_fasta {input.fasta} \
            --transdecoder_pep {input.pep} 2>{log}
        """


rule trinotate_load_and_report:
    """Load all annotation data and generate report in one serial Trinotate call."""
    input:
        init="__init.ok",
        db="results/trinotate/myTrinotate.sqlite",
        blastp="results/diamond/blastp.txt",
        pfam="results/pfam/pfam.txt",
        signalp="results/signalp6/output.gff3",
        eggnog="results/eggnog/trinity.emapper.annotations",
        tmhmm="results/tmhmm/tmhmm.txt",
        blastx="results/diamond/blastx.txt",
        infernal="results/infernal/infernal_tblout.txt",
    output:
        "results/trinotate/trinotate_report.tsv",
    log:
        "logs/trinotate/trinotate_load_and_report.log",
    container:
        "docker://trinityrnaseq/trinotate:4.0.2"
    shell:
        """
        /usr/local/src/Trinotate/Trinotate \
            --db {input.db} \
            --LOAD_swissprot_blastp {input.blastp} \
            --LOAD_pfam {input.pfam} \
            --LOAD_signalp {input.signalp} \
            --LOAD_EggnogMapper {input.eggnog} \
            --LOAD_tmhmmv2 {input.tmhmm} \
            --LOAD_swissprot_blastx {input.blastx} \
            --LOAD_infernal {input.infernal} \
            2>{log}

        /usr/local/src/Trinotate/Trinotate \
            --db {input.db} \
            --report \
            >{output} 2>>{log}
        """
