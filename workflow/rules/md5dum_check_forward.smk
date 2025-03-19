rule md5sum_check_forward:
    params:
        fwd = lambda wildcards: wildcards.fwd,
    input:
        fwd = "results/ascp_forward/{sample_id}/{fwd}",
        md5 = "results/ascp_forward_md5/{sample_id}/{fwd}.md5",
    output:
        "results/md5sum_check_forward/{sample_id}/{fwd}.txt"
    log:
        "logs/md5sum_check_forward/{sample_id}/{fwd}.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        md5sum -c {input.md5} 1> {output} 2> {log}
        """
