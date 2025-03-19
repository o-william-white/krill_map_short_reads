#!/bin/bash

source activate sm_map_env

snakemake --dag | dot -Tsvg > dag.svg
snakemake --rulegraph | dot -Tsvg > rulegraph.svg

