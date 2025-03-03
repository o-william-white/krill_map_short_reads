rule samtools_faidx:
    input:
        "results/seqkit_sliding/krill.chromosome_s2g_renamed.fa.gz",
    output:
        "results/seqkit_sliding/krill.chromosome_s2g_renamed.fa.gz.fai",
        "results/seqkit_sliding/krill.chromosome_s2g_renamed.fa.gz.gzi",
    log:
        "logs/samtools_faidx/samtools_faidx.log",
    params:
        extra="",
    wrapper:
        "v5.8.2/bio/samtools/faidx"
