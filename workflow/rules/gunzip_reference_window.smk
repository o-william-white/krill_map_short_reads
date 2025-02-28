rule gunzip_reference_window:
    input:
        "results/make_window_fasta/krill.chromosome_w2g.fa.gz"
    output:
        temp("results/make_window_fasta/krill.chromosome_w2g.fa")
    log:
        "logs/gunzip_reference_window/gunzip_reference_window.log",
    threads: 1
    shell:
        """
        gunzip -c {input} 1> {output} 2> {log}
        """

