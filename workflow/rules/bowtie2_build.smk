rule bowtie2_build:
    input:
        ref="results/gunzip_reference/krill.chromosome.fa",
    output:
        temp(multiext(
            "results/gunzip_reference/krill.chromosome.fa",
            ".1.bt2l",
            ".2.bt2l",
            ".3.bt2l",
            ".4.bt2l",
            ".rev.1.bt2l",
            ".rev.2.bt2l",
        )),
    log:
        "logs/bowtie2_build/build.log",
    params:
        extra="--large-index",  # optional parameters
    threads: 8
    wrapper:
        "v5.8.2/bio/bowtie2/build"
