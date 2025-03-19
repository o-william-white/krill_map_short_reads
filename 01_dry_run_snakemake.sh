#!/bin/bash

source activate sm_map_env

snakemake -n --rerun-incomplete

