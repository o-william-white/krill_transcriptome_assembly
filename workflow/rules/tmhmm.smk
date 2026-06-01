rule tmhmm:
    input:
        pep="results/transdecoder/trinity.Trinity.fasta.transdecoder.pep",
    output:
        tmhmm_out="results/tmhmm/tmhmm.txt",
    log:
        "logs/tmhmm.log",
    conda:
        "../envs/conda_env.yaml"
    params:
        tmhmm_path=config["tmhmm_path"],
        tmhmm_bin=lambda wildcards: os.path.dirname(config["tmhmm_path"]),
    shell:
        """
        export PATH="{params.tmhmm_bin}:$PATH"
        {params.tmhmm_path} --short \
            <{input.pep} \
            >{output.tmhmm_out} 2>{log}
        """
