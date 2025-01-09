rule ascp_forward:
    params:
        fwd = get_forward,
        ftp = get_ftp_path,
    output:
        temp("results/ascp/{sample}_R1.fq.gz"),
    log:
        "logs/ascp_forward/{sample}.log",
    threads: 1
    shell:
        """
        ascp \
            -i /home/owhite/cnbg_keyfile \
            -P33001 -T -k1 -l100m \
            aspera_download@183.239.175.39:{params.ftp}/{params.fwd} \
            results/ascp/{params.fwd} &> {log}
        """
