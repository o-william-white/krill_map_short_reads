rule gunzip_reference:
    input:
        "results/seqkit_sliding/krill.chromosome_s2g.fa.gz"
    output:
        temp("results/seqkit_sliding/krill.chromosome_s2g.fa")
    log:
        "logs/gunzip_reference/gunzip_reference.log",
    threads: 1
    shell:
        """
        gunzip -c {input} 1> {output} 2> {log}
        """

