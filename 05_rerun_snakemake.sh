#!/bin/bash

source activate sm_map_env

echo -e "\n\nRERUN SNAKEMAKE" >> snakemake_log.txt
date >> snakemake_log.txt

snakemake \
   --cores 10 \
   --use-conda \
   --retries 3 \
   --rerun-incomplete &>> snakemake_log.txt 

