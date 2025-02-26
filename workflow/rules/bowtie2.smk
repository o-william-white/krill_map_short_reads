rule bowtie2:
    input:
        sample=["results/fastp/{sample}_R1.fastq.gz", "results/fastp/{sample}_R2.fastq.gz"],
        idx=multiext(
            "results/gunzip_reference/krill.chromosome.fa",
            ".1.bt2l",
            ".2.bt2l",
            ".3.bt2l",
            ".4.bt2l",
            ".rev.1.bt2l",
            ".rev.2.bt2l",
        ),
        #ref="", #Required for CRAM output
    output:
        temp("results/bowtie2/{sample}.sam"),
        # idx="",
        # metrics="",
        # unaligned="",
        # unpaired="",
        # unconcordant="",
        # concordant="",
    log:
        "logs/bowtie2/{sample}.log",
    params:
        extra="",  # optional parameters
    threads: 8  # Use at least two threads
    wrapper:
        "v5.0.2/bio/bowtie2/align"
