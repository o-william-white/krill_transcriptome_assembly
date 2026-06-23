import pandas as pd
import argparse

# argparse
parser = argparse.ArgumentParser(description="Reformat blastp results with taxonomy information.")
parser.add_argument("-i", "--input",   required=True, help="Input TSV file with blastp results.")
parser.add_argument("-a", "--acc2tax", required=True, help="Input CSV file with accession to taxid mapping.")
parser.add_argument("-o", "--output",  required=True, help="Output TSV file with taxonomy information.")
args = parser.parse_args()

# read blastp
blastp = pd.read_csv(args.input, header=None,
                     names=["qseqid", "sseqid", "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore"], sep="\t")

# read accession to taxid mapping
acc2tax = pd.read_csv(args.acc2tax, names=["sseqid", "taxid"], header=0)

# merge blastp with accession to taxid mapping
dat = pd.merge(blastp, acc2tax, on="sseqid", how="left")

# reorder columns from blastp and accession to taxid mapping
dat = dat[["qseqid", "taxid", "bitscore", "qseqid", "sseqid", "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore"]]

# write to file
dat.to_csv(args.output, sep="\t", index=False, header=False)