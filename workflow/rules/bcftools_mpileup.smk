rule bcftools_mpileup:
    input:
        alignments=expand(
             "results/dedup/{sample}.bam",
             sample=sample_data.index.tolist(),
            ),
        ref="results/seqkit_sliding/krill.chromosome_s2g.fa.gz",  # this can be left out if --no-reference is in options
        index="results/seqkit_sliding/krill.chromosome_s2g.fa.fai",
    output:
        pileup="bcftools/mpileup.bcf",
    params:
        uncompressed_bcf=False,
        extra="--max-depth 250 --min-BQ 15",
    log:
        "logs/bcftools_mpileup/bcftools_mpileup.log",
    wrapper:
        "v5.8.2/bio/bcftools/mpileup"
