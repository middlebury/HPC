#!/usr/bin/env bash
# slurm example for multicore jobs 

# Set SLURM options
#SBATCH --job-name=mtbench-parallel             # Job name
#SBATCH --output=mtbench-parallel-%j.out           # Standard output and error log
#SBATCH --mail-user=username@middlebury.edu     # Where to send mail	
#SBATCH --mail-type=NONE                        # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mem=2gb                               # Job memory request
#SBATCH --cpus-per-task=16                      # Number of CPU cores
#SBATCH --partition=standard                    # Partition (queue) 
#SBATCH --time=00:05:00                         # Time limit hrs:min:sec

# print SLURM envirionment variables
echo "Job ID: ${SLURM_JOB_ID}"
echo "Node: ${SLURMD_NODENAME}"
echo "CPUs: ${SLURM_CPUS_ON_NODE}"
echo "Starting: "`date +"%D %T"`

# Module node currenlty visible on node--need to hardcode path
#module load python/anaconda2

# Your calculations here
printf "\nHello world from ${SLURMD_NODENAME}!\n\n"

python mp_benchmark.py ${SLURM_CPUS_ON_NODE}

# End of job info
echo -e "\nEnding:   "`date +"%D %T"`
