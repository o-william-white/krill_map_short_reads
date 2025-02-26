rule gunzip_reference:
    input:
        reference
    output:
        temp("results/gunzip_reference/krill.chromosome.fa")
    log:
        "logs/gunzip_reference/gunzip_reference.log",
    threads: 1
    shell:
        """
        gunzip -c {input} 1> {output} 2> {log}
        """

