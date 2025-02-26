#!/bin/bash

source activate sm_map_env

snakemake \
   --cores 10 \
   --use-conda 

echo Complete!

