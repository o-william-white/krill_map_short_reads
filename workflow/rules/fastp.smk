rule fastp:
    input:
        sample=get_fastp_input,
    output:
        trimmed = [temp("results/fastp/{sample_id}_R1.fastq.gz"), temp("results/fastp/{sample_id}_R2.fastq.gz")],
        unpaired1 = temp("results/fastp/{sample_id}_u1.fastq.gz"),
        unpaired2 = temp("results/fastp/{sample_id}_u2.fastq.gz"),
        failed = temp("results/fastp/{sample_id}.failed.fastq.gz"),
        html="results/fastp/{sample_id}_fastp.html",
        json="results/fastp/{sample_id}_fastp.json",
    log:
        "logs/fastp/{sample_id}.log",
    params:
        "--adapter_sequence ACGGCTAGCTA --adapter_sequence_r2 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC"
    threads: 2
    wrapper:
        "v3.13.8/bio/fastp"
