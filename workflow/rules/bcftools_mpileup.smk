rule bcftools_mpileup:
    input:
        alignments=expand(
             "results/dedup/{sample}.sam",
             sample=sample_data.index.tolist(),
            ),
        ref="results/gunzip_reference/krill.chromosome.fa",  # this can be left out if --no-reference is in options
        index="results/gunzip_reference/krill.chromosome.fa.fai",
    output:
        pileup="bcftools/mpileup.bcf",
    params:
        uncompressed_bcf=False,
        extra="--max-depth 250 --min-BQ 15",
    log:
        "logs/bcftools_mpileup/bcftools_mpileup.log",
    wrapper:
        "v5.8.2/bio/bcftools/mpileup"
