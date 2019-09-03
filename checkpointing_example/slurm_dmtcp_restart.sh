#!/usr/bin/env bash
# slurm script checkpointing restart example

# Set SLURM options
#SBATCH --job-name=dmtcp_restart_test           # Job name
#SBATCH --output=dmtcp_restart_test-%j.out       # Standard output and error log
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

# Resrart the previously checkpointed job via the dmtcp checkpointing tool
# * -i 10: sets the checkpointing interval to 10 seconds
# * timeout 25: kills the procoess after 25 seconds
# * ckpt_*.dmtcp: the dmtcp checkpointing files for job to restart
timeout 25 dmtcp_restart -i 10 ckpt_*.dmtcp

# End of job info
echo "Ending:   "`date +"%D %T"`