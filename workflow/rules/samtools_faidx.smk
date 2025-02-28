rule samtools_faidx:
    input:
        "results/seqkit_sliding/krill.chromosome_s2g.fa",
    output:
        "results/seqkit_sliding/krill.chromosome_s2g.fa.fai",
    log:
        "logs/samtools_faidx/samtools_faidx.log",
    params:
        extra="",
    wrapper:
        "v5.8.2/bio/samtools/faidx"
