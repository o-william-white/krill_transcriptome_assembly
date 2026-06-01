#!/bin/bash
#SBATCH --partition=long
#SBATCH --output=job_run_transcriptome_assembly_Ecry_%j.out
#SBATCH --error=job_run_transcriptome_assembly_Ecry_%j.err
#SBATCH --mem-per-cpu=10G
#SBATCH --cpus-per-task=1

source activate rnaseq_transcriptome_env

snakemake --profile workflow/profiles/ 

echo Complete!

