rule bcftools_call:
    input:
        pileup="results/bcftools/mpileup.bcf",
    output:
        calls="results/bcftools/calls.bcf",
    params:
        uncompressed_bcf=False,
        caller="-m",  # valid options include -c/--consensus-caller or -m/--multiallelic-caller
        extra="--ploidy 1 --prior 0.001",
    log:
        "logs/bcftools_call/bcftools_call.log",
    wrapper:
        "v5.8.2/bio/bcftools/call"
