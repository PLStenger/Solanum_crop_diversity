#!/usr/bin/env bash

# trimmomatic version 0.39
# trimmomatic manual : http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf

# pathways in cluster:
DATADIRECTORY_ITS=/scratch_vol1/fungi/Solanum_crop_diversity/01_raw_data/ITS
DATADIRECTORY_16S=/scratch_vol1/fungi/Solanum_crop_diversity/01_raw_data/16S
DATAOUTPUT_ITS=/scratch_vol1/fungi/Solanum_crop_diversity/03_cleaned_data/DATAOUTPUT_ITS
DATAOUTPUT_16S=/scratch_vol1/fungi/Solanum_crop_diversity/03_cleaned_data/DATAOUTPUT_16S

WORKING_DIRECTORY=/scratch_vol1/fungi/Solanum_crop_diversity


# pathways in local:
#DATADIRECTORY_ITS=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/20_Solanum_crop_diversity/Solanum_crop_diversity/01_pooled/ITS
#DATADIRECTORY_16S=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/20_Solanum_crop_diversity/Solanum_crop_diversity/01_pooled/16S
#DATAOUTPUT_ITS=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/20_Solanum_crop_diversity/Solanum_crop_diversity/03_cleaned_data/DATAOUTPUT_ITS
#DATAOUTPUT_16S=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/20_Solanum_crop_diversity/Solanum_crop_diversity/03_cleaned_data/DATAOUTPUT_16S

eval "$(conda shell.bash hook)"
conda activate trimmomatic

ADAPTERFILE=/scratch_vol1/fungi/Solanum_crop_diversity/98_database_files/adapters_sequences.fasta

cd $WORKING_DIRECTORY

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $DATAOUTPUT_ITS
mkdir -p $DATAOUTPUT_16S


# cat $ADAPTERFILE
#>Illumina_TruSeq_LT_R1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC
#>Illumina_TruSeq_LT_R2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT
#>truseq AGATCGGAAGAGC
#>nextera CTGTCTCTTATACACATC
#>small TGGAATTCTCGGGTGCCAAGG
#>ScriptSeqR1 AGATCGGAAGAGCACACGTCTGAAC
#>ScriptSeqR2 AGATCGGAAGAGCGTCGTGTAGGGA
#>TruSeqRibo AGATCGGAAGAGCACACGTCT

# Arguments :
# ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

## For fungi :

cd $DATADIRECTORY_ITS

trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/23TB1.ITSb_1.fastq.gz $DATADIRECTORY_ITS/23TB1.ITSb_2.fastq.gz $DATAOUTPUT_ITS/23TB1.ITSb_1_paired.fastq.gz   $DATAOUTPUT_ITS/23TB1.ITSb_1_single.fastq.gz   $DATAOUTPUT_ITS/23TB1.ITSb_2_paired.fastq.gz   $DATAOUTPUT_ITS/23TB1.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/23TB2.ITSb_1.fastq.gz $DATADIRECTORY_ITS/23TB2.ITSb_2.fastq.gz $DATAOUTPUT_ITS/23TB2.ITSb_1_paired.fastq.gz   $DATAOUTPUT_ITS/23TB2.ITSb_1_single.fastq.gz   $DATAOUTPUT_ITS/23TB2.ITSb_2_paired.fastq.gz   $DATAOUTPUT_ITS/23TB2.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/23TB4.ITSb_1.fastq.gz $DATADIRECTORY_ITS/23TB4.ITSb_2.fastq.gz $DATAOUTPUT_ITS/23TB4.ITSb_1_paired.fastq.gz   $DATAOUTPUT_ITS/23TB4.ITSb_1_single.fastq.gz   $DATAOUTPUT_ITS/23TB4.ITSb_2_paired.fastq.gz   $DATAOUTPUT_ITS/23TB4.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/BRFB1.ITSb_1.fastq.gz $DATADIRECTORY_ITS/BRFB1.ITSb_2.fastq.gz $DATAOUTPUT_ITS/BRFB1.ITSb_1_paired.fastq.gz   $DATAOUTPUT_ITS/BRFB1.ITSb_1_single.fastq.gz   $DATAOUTPUT_ITS/BRFB1.ITSb_2_paired.fastq.gz   $DATAOUTPUT_ITS/BRFB1.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/BRFB2.ITSb_1.fastq.gz $DATADIRECTORY_ITS/BRFB2.ITSb_2.fastq.gz $DATAOUTPUT_ITS/BRFB2.ITSb_1_paired.fastq.gz   $DATAOUTPUT_ITS/BRFB2.ITSb_1_single.fastq.gz   $DATAOUTPUT_ITS/BRFB2.ITSb_2_paired.fastq.gz   $DATAOUTPUT_ITS/BRFB2.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/BRFB3.ITSb_1.fastq.gz $DATADIRECTORY_ITS/BRFB3.ITSb_2.fastq.gz $DATAOUTPUT_ITS/BRFB3.ITSb_1_paired.fastq.gz   $DATAOUTPUT_ITS/BRFB3.ITSb_1_single.fastq.gz   $DATAOUTPUT_ITS/BRFB3.ITSb_2_paired.fastq.gz   $DATAOUTPUT_ITS/BRFB3.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/BRFCVB1.ITSb_1.fastq.gz $DATADIRECTORY_ITS/BRFCVB1.ITSb_2.fastq.gz $DATAOUTPUT_ITS/BRFCVB1.ITSb_1_paired.fastq.gz $DATAOUTPUT_ITS/BRFCVB1.ITSb_1_single.fastq.gz $DATAOUTPUT_ITS/BRFCVB1.ITSb_2_paired.fastq.gz $DATAOUTPUT_ITS/BRFCVB1.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/BRFCVB2.ITSb_1.fastq.gz $DATADIRECTORY_ITS/BRFCVB2.ITSb_2.fastq.gz $DATAOUTPUT_ITS/BRFCVB2.ITSb_1_paired.fastq.gz $DATAOUTPUT_ITS/BRFCVB2.ITSb_1_single.fastq.gz $DATAOUTPUT_ITS/BRFCVB2.ITSb_2_paired.fastq.gz $DATAOUTPUT_ITS/BRFCVB2.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/BRFCVB3.ITSb_1.fastq.gz $DATADIRECTORY_ITS/BRFCVB3.ITSb_2.fastq.gz $DATAOUTPUT_ITS/BRFCVB3.ITSb_1_paired.fastq.gz $DATAOUTPUT_ITS/BRFCVB3.ITSb_1_single.fastq.gz $DATAOUTPUT_ITS/BRFCVB3.ITSb_2_paired.fastq.gz $DATAOUTPUT_ITS/BRFCVB3.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/CVB1.ITSb_1.fastq.gz $DATADIRECTORY_ITS/CVB1.ITSb_2.fastq.gz $DATAOUTPUT_ITS/CVB1.ITSb_1_paired.fastq.gz    $DATAOUTPUT_ITS/CVB1.ITSb_1_single.fastq.gz    $DATAOUTPUT_ITS/CVB1.ITSb_2_paired.fastq.gz    $DATAOUTPUT_ITS/CVB1.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/CVB2.ITSb_1.fastq.gz $DATADIRECTORY_ITS/CVB2.ITSb_2.fastq.gz $DATAOUTPUT_ITS/CVB2.ITSb_1_paired.fastq.gz    $DATAOUTPUT_ITS/CVB2.ITSb_1_single.fastq.gz    $DATAOUTPUT_ITS/CVB2.ITSb_2_paired.fastq.gz    $DATAOUTPUT_ITS/CVB2.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/CVB3.ITSb_1.fastq.gz $DATADIRECTORY_ITS/CVB3.ITSb_2.fastq.gz $DATAOUTPUT_ITS/CVB3.ITSb_1_paired.fastq.gz    $DATAOUTPUT_ITS/CVB3.ITSb_1_single.fastq.gz    $DATAOUTPUT_ITS/CVB3.ITSb_2_paired.fastq.gz    $DATAOUTPUT_ITS/CVB3.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/TB1.ITSb_1.fastq.gz $DATADIRECTORY_ITS/TB1.ITSb_2.fastq.gz $DATAOUTPUT_ITS/TB1.ITSb_1_paired.fastq.gz     $DATAOUTPUT_ITS/TB1.ITSb_1_single.fastq.gz     $DATAOUTPUT_ITS/TB1.ITSb_2_paired.fastq.gz     $DATAOUTPUT_ITS/TB1.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/TB2.ITSb_1.fastq.gz $DATADIRECTORY_ITS/TB2.ITSb_2.fastq.gz $DATAOUTPUT_ITS/TB2.ITSb_1_paired.fastq.gz     $DATAOUTPUT_ITS/TB2.ITSb_1_single.fastq.gz     $DATAOUTPUT_ITS/TB2.ITSb_2_paired.fastq.gz     $DATAOUTPUT_ITS/TB2.ITSb_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_ITS/TB4.ITSb_1.fastq.gz $DATADIRECTORY_ITS/TB4.ITSb_2.fastq.gz $DATAOUTPUT_ITS/TB4.ITSb_1_paired.fastq.gz     $DATAOUTPUT_ITS/TB4.ITSb_1_single.fastq.gz     $DATAOUTPUT_ITS/TB4.ITSb_2_paired.fastq.gz     $DATAOUTPUT_ITS/TB4.ITSb_2_single.fastq.gz



# For bacteria :
 
cd $DATADIRECTORY_16S

trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/23TB1.V3V5_1.fastq.gz $DATADIRECTORY_16S/23TB1.V3V5_2.fastq.gz $DATAOUTPUT_16S/23TB1.V3V5_1_paired.fastq.gz   $DATAOUTPUT_16S/23TB1.V3V5_1_single.fastq.gz   $DATAOUTPUT_16S/23TB1.V3V5_2_paired.fastq.gz   $DATAOUTPUT_16S/23TB1.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/23TB2.V3V5_1.fastq.gz $DATADIRECTORY_16S/23TB2.V3V5_2.fastq.gz $DATAOUTPUT_16S/23TB2.V3V5_1_paired.fastq.gz   $DATAOUTPUT_16S/23TB2.V3V5_1_single.fastq.gz   $DATAOUTPUT_16S/23TB2.V3V5_2_paired.fastq.gz   $DATAOUTPUT_16S/23TB2.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/23TB4.V3V5_1.fastq.gz $DATADIRECTORY_16S/23TB4.V3V5_2.fastq.gz $DATAOUTPUT_16S/23TB4.V3V5_1_paired.fastq.gz   $DATAOUTPUT_16S/23TB4.V3V5_1_single.fastq.gz   $DATAOUTPUT_16S/23TB4.V3V5_2_paired.fastq.gz   $DATAOUTPUT_16S/23TB4.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/BRFB1.V3V5_1.fastq.gz $DATADIRECTORY_16S/BRFB1.V3V5_2.fastq.gz $DATAOUTPUT_16S/BRFB1.V3V5_1_paired.fastq.gz   $DATAOUTPUT_16S/BRFB1.V3V5_1_single.fastq.gz   $DATAOUTPUT_16S/BRFB1.V3V5_2_paired.fastq.gz   $DATAOUTPUT_16S/BRFB1.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/BRFB2.V3V5_1.fastq.gz $DATADIRECTORY_16S/BRFB2.V3V5_2.fastq.gz $DATAOUTPUT_16S/BRFB2.V3V5_1_paired.fastq.gz   $DATAOUTPUT_16S/BRFB2.V3V5_1_single.fastq.gz   $DATAOUTPUT_16S/BRFB2.V3V5_2_paired.fastq.gz   $DATAOUTPUT_16S/BRFB2.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/BRFB3.V3V5_1.fastq.gz $DATADIRECTORY_16S/BRFB3.V3V5_2.fastq.gz $DATAOUTPUT_16S/BRFB3.V3V5_1_paired.fastq.gz   $DATAOUTPUT_16S/BRFB3.V3V5_1_single.fastq.gz   $DATAOUTPUT_16S/BRFB3.V3V5_2_paired.fastq.gz   $DATAOUTPUT_16S/BRFB3.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/BRFCVB1.V3V5_1.fastq.gz $DATADIRECTORY_16S/BRFCVB1.V3V5_2.fastq.gz $DATAOUTPUT_16S/BRFCVB1.V3V5_1_paired.fastq.gz $DATAOUTPUT_16S/BRFCVB1.V3V5_1_single.fastq.gz $DATAOUTPUT_16S/BRFCVB1.V3V5_2_paired.fastq.gz $DATAOUTPUT_16S/BRFCVB1.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/BRFCVB2.V3V5_1.fastq.gz $DATADIRECTORY_16S/BRFCVB2.V3V5_2.fastq.gz $DATAOUTPUT_16S/BRFCVB2.V3V5_1_paired.fastq.gz $DATAOUTPUT_16S/BRFCVB2.V3V5_1_single.fastq.gz $DATAOUTPUT_16S/BRFCVB2.V3V5_2_paired.fastq.gz $DATAOUTPUT_16S/BRFCVB2.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/BRFCVB3.V3V5_1.fastq.gz $DATADIRECTORY_16S/BRFCVB3.V3V5_2.fastq.gz $DATAOUTPUT_16S/BRFCVB3.V3V5_1_paired.fastq.gz $DATAOUTPUT_16S/BRFCVB3.V3V5_1_single.fastq.gz $DATAOUTPUT_16S/BRFCVB3.V3V5_2_paired.fastq.gz $DATAOUTPUT_16S/BRFCVB3.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/CVB1.V3V5_1.fastq.gz $DATADIRECTORY_16S/CVB1.V3V5_2.fastq.gz $DATAOUTPUT_16S/CVB1.V3V5_1_paired.fastq.gz    $DATAOUTPUT_16S/CVB1.V3V5_1_single.fastq.gz    $DATAOUTPUT_16S/CVB1.V3V5_2_paired.fastq.gz    $DATAOUTPUT_16S/CVB1.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/CVB2.V3V5_1.fastq.gz $DATADIRECTORY_16S/CVB2.V3V5_2.fastq.gz $DATAOUTPUT_16S/CVB2.V3V5_1_paired.fastq.gz    $DATAOUTPUT_16S/CVB2.V3V5_1_single.fastq.gz    $DATAOUTPUT_16S/CVB2.V3V5_2_paired.fastq.gz    $DATAOUTPUT_16S/CVB2.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/CVB3.V3V5_1.fastq.gz $DATADIRECTORY_16S/CVB3.V3V5_2.fastq.gz $DATAOUTPUT_16S/CVB3.V3V5_1_paired.fastq.gz    $DATAOUTPUT_16S/CVB3.V3V5_1_single.fastq.gz    $DATAOUTPUT_16S/CVB3.V3V5_2_paired.fastq.gz    $DATAOUTPUT_16S/CVB3.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/TB1.V3V5_1.fastq.gz $DATADIRECTORY_16S/TB1.V3V5_2.fastq.gz $DATAOUTPUT_16S/TB1.V3V5_1_paired.fastq.gz     $DATAOUTPUT_16S/TB1.V3V5_1_single.fastq.gz     $DATAOUTPUT_16S/TB1.V3V5_2_paired.fastq.gz     $DATAOUTPUT_16S/TB1.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/TB2.V3V5_1.fastq.gz $DATADIRECTORY_16S/TB2.V3V5_2.fastq.gz $DATAOUTPUT_16S/TB2.V3V5_1_paired.fastq.gz     $DATAOUTPUT_16S/TB2.V3V5_1_single.fastq.gz     $DATAOUTPUT_16S/TB2.V3V5_2_paired.fastq.gz     $DATAOUTPUT_16S/TB2.V3V5_2_single.fastq.gz
trimmomatic PE -Xmx60G -threads 8 -phred33 $DATADIRECTORY_16S/TB4.V3V5_1.fastq.gz $DATADIRECTORY_16S/TB4.V3V5_2.fastq.gz $DATAOUTPUT_16S/TB4.V3V5_1_paired.fastq.gz     $DATAOUTPUT_16S/TB4.V3V5_1_single.fastq.gz     $DATAOUTPUT_16S/TB4.V3V5_2_paired.fastq.gz     $DATAOUTPUT_16S/TB4.V3V5_2_single.fastq.gz
