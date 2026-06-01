rule emapper:
    input:
        "resources/eggnog_db/eggnog.db",
        "resources/eggnog_db/eggnog_proteins.dmnd",
        "resources/eggnog_db/eggnog.taxa.db",
        pep="results/transdecoder/trinity.Trinity.fasta.transdecoder.pep",
    output:
        "results/eggnog/trinity.emapper.annotations",
    log:
        "logs/emapper.log",
    conda:
        "../envs/eggnog_mapper.yaml"
    shell:
        """
        emapper.py \
            -m diamond \
            --itype proteins \
            -i {input.pep} \
            --output_dir results/eggnog \
            -o trinity \
            --cpu {threads} \
            --override \
            --data_dir resources/eggnog_db &>{log}
        """
