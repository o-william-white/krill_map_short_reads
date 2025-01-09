rule fastp:
    input:
        sample=["results/ascp/{sample}_R1.fq.gz", "results/ascp/{sample}_R2.fq.gz"],
    output:
        trimmed = [temp("results/fastp/{sample}_R1.fastq.gz"), temp("results/fastp/{sample}_R2.fastq.gz")],
        unpaired1 = temp("results/fastp/{sample}_u1.fastq.gz"), 
        unpaired2 = temp("results/fastp/{sample}_u2.fastq.gz"),
        failed = temp("results/fastp/{sample}.failed.fastq.gz"),
        html="results/fastp/{sample}_fastp.html",
        json="results/fastp/{sample}_fastp.json",
    log:
        "logs/fastp/{sample}.log",
    params:
        "--adapter_sequence ACGGCTAGCTA --adapter_sequence_r2 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC"
    threads: 2
    wrapper:
        "v3.13.8/bio/fastp"

