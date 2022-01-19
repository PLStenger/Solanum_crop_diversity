# Solanum_crop_diversity


### Installing pipeline :


<details>
  <summary>Click here to see how to install this pipeline</summary>

First, open your terminal. Then, run these two command lines :

    pwd
    /scratch_vol1/fungi

    cd -place_in_your_local_computer
    git clone https://github.com/PLStenger/Solanum_crop_diversity.git

</details> 

### Running pipeline :

<details>
  
    # For run all pipeline, lunch only this command line : 
    time nohup bash 000_run_all_pipeline_in_one_script.sh &> 000_run_all_pipeline_in_one_script.out
  
    time nohup bash 00_quality_check_by_FastQC.sh &> 00_quality_check_by_FastQC.out
    >real	11m16,059s
    >user	15m28,106s
    >sys  0m46,657s
  
    time nohup bash 02_trimmomatic_q30.sh &> 02_trimmomatic_q30.out
    >
    > NOT PAIRED END DATA !!
    >
  
    time nohup bash 04_qiime2_import_SE.sh &> 04_qiime2_import_SE.out
    >real	1m30,108s
    >user	1m34,436s
    >sys	0m19,644s
  
    time nohup bash 05_qiime2_denoise_SE.sh &> 05_qiime2_denoise_SE.out
    >
     
    time nohup bash 06_qiime2_tree_PE.sh &> 06_qiime2_tree_PE.out


</details> 
