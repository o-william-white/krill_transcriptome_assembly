import pandas as pd
import re
import argparse

# argparse
parser = argparse.ArgumentParser(description="Extract swissProt accession to taxonomy ID mapping from fasta file.")
parser.add_argument("-i", "--input", required=True, help="Input FASTA file with sequence data.")
parser.add_argument("-o", "--output", required=True, help="Output CSV file for the accession to taxonomy ID mapping.")
args = parser.parse_args()

accession_to_taxid = {}
with open(args.input) as f:
    for line in f:
        if line.startswith(">"):
            acc = line.split(" ")[0][1:]  # first space separated value, removing the leading '>'
            ox = re.search(r"OX=(\d+)", line)
            if ox: # If the OX field is found, extract the taxid
                accession_to_taxid[acc] = ox.group(1) # group capture the "\d+" part of the regex, which is the taxid
            else:
                print(f"No OX field found for accession {acc} in line: {line.strip()}")

dat = pd.DataFrame.from_dict(accession_to_taxid, orient='index', columns=['taxid'])

dat.to_csv(args.output)