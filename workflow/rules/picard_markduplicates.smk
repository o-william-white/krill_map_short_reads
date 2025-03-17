rule picard_markduplicates:
    input:
        bams="results/samtools_sort/{sample}.bam",
        # optional to specify a list of BAMs; this has the same effect
        # of marking duplicates on separate read groups for a sample
        # and then merging
    output:
        bam="results/dedup/{sample}.bam",
        metrics="results/dedup/{sample}.metrics.txt",
    log:
        "logs/picard_markduplicates/{sample}.log",
    params:
        extra="--REMOVE_DUPLICATES true",
        # optional specification of memory usage of the JVM that snakemake will respect with global
        # resource restrictions (https://snakemake.readthedocs.io/en/latest/snakefiles/rules.html#resources)
        # and which can be used to request RAM during cluster job submission as `{resources.mem_mb}`:
        # https://snakemake.readthedocs.io/en/latest/executing/cluster.html#job-properties
    resources:
        mem_mb=60000,
    wrapper:
        "v5.5.2/bio/picard/markduplicates"
