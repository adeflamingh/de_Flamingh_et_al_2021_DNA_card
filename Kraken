#!/bin/bash

# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 1
#SBATCH --mem=120g
#SBATCH -N 1
#SBATCH --mail-user deflami2@illinois.edu
#SBATCH --mail-type ALL
#SBATCH -J kaken_db_build

# ----------------Load Modules--------------------
module load Kraken2/2.1.1-IGB-gcc-8.2.0 
# ----------------Commands------------------------

#code for building the database:
#kraken2-build --standard --threads 12 --db standard_NCBI

#classifying sequences 
kraken2 --db databases/standard_NCBI --threads 24 --use-names --report results/knysna/k2_report.txt  --output results/knysna/k2_output.txt --paired ../data/Alida_FC2_WNP01_Knysna_CTTGCCATTA-CCTTCGTGAT_L003_R1_001.fastq ../data/Alida_FC2_WNP01_Knysna_CTTGCCATTA-CCTTCGTGAT_L003_R2_001.fastq 
