rule seqkit_stats_transcripts:
    input:
        fastx=TRINITY_FASTA,
    output:
        stats="results/seqkit_transcripts/Transcript_stats_mqc.txt",
    log:
        "logs/seqkit_transcripts.log",
    params:
        command="stats",
        extra="--tabular --basename --all",
    wrapper:
        "v9.4.1/bio/seqkit"
