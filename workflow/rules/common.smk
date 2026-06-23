import pandas as pd
import sys
import os


# set configfile
configfile: "config/config.yaml"


# read sample data
if os.path.exists(config["samples"]):
    sample_data = pd.read_csv(config["samples"]).set_index("run_id", drop=False)
else:
    sys.exit(f"Error: samples.csv file '{config['samples']}' does not exist")


# get fastq files
def get_fastq(wildcards):
    fwd = sample_data.loc[wildcards.sample, "forward"]
    rev = sample_data.loc[wildcards.sample, "reverse"]
    return [fwd, rev]


# Assembly output file paths derived from config assembly_prefix
_prefix = config["assembly_prefix"]
TRINITY_FASTA = f"results/trinity/trinity_{_prefix}.Trinity.fasta"
TRINITY_MAP = f"results/trinity/trinity_{_prefix}.Trinity.fasta.gene_trans_map"
TRANSDECODER_PEP = (
    f"results/transdecoder/trinity_{_prefix}.Trinity.fasta.transdecoder.pep"
)
TRANSDECODER_CDS = (
    f"results/transdecoder/trinity_{_prefix}.Trinity.fasta.transdecoder.cds"
)
TRANSDECODER_GFF3 = (
    f"results/transdecoder/trinity_{_prefix}.Trinity.fasta.transdecoder.gff3"
)
SEQKIT_SPLIT_FASTA = (
    f"results/seqkit_split/trinity_{_prefix}.Trinity.part_{{part}}.fasta"
)
