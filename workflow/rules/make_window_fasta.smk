rule make_window_fasta:
    input:
        ref = reference,
        fai = "results/gunzip_reference/krill.chromosome.fa.fai", 
    output:
        "results/make_window_fasta/krill.chromosome_w2g.fa.gz",
    log:
        "logs/make_window_fasta/make_window_fasta.log",
    conda: 
        "../envs/biopython.yaml"
    threads: 1
    shell:
        """
        python workflow/scripts/make_window_fasta.py \
            --input  {input.ref} \
            --output {output} \
            --window 2000000000 \
            --genome {input.fai}
        """
