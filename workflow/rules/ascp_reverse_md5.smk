rule ascp_reverse_md5:
    params:
        rev_md5 = lambda wildcards: wildcards.rev_md5,
        ftp = get_ftp_path,
    output:
        temp("results/ascp_reverse_md5/{sample_id}/{rev_md5}.tmp"),
        "results/ascp_reverse_md5/{sample_id}/{rev_md5}",
    log:
        "logs/ascp_reverse_md5/{sample_id}/{rev_md5}.log",
    conda:
        "../envs/aspera-cli.yaml"
    threads: 1
    shell:
        """
        ascp \
            -i /home/owhite/cnbg_keyfile \
            -P33001 -T -k1 -l1000m \
            aspera_download@183.239.175.39:{params.ftp}/{params.rev_md5} \
            results/ascp_reverse_md5/{wildcards.sample_id}/{wildcards.rev_md5}.tmp &> {log}
        NAM=$(cat results/ascp_reverse_md5/{wildcards.sample_id}/{wildcards.rev_md5}.tmp | cut -f 1 -d " ")
        HEX=$(cat results/ascp_reverse_md5/{wildcards.sample_id}/{wildcards.rev_md5}.tmp | cut -f 2 -d " ")
        echo -e "${{HEX}}  results/ascp_reverse_md5/{wildcards.sample_id}/${{NAM}}" > results/ascp_reverse_md5/{wildcards.sample_id}/{wildcards.rev_md5}
        """
