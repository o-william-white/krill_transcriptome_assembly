#!/bin/bash
#SBATCH --partition=long
#SBATCH --output=job_run_transcriptome_assembly_Esup_%j.out
#SBATCH --error=job_run_transcriptome_assembly_Esup_%j.err
#SBATCH --mem-per-cpu=10G
#SBATCH --cpus-per-task=1

source activate rnaseq_transcriptome_env

snakemake --profile workflow/profiles/ --config assembly_prefix=Esup samples=sample_list_Esup.csv

echo Complete!