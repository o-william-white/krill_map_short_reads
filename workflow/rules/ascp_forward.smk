rule ascp_forward:
    params:
        fwd = lambda wildcards: wildcards.fwd,
        ftp = get_ftp_path,
    output:
        temp("results/ascp_forward/{sample_id}/{fwd}"),
    log:
        "logs/ascp_forward/{sample_id}/{fwd}.log",
    conda:
        "../envs/aspera-cli.yaml"
    threads: 1
    shell:
        """
        ascp \
            -i /home/owhite/cnbg_keyfile \
            -P33001 -T -k1 -l1000m \
            aspera_download@183.239.175.39:{params.ftp}/{params.fwd} \
            results/ascp_forward/{wildcards.sample_id}/{wildcards.fwd} &> {log}
        """
