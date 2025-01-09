rule samtools_sort_hifi:
    input:
        "results/samtools_view_hifi/{sample}.sam",
    output:
        "results/samtools_sort_hifi/{sample}.sam",
    log:
        "logs/samtools_sort_hifi/{sample}.log",
    params:
        extra="",
    threads: 16
    wrapper:
        "v5.0.2/bio/samtools/sort"
