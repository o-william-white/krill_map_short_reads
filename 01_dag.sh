
snakemake --dag | dot -Tsvg > dag.svg
snakemake --rulegraph | dot -Tsvg > rulegraph.svg

