rule ascp_forward_md5:
    params:
        fwd = get_forward_md5,
        ftp = get_ftp_path,
    output:
        "results/ascp/{sample}_R1.fq.gz.md5",
    log:
        "logs/ascp_forward_md5/{sample}.log",
    threads: 1
    shell:
        """
        ascp \
            -i /home/owhite/cnbg_keyfile \
            -P33001 -T -k1 -l100m \
            aspera_download@183.239.175.39:{params.ftp}/{params.fwd} \
            results/ascp/{params.fwd}.tmp &> {log}
        NAM=$(cat results/ascp/{params.fwd}.tmp | cut -f 1 -d " ")
        HEX=$(cat results/ascp/{params.fwd}.tmp | cut -f 2 -d " ")
        echo -e "${HEX}  ${NAME}" > results/ascp/{params.fwd}
        rm results/ascp/{params.fwd}.tmp
        """
