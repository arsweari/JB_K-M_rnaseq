#!/bin/bash
#SBATCH -p long
#SBATCH --job-name=JB_K-M_rnaseq
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=alsw5948@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=6gb
#SBATCH --time=50:00:00
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err

pwd; hostname; date
echo "Hi there -- you've requested $SLURM_CPUS_ON_NODE core."

module load singularity/3.1.1

nextflow run nf-core/rnaseq -r 1.4.2 \
-profile singularity \
--reads '/scratch/Users/alsw5948/JB_K-M/JB_K-M_rnaseq_analysis/fastq/*_{1,2}.fastq.gz' \ 
--genome mm10
--email alsw5948@colorado.edu \
--email_on_fail alsw5948@colorado.edu
-resume \
-c nextflow.config

date
