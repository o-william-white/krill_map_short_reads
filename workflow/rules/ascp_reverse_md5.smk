rule ascp_reverse_md5:
    params:
        rev = get_reverse_md5,
        ftp = get_ftp_path,
    output:
        "results/ascp/{sample}_R2.fq.gz.md5",
    log:
        "logs/ascp_reverse_md5/{sample}.log",
    threads: 1
    shell:
        """
        ascp \
            -i /home/owhite/cnbg_keyfile \
            -P33001 -T -k1 -l100m \
            aspera_download@183.239.175.39:{params.ftp}/{params.rev} \
            results/ascp/{params.rev}.tmp &> {log}
        NAM=$(cat results/ascp/{params.rev}.tmp | cut -f 1 -d " ")
        HEX=$(cat results/ascp/{params.rev}.tmp | cut -f 2 -d " ")
        echo -e "${HEX}  ${NAME}" > results/ascp/{params.rev}
        rm results/ascp/{params.rev}.tmp
        """
