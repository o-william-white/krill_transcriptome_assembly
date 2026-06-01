rule busco:
    input:
        TRINITY_FASTA,
    output:
        short_json="results/busco/short_summary.json",
        short_txt="results/busco/short_summary.txt",
        full_table="results/busco/full_table.tsv",
        miss_list="results/busco/busco_missing.tsv",
        dataset_dir=directory("resources/busco_downloads"),
    log:
        "logs/busco.log",
    params:
        mode="transcriptome",
        lineage="arthropoda_odb10",
        # optional parameters
        extra="",
    wrapper:
        "v7.3.0/bio/busco"
