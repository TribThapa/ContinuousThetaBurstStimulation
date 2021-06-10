#!/bin/bash

#This script will reorder tissue_T1w to CSF=1, GM=2, WM=3 (note the alphabetical order to help remember). Currently, with the newer version of fMRIPrep, the tiusses are in this order: GM=1, WM=2, CSF=3.

#Step1: Load FSL.
module purge
module load fsl/5.0.9

#Step 2: Enter subID here or into a text file to loop over multiple subjects.
subID=$(</projects/kg98/Thapa/cTBS_Study/9_Scripts/SubjectIDs.txt)

for subID in $subID; do
		
		#Step 4: Define paths to anat, func, and dicer directories.
		FuncDir=/home/ttha0011/kg98/Thapa/cTBS_Study/4b_fMRIPrep_AROMA/rawdata/$subID/func		
		OutDir=/home/ttha0011/kg98/Thapa/cTBS_Study/4c_fMRIPrep_AROMA/rawdata/$subID		


		cp $FuncDir/$subID'_task-Rest1_bold.json' $OutDir/'ses-1/func/'$subID'_ses-1_task-Rest1_bold.json'
		cp $FuncDir/$subID'_task-Rest1_bold.nii.gz' $OutDir/'ses-1/func/'$subID'_ses-1_task-Rest1_bold.nii.gz'

		cp $FuncDir/$subID'_task-Rest2_bold.json' $OutDir/'ses-2/func/'$subID'_ses-2_task-Rest2_bold.json'
		cp $FuncDir/$subID'_task-Rest2_bold.nii.gz' $OutDir/'ses-2/func/'$subID'_ses-2_task-Rest2_bold.nii.gz'

		cp $FuncDir/$subID'_task-Rest3_bold.json' $OutDir/'ses-3/func/'$subID'_ses-3_task-Rest3_bold.json'
		cp $FuncDir/$subID'_task-Rest3_bold.nii.gz' $OutDir/'ses-3/func/'$subID'_ses-3_task-Rest3_bold.nii.gz'

		cp $FuncDir/$subID'_task-Rest3_bold.json' $OutDir/'ses-4/func/'$subID'_ses-4_task-Rest4_bold.json'
		cp $FuncDir/$subID'_task-Rest3_bold.nii.gz' $OutDir/'ses-4/func/'$subID'_ses-4_task-Rest4_bold.nii.gz'
			
done
