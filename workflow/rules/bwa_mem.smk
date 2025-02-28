rule bwa_mem:
    input:
        reads=["results/fastp/{sample}_R1.fastq.gz", "results/fastp/{sample}_R2.fastq.gz"],
        idx=multiext("results/make_window_fasta/krill.chromosome_w2g.fa.gz", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    output:
        temp("results/bwa_mem/{sample}.bam"),
    log:
        "logs/bwa_mem/{sample}.log",
    params:
        extra=r"-R '@RG\tID:{sample}\tSM:{sample}'",
        sorting="samtools",  # Can be 'none', 'samtools' or 'picard'.
        sort_order="coordinate",  # Can be 'queryname' or 'coordinate'.
        sort_extra="",  # Extra args for samtools/picard.
    threads: 8
    wrapper:
        "v5.8.2/bio/bwa/mem"
