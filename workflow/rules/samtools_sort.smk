rule samtools_sort:
    input:
        "results/samtools_view/{sample}.bam",
    output:
        temp("results/samtools_sort/{sample}.bam"),
    log:
        "logs/samtools_sort/{sample}.log",
    params:
        extra="",
    threads: 4
    wrapper:
        "v5.0.2/bio/samtools/sort"
