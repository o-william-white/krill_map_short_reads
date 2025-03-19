rule bgzip_reference:
    input:
        "results/seqkit_sliding/krill.chromosome_s2g_renamed.fa"
    output:
        "results/seqkit_sliding/krill.chromosome_s2g_renamed.fa.gz"
    conda:
        "../envs/samtools.yaml"
    log:
        "logs/bgzip_reference/bgzip_reference.log",
    threads: 1
    shell:
        """
        bgzip {input} 2> {log}
        """

