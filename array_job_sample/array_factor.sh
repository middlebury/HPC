#!/usr/bin/env bash
# Simple array job sample

# Set SLURM options
#SBATCH --job-name=array_factor                 # Job name
#SBATCH --output=array_factor-%A-%a.out        # Standard output and error log
#SBATCH --mail-user=username@middlebury.edu     # Where to send mail	
#SBATCH --mail-type=NONE                        # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --cpus-per-task=1                       # Run each array job on a single core
#SBATCH --mem=2gb                               # Job memory request
#SBATCH --partition=standard                    # Partition (queue) 
#SBATCH --time=00:15:00                         # Time limit hrs:min:sec
#SBATCH --array=0-9                             # Array range: stets number of array jobs

# print SLURM envirionment variables
echo "Job ID: ${SLURM_JOB_ID}"
echo "Array ID: ${SLURM_ARRAY_TASK_ID}"
echo "Node: ${SLURMD_NODENAME}"
echo "Core: "`core`
echo "Starting: "`date +"%D %T"`

# Your calculations here
python factor_list.py sample_list_16.dat -N ${SLURM_ARRAY_TASK_COUNT} -i ${SLURM_ARRAY_TASK_ID} -o array_factors_out-${SLURM_ARRAY_TASK_ID}.dat

# End of job info
echo "Core: "`core`
echo "Ending:   "`date +"%D %T"`
