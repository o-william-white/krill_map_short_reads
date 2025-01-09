rule samtools_sort_chromosome:
    input:
        "results/samtools_view_chromosome/{sample}.sam",
    output:
        "results/samtools_sort_chromosome/{sample}.sam",
    log:
        "logs/samtools_sort_chromosome/{sample}.log",
    params:
        extra="",
    threads: 16
    wrapper:
        "v5.0.2/bio/samtools/sort"
