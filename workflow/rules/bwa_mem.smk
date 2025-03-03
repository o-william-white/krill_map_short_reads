rule bwa_mem:
    input:
        reads=["results/fastp/{sample}_R1.fastq.gz", "results/fastp/{sample}_R2.fastq.gz"],
        idx=multiext("results/seqkit_sliding/krill.chromosome_s2g_renamed.fa.gz", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    output:
        "results/bwa_mem/{sample}.sam",
    log:
        "logs/bwa_mem/{sample}.log",
    conda:
        "../envs/bwa_mem.yaml"
    params:
        extra=r"-R '@RG\tID:{sample}\tSM:{sample}'",
    threads: 4
    shell:
        """
        bwa mem -t {threads} {params.extra} results/seqkit_sliding/krill.chromosome_s2g_renamed.fa.gz {input.reads} 1> {output} 2> {log} 
        """
