#!/usr/bin/env bash
# Simple serial job sample 

# Set SLURM options
#SBATCH --job-name=serial_factor		        # Job name
#SBATCH --output=serial_factor-%j.out           # Standard output and error log
#SBATCH --mail-user=username@middlebury.edu     # Where to send mail	
#SBATCH --mail-type=NONE                        # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --cpus-per-task=1                       # Run on a single core
#SBATCH --mem=2gb                               # Job memory request
#SBATCH --partition=standard                    # Partition (queue) 
#SBATCH --time=00:15:00                         # Time limit hrs:min:sec

# print SLURM envirionment variables
echo "Job ID: ${SLURM_JOB_ID}"
echo "Array ID: ${SLURM_ARRAY_TASK_ID}"
echo "Node: ${SLURMD_NODENAME}"
echo "Core: "`core`
echo "Starting: "`date +"%D %T"`

# Your calculations here
python factor_list.py sample_list_16.dat -o serial_factors_out.dat

# End of job info
echo "Core: "`core`
echo "Ending:   "`date +"%D %T"`
