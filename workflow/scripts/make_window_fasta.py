import argparse
import gzip
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
from Bio.SeqIO.FastaIO import FastaTwoLineWriter

# create main parser
parser = argparse.ArgumentParser(
    prog="make_windows_fasta.py",
    description="Simple python script to get split fasta based on window size",
    usage="make_windows_fasta.py --input [fasta] --output [OUTPUT] --window [WINDOW] --genome [GENOME]"
    )

# arguments
parser.add_argument("--input",   help="Input fasta",  required = True)
parser.add_argument("--output",  help="Output fasta", required = True)
parser.add_argument("--window",  help="Window size",  required = True, type=int)
parser.add_argument("--genome",  help="Genome file", required = True)
parser.add_argument("--version", action="version", version="0.0")

# parse the command-line arguments
args = parser.parse_args()

# read in genome to dictionary once 
print(f"Reading {args.input} into dictionary")
dict_genome = {}
with gzip.open(args.input, "rt") as handle:
    for record in SeqIO.parse(handle, "fasta"):
        print(f"...{record.id}")
        dict_genome[record.id] = record.seq

# function to extract fasta from dictionary
def getfasta(chrom, start, stop):
    subset_seq = SeqRecord(dict_genome[chrom][start:stop],
                           id=f"{chrom}:{start}-{stop}", 
                           description="")
    return subset_seq

# function to generate windows based on genome file
def generate_windows(genome_file, window_size):
    with open(genome_file, "r") as g:
        for line in g:
            line=line.rstrip("\n").split("\t") 
            name, length = line[0], int(line[1])
            # create windows with range
            for i in range(0, length, window_size):
                # write to fasta
                if i+window_size < length:
                    yield getfasta(name, i, i+window_size)
                else:
                    yield getfasta(name, i, length)

# write all records in chunks of 100 to manage memory use
chunk_size=100
print(f"Writing sequences to {args.output} in chunks of {chunk_size}")
with gzip.open(args.output, "wt") as handle:
    writer = FastaTwoLineWriter(handle)
    chunk = []
    for record in generate_windows(args.genome, args.window):
        chunk.append(record)
        if len(chunk) == chunk_size:
            writer.write_file(chunk)
            # reset chunk 
            chunk = []
    # write any remaining records
    if chunk:
        writer.write_file(chunk)

