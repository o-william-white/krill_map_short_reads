#!/bin/bash
#SBATCH --partition=long
#SBATCH --output=job_run_snakemake_%j.out
#SBATCH --error=job_run_snakemake_%j.err
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task=1

source activate sm_map_env

snakemake \
   --jobs 10 \
   --executor slurm \
   --rerun-incomplete \
   --use-conda \
   --default-resources slurm_account=cropdiv-acc slurm_partition=long \
   --set-resources ascp_forward_md5:runtime=60 ascp_forward_md5:mem=1G ascp_forward_md5:slurm_partition=short ascp_forward_md5:cpus_per_task=1 \
                   ascp_reverse_md5:runtime=60 ascp_reverse_md5:mem=1G ascp_reverse_md5:slurm_partition=short ascp_reverse_md5:cpus_per_task=1 \
		   ascp_forward:runtime=10080 ascp_forward:mem=1G ascp_forward:cpus_per_task=1 \
		   ascp_reverse:runtime=10080 ascp_reverse:mem=1G ascp_reverse:cpus_per_task=1 \
                   md5dum_check_forward:runtime=60 md5dum_check_forward:mem=1G md5dum_check_forward:slurm_partition=short md5dum_check_forward:cpus_per_task=1 \
                   md5dum_check_reverse:runtime=60 md5dum_check_reverse:mem=1G md5dum_check_reverse:slurm_partition=short md5dum_check_reverse:cpus_per_task=1 \
                   fastp:runtime=10080 fastp:mem=100G fastp:cpus_per_task=16 \
                   bowtie2_chromosome:runtime=10080 bowtie2_chromosome:mem=100G bowtie2_chromosome:cpus_per_task=16  \
                   bowtie2_hifi:runtime=10080 bowtie2_hifi:mem=100G bowtie2_hifi:cpus_per_task=16 \
                   samtools_view_chromosome:runtime=10080 samtools_view_chromosome:mem=100G samtools_view_chromosome:cpus_per_task=16 \
                   samtools_view_hifi:runtime=10080 samtools_view_hifi:mem=100G samtools_view_hifi:cpus_per_task=16 \
                   samtools_sort_chromosome:runtime=10080 samtools_sort_chromosome:mem=100G samtools_sort_chromosome:cpus_per_task=16 \
                   samtools_sort_hifi:runtime=10080 samtools_sort_hifi:mem=100G samtools_sort_hifi:cpus_per_task=16 

echo Complete!

