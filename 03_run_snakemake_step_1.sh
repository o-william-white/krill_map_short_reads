#!/bin/bash

source activate sm_map_env

snakemake \
   --omit-from fastp
   --cores 10 \
   --use-conda \
   --retries 3 \
   --rerun-incomplete &> snakemake_log_step_1.txt 

