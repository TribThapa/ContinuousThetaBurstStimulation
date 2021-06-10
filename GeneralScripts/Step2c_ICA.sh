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
#SBATCH --mem-per-cpu=8G
#SBATCH --qos=normal
#SBATCH -A kg98
#SBATCH --array=1
#IMPORTANT! set the array range above to exactly the number of people in your SubjectIDs.txt file. e.g., if you have 90 subjects then array should be: --array=1-90

SUBJECT_LIST="/home/ttha0011/kg98/Thapa/cTBS_Study/4b_fMRIPrep_AROMA/SubjectIDs_ICA.txt"

#SLURM_ARRAY_TASK_ID=1
subject=$(sed -n "${SLURM_ARRAY_TASK_ID}p" ${SUBJECT_LIST})
echo -e "\t\t\t --------------------------- "
echo -e "\t\t\t ----- ${SLURM_ARRAY_TASK_ID} ${subject} ----- "
echo -e "\t\t\t --------------------------- \n"

# paths
workdir=/projects/kg98/Thapa/cTBS_Study/4b_fMRIPrep_AROMA/Temp/${subject}
bidsdir=/home/ttha0011/kg98/Thapa/cTBS_Study/4b_fMRIPrep_AROMA/rawdata 
derivsdir=/home/ttha0011/kg98/Thapa/cTBS_Study/4b_fMRIPrep_AROMA/derivatives 
fslicense=/home/ttha0011/kg98/Thapa/Scripts/license.txt # path and freesurfer licence .txt file. Download your own from freesurfer website and store. Or just leave it and use mine!

# --------------------------------------------------------------------------------------------------
# perform non-aggressive ICA-AROMA on unsmoothed MNI/T1w fmriprep outputs
module purge
module load fsl/5.0.9

task=REST1
derivsdir_subj=${derivsdir}/fmriprep/${subject}/func/
#use fsl_regfilt to gain insight into unexpected artefacts or activation in your data
# if -f= if file exists function
#-i=input data on which desnoising will be performed; 
#-f=filter out part of the regresssion model;
#-d=design matrix (GLM or melodic mixing matrix)
#-o=output file name of the denoised data

#if -f= if file exists function
#&& = and function
#|| = or function 
#awk = commnand of processing or analysing text files organised in rows and columns. 
#awk -v = version
#awk -O = Enable awks default optimizations on the internal representation of the program. At the moment, this includes simple constant folding and tail recursion elimination in function calls.
#awk -F = field separator. Controls the way awk splits an input record into fields. awk scans the input record for character sequences that match the separator; the fields themselves are the text between the matches.
#awk -S = --sandbox. Useful when you want to run awk scripts from questionable sources and need to make sure the scripts can't access your system (other than the specified input data file).
#NR = number of records in the input file
#NF = number fo fields in the current record
#sed = stream editor
#sed -e = expression script
#sort = Prints lines of its input or concatenation of all files listed in its argument list in sorted order. Sorting is done based on one or more sort keys extracted from each line of input.
#sort nu = unique numerical sort
#tail = print the last 10 lines 
#tail -n = output the last k (number of  bytes or lines) lines
#expr = evaluates an expression and outputs the corresponding value.
#fsl_regfilt -a = switches on aggressive filtering (full instead of partial regression)

# perform aggressive ICA-AROMA+2P on unsmoothed MNI/T1w fmriprep outputs


if [ -f "${derivsdir_subj}${subject}_task-${task}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz" ] || [ -f "${derivsdir_subj}${subject}_task-${task}_space-T1w_desc-preproc_bold.nii.gz" ]; then
    cd ${derivsdir_subj}
   
	# first, get wm/csf columns out of confounds file
    awk -v OFS='\t' '{if(NR>1)print $1,$2}' ${subject}_task-${task}_desc-confounds_regressors.tsv > wmcsfgsr.tsv
    
	# append to melodic mix
    paste ${subject}_task-${task}_desc-MELODIC_mixing.tsv wmcsfgsr.tsv > conf.tsv
    mv conf.tsv conf.tsv.in
    sed -e $'s/\t\t/\t/g' conf.tsv.in > conf.tsv # fix double tab issue following paste
    rm conf.tsv.in
    
	# build custom confound files and indices
    numCol=$(awk '{print NF}' ${subject}_task-${task}_desc-MELODIC_mixing.tsv | sort -nu | tail -n 1) # number of MELODIC columns
    expr $numCol + 1 > csf_idx.txt # idx of appended csf column
    expr $numCol + 2 > wm_idx.txt # idx of appended wm column
    paste -d , csf_idx.txt wm_idx.txt > idx.csv # idx of appended csf/wm columns
    rm csf_idx.txt wm_idx.txt
    paste -d , ${subject}_task-${task}_AROMAnoiseICs.csv idx.csv > conf_idx.csv # append csf/wm indices to AROMA noise indices
fi


#CLEAN T1w
if [ -f "${derivsdir_subj}${subject}_task-${task}_space-T1w_desc-preproc_bold.nii.gz" ]; then
    echo "AROMA+2P denoising: space-T1w_preproc"
    cd ${derivsdir_subj}
    # clean T1w
    fsl_regfilt -i ${subject}_task-${task}_space-T1w_desc-preproc_bold.nii.gz \
        -a \
        -f $(cat conf_idx.csv) \
        -d conf.tsv \
        -o ${subject}_task-${task}_space-T1w_variant-AROMAagg+2P_desc-preproc_bold.nii.gz
fi

#CLEAN PreprocBold2MNI
if [ -f "${derivsdir_subj}${subject}_task-${task}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz" ]; then
    echo "AROMA+2P denoising: space-MNI152NLin2009cAsym_preproc"
    cd ${derivsdir_subj}
    # clean PreprocBold2MNI
    fsl_regfilt -i ${subject}_task-${task}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz \
        -a \
        -f $(cat conf_idx.csv) \
        -d conf.tsv \
        -o ${subject}_task-${task}_space-MNI152NLin2009cAsym_variant-AROMAagg+2P_desc-preproc_bold.nii.gz
fi
# ------------------------------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------------------------------------------------

echo -e "\t\t\t ----- DONE ----- "

echo -e "\t\t\t ----- DONE ----- "

