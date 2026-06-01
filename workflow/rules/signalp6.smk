rule signalp6:
    input:
        TRANSDECODER_PEP,
    output:
        dir=directory("results/signalp6"),
        gff="results/signalp6/output.gff3",
    log:
        "logs/signalp6.log",
    conda:
        "../envs/conda_env.yaml"
    params:
        signalp_env=config["signalp_env"],
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
            --torch_num_threads {threads} 2>{log}
        """
