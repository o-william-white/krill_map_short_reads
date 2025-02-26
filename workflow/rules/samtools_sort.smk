rule samtools_sort:
    input:
        "results/samtools_view/{sample}.sam",
    output:
        "results/samtools_sort/{sample}.sam",
    log:
        "logs/samtools_sort/{sample}.log",
    params:
        extra="",
    threads: 16
    wrapper:
        "v5.0.2/bio/samtools/sort"
