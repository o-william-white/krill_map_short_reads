rule ascp_forward_md5:
    params:
        fwd = get_forward_md5,
        ftp = get_ftp_path,
    output:
        "results/ascp/{sample}_R1.fq.gz.md5",
    log:
        "logs/ascp_forward_md5/{sample}.log",
    conda:
        "../envs/aspera-cli.yaml"
    threads: 1
    shell:
        """
        ascp \
            -i /home/krill/cngb_keyfile \
            -P33001 -T -k1 -l1000m \
            aspera_download@183.239.175.39:{params.ftp}/{params.fwd} \
            results/ascp/{params.fwd}.tmp &> {log}
        NAM=$(cat results/ascp/{params.fwd}.tmp | cut -f 1 -d " ")
        HEX=$(cat results/ascp/{params.fwd}.tmp | cut -f 2 -d " ")
        echo -e "${{HEX}}  results/ascp/${{NAM}}" > results/ascp/{params.fwd}
        rm results/ascp/{params.fwd}.tmp
        """
