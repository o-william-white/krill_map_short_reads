rule wget_reverse_md5:
    params:
        fwd = get_reverse_md5,
        ftp = get_ftp_path,
    output:
        "results/wget/{sample}_R2.fq.gz.md5"
    log:
        "logs/wget_reverse_md5/{sample}.log",
    threads: 1
    shell:
        """
        wget -P results/wget {params.ftp}/{params.fwd} 2> /tmp/wget_reverse_md5_{wildcards.sample}.log
        # md5sum files are malformed. Add line break
        echo "\n" >> results/wget/{params.fwd}
        mv /tmp/wget_reverse_md5_{wildcards.sample}.log logs/wget_reverse_md5/{wildcards.sample}.log
        """

