#!/usr/bin/env bash
# slurm template for serial jobs

# Set SLURM options
#SBATCH --job-name=stataex                     	# Job name
#SBATCH --output=stataex-%j.out             	# Standard output and error log
#SBATCH --mail-user=youremail@middlebury.edu    # Where to send mail	
#SBATCH --mail-type=NONE                        # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --ntasks=1                              # Run a single process
#SBATCH --cpus-per-task=1                       # Run on a single core
#SBATCH --mem=16gb                             	# Job memory request
#SBATCH --partition=standard                    # Partition (queue) 
#SBATCH --time=01:00:00                         # Time limit hrs:min:sec

# print SLURM environment variables
echo "Job ID: ${SLURM_JOB_ID}"
echo "Node: ${SLURMD_NODENAME}"
echo "Starting: "`date +"%D %T"`

# Your process here

stata-mp -qs do stata_auto.do 			# Run the Stata do file in batch mode

echo "Ending: "`date +"%D %T"`
