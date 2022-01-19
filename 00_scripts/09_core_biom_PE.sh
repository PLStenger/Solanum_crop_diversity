#!/usr/bin/env bash

# pathways in cluster:
DATADIRECTORY_ITS=/scratch_vol1/fungi/Solanum_crop_diversity/05_QIIME2/ITS/
DATADIRECTORY_16S=/scratch_vol1/fungi/Solanum_crop_diversity/05_QIIME2/16S/

METADATA_ITS=/scratch_vol1/fungi/Solanum_crop_diversity/98_database_files/ITS/
METADATA_16S=/scratch_vol1/fungi/Solanum_crop_diversity/98_database_files/16S/

# pathways in local:
#DATADIRECTORY_ITS=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/20_Solanum_crop_diversity/Solanum_crop_diversity/05_QIIME2/ITS/
#DATADIRECTORY_16S=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/20_Solanum_crop_diversity/Solanum_crop_diversity/05_QIIME2/16S/

#METADATA_ITS=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/20_Solanum_crop_diversity/Solanum_crop_diversity/98_database_files/ITS/
#METADATA_16S=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/20_Solanum_crop_diversity/Solanum_crop_diversity/98_database_files/16S/


###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# Aim: Filter sample from table based on a feature table or metadata

qiime feature-table filter-samples \
        --i-table core/RarTable.qza \
        --m-metadata-file $METADATA_ITS/sample-metadata.tsv \
        --p-where "[#SampleID] IN ('BRF1', 'BRF2', 'BRF3', 'BRFCV1', 'BRFCV2', 'BRFCV3', 'CV1', 'CV2', 'CV3', 'T1', 'T2', 'T3')"  \
        --o-filtered-table core/RarTable-all.qza

        
# Aim: Identify "core" features, which are features observed,
     # in a user-defined fraction of the samples

        
qiime feature-table core-features \
        --i-table core/RarTable-all.qza \
        --p-min-fraction 0.1 \
        --p-max-fraction 1.0 \
        --p-steps 10 \
        --o-visualization visual/CoreBiom-all.qzv  

qiime tools export --input-path core/RarTable-all.qza --output-path export/core/RarTable-all    
        
#qiime tools export --input-path visual/CoreBiomAll.qzv --output-path export/visual/CoreBiomAll
qiime tools export --input-path visual/CoreBiom-all.qzv --output-path export/visual/CoreBiom-all



###### Biom convert

# Aim: Convert to/from the BIOM table format

biom convert -i export/core/RarTable-all/feature-table.biom -o export/core/RarTable-all/table-from-biom.tsv --to-tsv

 # Aim: Remove first line and rename '#OTU ID' into 'ASV'

sed '1d ; s/\#OTU ID/ASV_ID/' export/core/RarTable-all/table-from-biom.tsv > export/core/RarTable-all/ASV.tsv


###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_16S

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# Aim: Filter sample from table based on a feature table or metadata

 qiime feature-table filter-samples \
        --i-table core/RarTable.qza \
        --m-metadata-file $METADATA_ITS/sample-metadata.tsv \
        --p-where "[#SampleID] IN ('BRF1', 'BRF2', 'BRF3', 'BRFCV1', 'BRFCV2', 'BRFCV3', 'CV1', 'CV2', 'CV3', 'T1', 'T2', 'T3')"  \
        --o-filtered-table core/RarTable-all.qza
           
           
# Aim: Identify "core" features, which are features observed,
     # in a user-defined fraction of the samples

qiime feature-table core-features \
        --i-table core/RarTable-all.qza \
        --p-min-fraction 0.1 \
        --p-max-fraction 1.0 \
        --p-steps 10 \
        --o-visualization visual/CoreBiom-all.qzv
        
qiime tools export --input-path core/RarTable-all.qza --output-path export/core/RarTable-all    
        
#qiime tools export --input-path visual/CoreBiomAll.qzv --output-path export/visual/CoreBiomAll
qiime tools export --input-path visual/CoreBiom-all.qzv --output-path export/visual/CoreBiom-all


###### Biom convert

# Aim: Convert to/from the BIOM table format

biom convert -i export/core/RarTable-all/feature-table.biom -o export/core/RarTable-all/table-from-biom.tsv --to-tsv

 # Aim: Remove first line and rename '#OTU ID' into 'ASV'
 
 sed '1d ; s/\#OTU ID/ASV_ID/' export/core/RarTable-all/table-from-biom.tsv >export/core/RarTable-all/ASV.tsv
