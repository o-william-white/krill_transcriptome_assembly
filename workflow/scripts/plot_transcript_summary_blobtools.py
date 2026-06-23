import pandas as pd
import matplotlib.pyplot as plt
import argparse

# argparse
parser = argparse.ArgumentParser(description="Plot summary of transcripts from blobtools output")
parser.add_argument("-i", "--input", required=True, help="Input TSV file.")
parser.add_argument("-o", "--output", required=True, help="Output image file for the plots.")
args = parser.parse_args()

# read blobtools output
dat = pd.read_csv(args.input, sep="\t")

# kingdom counts
vc_kingdom = dat["bestsumorder_kingdom"].value_counts()

# define 7 colour palette
pal = [ "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7" ]

# create a dictionary to map kingdom names to colors
dict_kingdom_colors =  {}

# give colour for top 7 kingdoms
# the remaining kingdoms will be assigned a default color (e.g., gray)
for i, kingdom in enumerate(vc_kingdom.index):
    if i < len(pal):
        dict_kingdom_colors[vc_kingdom.index[i]] = pal[i]
    else:
        dict_kingdom_colors[vc_kingdom.index[i]] = "#999999"

# map the colors to the dataframe
dat["colour"] = dat["bestsumorder_kingdom"].map(dict_kingdom_colors)

fig, axs = plt.subplots(nrows=2, ncols=2, figsize=(12, 8))
axs[0,0].hist(dat["length"], bins=30, color="gray", alpha=0.7)
axs[0,0].set_xlabel("Length")
axs[0,0].set_ylabel("Count")

axs[0,1].hist(dat["gc"], bins=30, color="gray", alpha=0.7)
axs[0,1].set_xlabel("GC Content")
axs[0,1].set_ylabel("Count")

for kingdom in vc_kingdom.index[:7]:  # only plot the top 7 kingdoms
    group = dat[dat["bestsumorder_kingdom"] == kingdom]
    axs[1,0].scatter(x=group["gc"], y=group["length"], c=group["colour"], label=kingdom, marker='o', alpha=0.5)
axs[1,0].legend(loc="upper left", fontsize="small", title="Top 7 Kingdoms")
axs[1,0].set_xlabel("GC Content")
axs[1,0].set_ylabel("Length")

axs[1,1].barh(vc_kingdom.index, vc_kingdom.values, color=[dict_kingdom_colors[k] for k in vc_kingdom.index])
axs[1,1].set_xlabel("Count")
axs[1,1].set_ylabel("Kingdom")

plt.tight_layout()

# save the figure
plt.savefig(args.output, dpi=300)
