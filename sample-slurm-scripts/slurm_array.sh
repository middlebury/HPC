#!/usr/bin/env bash
# slurm template for array jobs

# Set SLURM options
#SBATCH --job-name=array_test                   # Job name
#SBATCH --output=array_test-%A-%a.out           # Standard output and error log
#SBATCH --mail-user=username@middlebury.edu     # Where to send mail	
#SBATCH --mail-type=NONE                        # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mem=100mb                             # Job memory request
#SBATCH --partition=standard                    # Partition (queue) 
#SBATCH --time=00:05:00                         # Time limit hrs:min:sec
#SBATCH --array=0-4                             # Array range

# print SLURM envirionment variables
echo "Job ID: ${SLURM_JOB_ID}"
echo "Array ID: ${SLURM_ARRAY_TASK_ID}"
echo "Node: ${SLURMD_NODENAME}"
echo "Starting: "`date +"%D %T"`

# Your calculations here
printf "\nHello world from array task ${SLURM_ARRAY_TASK_ID}!\n\n"

# End of job info
echo "Ending:   "`date +"%D %T"`
