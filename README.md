
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

Change apptainer args for pwd bind path
See `workflow/profiles/config.yaml`

See scripts to run pipeline: 
```
run_transcriptome_assembly_Ecry.sh
```

Clean up files
```
rm -f pipeliner.*
rm -fr TMHMM_*
rm -fr sshash_tmp/
rm -fr emappertmp_dmdn_*
rm -fr .snakemake/
```

To do
- Write sormerna idx output to results dir rather than working dir.
- Change Trinity rule to automatically detect PWD for bind path.
- Set up generic config profile. 

