NPARTS = 100
INFERNAL_PARTS = [f"{i:03d}" for i in range(1, NPARTS + 1)]


rule seqkit_split2_part:
    input:
        fasta = "results/trinity/trinity.Trinity.fasta",
    output:
        fasta=expand(
            "results/seqkit_split/trinity.Trinity.part_{part}.fasta",
            part=INFERNAL_PARTS
        ),
    log:
        "logs/seqkit_split.log",
    params:
        command="split2",
        extra=f"--by-part {NPARTS} --force --out-dir results/seqkit_split",
    wrapper:
        "v9.4.2/bio/seqkit"

rule infernal:
    input:
        multiext("resources/rfam_db/Rfam.cm",
            ".i1f",
            ".i1i",
            ".i1m",
            ".i1p",
        ),
        rfam = "resources/rfam_db/Rfam.cm",
        clanin = "resources/rfam_db/Rfam.clanin",
        fasta = "results/seqkit_split/trinity.Trinity.part_{part}.fasta"
    output:
        tbl = "results/infernal/infernal_tblout_{part}.txt"
    log:
        "logs/infernal/infernal_{part}.log"
    conda:
        "../envs/infernal.yaml"
    params:
        full_fasta = "results/trinity/trinity.Trinity.fasta"
    shell:
        """
        Z=$(ls -l {params.full_fasta} | awk '{{printf "%d", ($5/1e6)+0.5}}') && \
        cmscan \
            -Z $Z \
            --cut_ga \
            --rfam \
            --nohmmonly \
            --clanin {input.clanin} \
            --oskip \
            --fmt 2 \
            --cpu {threads} \
            --tblout {output.tbl} \
            {input.rfam} \
            {input.fasta} &>> {log}
        """

rule infernal_merge:
    input:
        tbl = expand(
            "results/infernal/infernal_tblout_{part}.txt",
            part=INFERNAL_PARTS
        )
    output:
        tbl = "results/infernal/infernal_tblout.txt"
    conda:
        "../envs/conda_env.yaml"
    log:
        "logs/infernal_merge.log"
    shell:
        """
        grep "^#" {input.tbl[0]} > {output.tbl}
        grep -h -v "^#" {input.tbl} >> {output.tbl} 2>> {log} || true
        """
