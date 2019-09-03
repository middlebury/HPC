#!/usr/bin/env bash
# slurm script checkpointing example

# Set SLURM options
#SBATCH --job-name=dmtcp_test                   # Job name
#SBATCH --output=dmtcp_test-%j.out              # Standard output and error log
#SBATCH --mail-user=username@middlebury.edu     # Where to send mail	
#SBATCH --mail-type=NONE                        # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mem=100mb                             # Job memory request
#SBATCH --partition=standard                    # Partition (queue) 
#SBATCH --time=00:01:00                         # Time limit hrs:min:sec

# print SLURM envirionment variables
echo "Job ID: ${SLURM_JOB_ID}"
echo "Node: ${SLURMD_NODENAME}"
echo "Starting: "`date +"%D %T"`

# Your calculations here
printf "\nHello world from ${SLURMD_NODENAME}!\n"

# Runs the command "python count.py" through the dmtcp checkpointing tool
# * -i 10: sets the checkpointing interval to 10 seconds
# * timeout 25: kills the procoess after 25 seconds
timeout 25 dmtcp_launch -i 10 python count.py 

# End of job info
echo "Ending:   "`date +"%D %T"`