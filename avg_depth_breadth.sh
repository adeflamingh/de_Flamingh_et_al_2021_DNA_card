#!/bin/bash

# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 1
#SBATCH --mem=64g
#SBATCH -N 1
#SBATCH --mail-user deflami2@illinois.edu
#SBATCH --mail-type ALL
#SBATCH -J DepthCov
#SBATCH --array=7

# ----------------Load Modules--------------------
module load SAMtools
# ----------------Commands------------------------

echo "SAMPLE ORDER" >> depth_breadth.stat.txt
echo "  " >> depth_breadth.stat.txt
echo "Alida_AJABU_D3 >> depth_breadth.stat.txt
echo "Alida_JENNY_D1 >> depth_breadth.stat.txt
echo "Alida_JENNY_F >> depth_breadth.stat.txt
echo "Alida_MLILO_D1 >> depth_breadth.stat.txt
echo "Alida_MLILO_F >> depth_breadth.stat.txt
echo "Alida_NEG1_FC >> depth_breadth.stat.txt
echo "Alida_NEG2_FC >> depth_breadth.stat.txt
echo "Alida_SAA01 >> depth_breadth.stat.txt
echo "Alida_SAA03 >> depth_breadth.stat.txt
echo "Alida_SAA06 >> depth_breadth.stat.txt
echo "Alida_SAA1 >> depth_breadth.stat.txt
echo "Alida_SAKNPC04 >> depth_breadth.stat.txt
echo "Alida_TENDAJI >> depth_breadth.stat.txt
echo "Alida_TENDAJI >> depth_breadth.stat.txt

echo "---" >> depth_breadth.stat.txt
echo "DEPTH OF COVERAGE (X)" >> depth_breadth.stat.txt
echo "---" >> depth_breadth.stat.txt
echo "   " >> depth_breadth.stat.txt

#Below is the code for calculating average coverage and saving it in a txt file
#. Average coverage was calculated as the depth of coverage across the genome for all positions in the genome, including those with 0 depth. 

samtools depth -a	Alida_AJABU_D3_TGAGTACAAC-GTCCAAGCGT_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_JENNY_D1_TCAACCACGA-TATGAACTTG_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_JENNY_F_TCCAGCCTGC-TGGATCTGGC_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_MLILO_D1_TATGAACTTG-CCTAAGGATT_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_MLILO_F_GCCATATAAC-GATATTGTGT_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_NEG1_FC_AACGGTCTAT-CCGCGTATAG_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_NEG2_FC_GGATTATGGA-CTCTATCGGA_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_SAA01_CCGCGGTTCT-AATCTACTCC_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_SAA03_AGTGCGAGTG-ATTACCTCCA_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_SAA06_CTGAGCCGGT-TACGTGAAGG_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_SAA1_AGTGGTTAAG-GTATTCCACC_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_SAKNPC04_TACTCTGCGC-CATAGTAAGG_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_TENDAJI_D1_TGGTTCTCAT-CGGCCTTGAG_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt
samtools depth -a	Alida_TENDAJI_F_AGGTATGGCG-GTCTCGCCAC_L001.ready.bam|	awk '{c++;s+=$3}END{print s/c}' >> depth_breadth.stat.txt

echo "---" >> depth_breadth.stat.txt
echo "BREADTH OF COVERAGE (%)" >> depth_breadth.stat.txt
echo "---" >> depth_breadth.stat.txt
echo "   " >> depth_breadth.stat.txt


#Below is the code for calculating breadt of coverage and saving it as a txt file
#Breadth of coverage: the proportion of the genome covered by at least 1 read (positions with depth > 1 devided by total number of positions in genome) 

samtools depth -a	Alida_AJABU_D3_TGAGTACAAC-GTCCAAGCGT_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_JENNY_D1_TCAACCACGA-TATGAACTTG_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_JENNY_F_TCCAGCCTGC-TGGATCTGGC_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_MLILO_D1_TATGAACTTG-CCTAAGGATT_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_MLILO_F_GCCATATAAC-GATATTGTGT_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_NEG1_FC_AACGGTCTAT-CCGCGTATAG_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_NEG2_FC_GGATTATGGA-CTCTATCGGA_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_SAA01_CCGCGGTTCT-AATCTACTCC_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_SAA03_AGTGCGAGTG-ATTACCTCCA_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_SAA06_CTGAGCCGGT-TACGTGAAGG_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_SAA1_AGTGGTTAAG-GTATTCCACC_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_SAKNPC04_TACTCTGCGC-CATAGTAAGG_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_TENDAJI_D1_TGGTTCTCAT-CGGCCTTGAG_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt
samtools depth -a	Alida_TENDAJI_F_AGGTATGGCG-GTCTCGCCAC_L001.ready.bam|	awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' >> depth_breadth.stat.txt




