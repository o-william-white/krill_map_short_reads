rule bwa_index:
    input:
        "results/seqkit_sliding/krill.chromosome_s2g.fa.gz",
    output:
        idx=multiext("results/seqkit_sliding/krill.chromosome_s2g.fa.gz", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    log:
        "logs/bwa_index/bwa_index.log",
    wrapper:
        "v5.8.2/bio/bwa/index"
