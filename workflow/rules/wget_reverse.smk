rule wget_reverse:
    params:
        fwd = get_reverse,
        ftp = get_ftp_path,
    output:
        temp("results/wget/{sample}_R2.fq.gz"),
    log:
        "logs/wget_reverse/{sample}.log",
    threads: 1
    shell:
        """
        wget --tries=0 -P results/wget {params.ftp}/{params.fwd} 2> /tmp/wget_reverse_{wildcards.sample}.log
        mv /tmp/wget_reverse_{wildcards.sample}.log logs/wget_reverse/{wildcards.sample}.log
        """

