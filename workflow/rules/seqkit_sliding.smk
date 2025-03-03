rule seqkit_sliding:
    input:
        fasta=reference,
    output:
        fasta=temp("results/seqkit_sliding/krill.chromosome_s2g.fa"),
    log:
        "logs/seqkit_sliding/seqkit_sliding.log",
    params:
        command="sliding",
        extra="--window 2000000000 --step 2000000000 --greedy --threads 8",
    threads: 8
    wrapper:
        "v3.0.1/bio/seqkit"
