rule signalp6:
    input:
        "results/transdecoder/trinity.Trinity.fasta.transdecoder.pep",
    output:
        dir = directory("results/signalp6"),
        gff = "results/signalp6/output.gff3"
    params:
        signalp_env = config["signalp_env"]
    conda:
        "../envs/conda_env.yaml"
    log:
        "logs/signalp6.log"
    shell:
        """
        conda run -n {params.signalp_env} signalp6 \
            --fastafile {input} \
            --output_dir {output.dir} \
            --format none \
            --organism euk \
            --mode fast \
            --bsize 1000 \
            --write_procs {threads} \
            --torch_num_threads {threads} 2> {log}
        """
