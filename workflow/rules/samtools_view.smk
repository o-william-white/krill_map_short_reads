rule samtools_view:
    input:
        "results/bwa_mem/{sample}.sam",
    output:
        bam="results/samtools_view/{sample}.bam",
        idx="results/samtools_view/{sample}.bai",
    log:
        "logs/samtools_view/{sample}.log",
    params:
        extra="-h -F 4",  # optional params string
        region="",  # optional region string
    threads: 4
    wrapper:
        "v5.8.2/bio/samtools/view"
