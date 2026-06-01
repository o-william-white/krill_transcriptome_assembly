
Conda env setup
```bash
conda env create -n rnaseq_transcriptome_env -f workflow/envs/conda_env.yaml

conda activate rnaseq_transcriptome_env
```
Dry run 
```bash 
snakemake --profile workflow/profiles/ --dry-run
```

Build rule graph 
```bash 
snakemake --profile workflow/profiles/ --rulegraph | dot -Tsvg > rulegraph.svg
```