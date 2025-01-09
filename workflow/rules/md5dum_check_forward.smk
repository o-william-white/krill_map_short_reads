checkpoint md5sum_check_forward:
    input:
        fwd = "results/ascp/{sample}_R1.fq.gz",
        md5 = "results/ascp/{sample}_R1.fq.gz.md5",
    output:
        "results/md5sum_check/{sample}_R1.txt"       
    log:
        "logs/md5sum_check/{sample}_R1.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        md5sum -c {md5} 1> {out} 2> {log}
        """

