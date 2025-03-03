rule bwa_mem:
    input:
        reads=["results/fastp/{sample}_R1.fastq.gz", "results/fastp/{sample}_R2.fastq.gz"],
        idx=multiext("results/seqkit_sliding/krill.chromosome_s2g.fa.gz", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    output:
        "results/bwa_mem/{sample}.bam",
    log:
        "logs/bwa_mem/{sample}.log",
    conda:
        "../envs/bwa_mem.yaml"
    params:
        extra=r"-R '@RG\tID:{sample}\tSM:{sample}'",
    threads: 4
    shell:
        """
        bwa mem -t {threads} {params.extra} results/seqkit_sliding/krill.chromosome_s2g.fa.gz {input.reads} | \
        samtools view -h --threads {threads} -o {output} --output-fmt BAM - &> {log} 
        """
