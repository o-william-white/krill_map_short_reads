rule bwa_index:
    input:
        "results/make_window_fasta/krill.chromosome_w2g.fa.gz",
    output:
        idx=multiext("results/make_window_fasta/krill.chromosome_w2g.fa.gz", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    log:
        "logs/bwa_index/bwa_index.log",
    wrapper:
        "v5.8.2/bio/bwa/index"
