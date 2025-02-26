rule samtools_faidx:
    input:
        "results/gunzip_reference/krill.chromosome.fa",
    output:
        temp("results/gunzip_reference/krill.chromosome.fa.fai"),
    log:
        "logs/samtools_faidx/samtools_faidx.log",
    params:
        extra="",
    wrapper:
        "v5.8.2/bio/samtools/faidx"
