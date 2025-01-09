rule wget_forward:
    params:
        fwd = get_forward,
        ftp = get_ftp_path,
    output:
        temp("results/wget/{sample}_R1.fq.gz"),
    log:
        "logs/wget_forward/{sample}.log",
    threads: 1
    shell:
        """
        wget --tries=0 -P results/wget {params.ftp}/{params.fwd} 2> /tmp/wget_forward_{wildcards.sample}.log
        mv /tmp/wget_forward_{wildcards.sample}.log logs/wget_forward/{wildcards.sample}.log
        """

