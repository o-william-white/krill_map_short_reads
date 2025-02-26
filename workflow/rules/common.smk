import pandas as pd
import sys
from snakemake.utils import min_version


# define min version
min_version("8.4.12")


# set configfile
configfile: "config/config.yaml"


# read sample data
if os.path.exists(config["samples"]):
    sample_data = pd.read_csv(config["samples"], sep="\t").set_index("ID", drop=False)
else:
    sys.exit(f"Error: samples file '{config['samples']}' does not exist")


# get reference 
reference = config["reference"]


# functions to get metadata sample list
def get_ftp_path(wildcards):
    return sample_data.loc[wildcards.sample, "ftp_path"]

def get_forward(wildcards):
    return sample_data.loc[wildcards.sample, "forward"]

def get_reverse(wildcards):
    return sample_data.loc[wildcards.sample, "reverse"]

def get_forward_md5(wildcards):
    return sample_data.loc[wildcards.sample, "forward_md5"]

def get_reverse_md5(wildcards):
    return sample_data.loc[wildcards.sample, "reverse_md5"]

