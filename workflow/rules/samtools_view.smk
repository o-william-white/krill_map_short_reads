rule samtools_view:
    input:
        "results/bwa_mem/{sample}.bam",
    output:
        bam=temp("results/samtools_view/{sample}.bam"),
    log:
        "logs/samtools_view/{sample}.log",
    params:
        extra="-h -F 4",  # optional params string
        region="",  # optional region string
    threads: 16
    wrapper:
        "v5.0.0/bio/samtools/view"
