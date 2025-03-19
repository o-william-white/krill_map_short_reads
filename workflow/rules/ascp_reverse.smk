rule ascp_reverse:
    params:
        rev = lambda wildcards: wildcards.rev,
        ftp = get_ftp_path,
    output:
        temp("results/ascp_reverse/{sample_id}/{rev}"),
    log:
        "logs/ascp_reverse/{sample_id}/{rev}.log",
    conda:
        "../envs/aspera-cli.yaml"
    threads: 1
    shell:
        """
        ascp \
            -i /home/owhite/cnbg_keyfile \
            -P33001 -T -k1 -l1000m \
            aspera_download@183.239.175.39:{params.ftp}/{params.rev} \
            results/ascp_reverse/{wildcards.sample_id}/{wildcards.rev} &> {log}
        """
