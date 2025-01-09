rule bowtie2_hifi:
    input:
        sample=["results/fastp/{sample}_R1.fastq.gz", "results/fastp/{sample}_R2.fastq.gz"],
        idx=multiext(
            "/home/owhite/scratch/private/data_krill_chromosome_assemblies/bowtie2_build/krill.hifiasm-assembly",
            ".1.bt2l",
            ".2.bt2l",
            ".3.bt2l",
            ".4.bt2l",
            ".rev.1.bt2l",
            ".rev.2.bt2l",
        ),
        #ref="", #Required for CRAM output
    output:
        temp("results/bowtie2_hifi/{sample}.sam"),
        # idx="",
        # metrics="",
        # unaligned="",
        # unpaired="",
        # unconcordant="",
        # concordant="",
    log:
        "logs/bowtie2_hifi/{sample}.log",
    params:
        extra="",  # optional parameters
    threads: 8  # Use at least two threads
    wrapper:
        "v5.0.2/bio/bowtie2/align"
