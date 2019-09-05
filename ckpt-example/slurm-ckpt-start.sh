#!/usr/bin/env bash
# slurm script checkpointing example using dmtcp

# Set SLURM options
#SBATCH --job-name=ckpt-start-sample            # Job name
#SBATCH --output=ckpt-start-sample-%j.out       # Standard output and error log
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

# Runs the command "count" through the dmtcp checkpointing tool
# ** -i 10: sets the checkpointing interval to 10 seconds
# ** timeout 15: kills the procoess after 15 seconds
# ** we suggest you always use the --no-coordinator -p 0 options
timeout 15 dmtcp_launch --no-coordinator -p 0 -i 10 ./count 

# End of job info
echo -e "\n\nEnding:   "`date +"%D %T"`
