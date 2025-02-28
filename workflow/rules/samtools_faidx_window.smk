rule samtools_faidx_window:
    input:
        "results/make_window_fasta/krill.chromosome_w2g.fa",
    output:
        "results/make_window_fasta/krill.chromosome_w2g.fa.fai",
    log:
        "logs/samtools_faidx_window/samtools_faidx_window.log",
    params:
        extra="",
    wrapper:
        "v5.8.2/bio/samtools/faidx"
