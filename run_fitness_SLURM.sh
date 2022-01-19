#!/bin/bash


# set partition
#SBATCH -p normal

# set run on big mem nodes
#SBATCH --mem 90000

# set run on bigmem node only
#SBATCH --cpus-per-task 24


# set max wallclock time
#SBATCH --time=47:00:00

# set name of job
#SBATCH --job-name=Fitness

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

# send mail to this address
#SBATCH --mail-user=fischer.sebastian@mh-hannover.de


# Add miniconda3 to PATH
# . /working2/tuem/miniconda3/etc/profile.d/conda.sh
. /mnt/sfb900nfs/groups/tuemmler/miniconda3/etc/profile.d/conda.sh

# Activate env on cluster node
# conda activate fitness_env
conda activate fitness_env_w2

# Run script

bash pipeline_bwa_fitness_analysis.sh



