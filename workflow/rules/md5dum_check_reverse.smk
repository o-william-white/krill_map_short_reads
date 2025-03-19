rule md5sum_check_reverse:
    params:
        rev = lambda wildcards: wildcards.rev,
    input:
        rev = "results/ascp_reverse/{sample_id}/{rev}",
        md5 = "results/ascp_reverse_md5/{sample_id}/{rev}.md5",
    output:
        "results/md5sum_check_reverse/{sample_id}/{rev}.txt"
    log:
        "logs/md5sum_check_reverse/{sample_id}/{rev}.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        md5sum -c {input.md5} 1> {output} 2> {log}
        """
