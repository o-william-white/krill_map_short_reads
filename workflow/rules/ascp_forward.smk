rule ascp_forward:
    params:
        fwd = get_forward,
        ftp = get_ftp_path,
    output:
        temp("results/ascp/{sample}_R1.fq.gz"),
    log:
        "logs/ascp_forward/{sample}.log",
    conda: 
        "../envs/aspera-cli.yaml"
    threads: 1
    shell:
        """
        ascp \
            -i /home/krill/cngb_keyfile \
            -P33001 -T -k1 -l1000m \
            aspera_download@183.239.175.39:{params.ftp}/{params.fwd} \
            results/ascp/{params.fwd} &> {log}
        """
