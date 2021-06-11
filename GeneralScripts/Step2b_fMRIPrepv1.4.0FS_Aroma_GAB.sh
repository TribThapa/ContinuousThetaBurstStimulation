#!/bin/env bash

#SBATCH --job-name=fmriprep
#SBATCH --account=kg98
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=tribikram.thapa@monash.edu
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --export=ALL
#SBATCH --mem-per-cpu=8000
#SBATCH --qos=normal
#SBATCH -A kg98
#SBATCH --array=1-17
#IMPORTANT! set the array range above to exactly the number of people in your SubjectIDs.txt file. e.g., if you have 90 subjects then array should be: --array=1-90

# Path to list with subject IDs
SUBJECT_LIST="/.../.../SubjectIDs.txt"

# comment out SLURM_ARRAY_TASK_ID=1 to run multiple subs
#SLURM_ARRAY_TASK_ID=1
subject=$(sed -n "${SLURM_ARRAY_TASK_ID}p" ${SUBJECT_LIST})
echo -e "\t\t\t --------------------------- "
echo -e "\t\t\t ----- ${SLURM_ARRAY_TASK_ID} ${subject} ----- "
echo -e "\t\t\t --------------------------- \n"

# Define directories
workdir=/..../..../Temp/${subject} 
bidsdir=/.../.../..../rawdata 
derivsdir=/..../..../..../derivatives 
fslicense=/..../.../.../license.txt 

# --------------------------------------------------------------------------------------------------
# MASSIVE modules
module load fmriprep/1.4.0
unset PYTHONPATH

# Run fmriprep
fmriprep \
--participant-label ${subject} \
--output-spaces MNI152NLin2009cAsym T1w \
--use-syn-sdc \
--mem_mb 80000 \
--ignore slicetiming \
-n-cpus 8 \
--use-aroma \
--fs-license-file ${fslicense} \
-w ${workdir} \
${bidsdir} \
${derivsdir} \
participant

# --------------------------------------------------------------------------------------------------

echo -e "\t\t\t ----- DONE ----- "

