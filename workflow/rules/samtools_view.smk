rule samtools_view:
    input:
        "results/bowtie2/{sample}.sam",
    output:
        sam=temp("results/samtools_view/{sample}.sam"),
    log:
        "logs/samtools_view/{sample}.log",
    params:
        extra="-h -F 4 -f 2 -q 10",  # optional params string
        region="",  # optional region string
    threads: 16
    wrapper:
        "v5.0.0/bio/samtools/view"
