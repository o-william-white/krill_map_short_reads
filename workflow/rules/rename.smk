rule rename:
    input:
        "results/seqkit_sliding/krill.chromosome_s2g.fa"
    output:
        temp("results/seqkit_sliding/krill.chromosome_s2g_renamed.fa"),
    log:
        "logs/rename/rename.log",
    conda:
        "../envs/conda_env.yaml"
    threads: 1
    shell:
        """
        sed '/^>/ s/_sliding:/_sliding_/g' {input} 1> {output} 2> {log}
        """
