rule samtools_view_chromosome:
    input:
        "results/bowtie2_chromosome/{sample}.sam",
    output:
        sam=temp("results/samtools_view_chromosome/{sample}.sam"),
    log:
        "logs/samtools_view_chromosome/{sample}.log",
    params:
        extra="-h -F 4 -f 2 -q 10",  # optional params string
        region="",  # optional region string
    threads: 16
    wrapper:
        "v5.0.0/bio/samtools/view"
