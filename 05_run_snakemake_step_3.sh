#!/bin/bash

source activate sm_map_env

snakemake \
   --cores 10 \
   --use-conda \
   --retries 3 \
   --rerun-incomplete &> snakemake_log_step_3.txt 

