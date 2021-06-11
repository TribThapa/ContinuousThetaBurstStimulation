#!/bin/bash

# Load FSL.
module purge
module load fsl/5.0.9

# Enter subID here or into a text file to loop over multiple subjects.
subID=$(</projects/kg98/Thapa/cTBS_Study/9_Scripts/SubjectIDs.txt)

# Create for-loop
for subID in $subID; do
		
		# Define paths to relevant directories.
		FuncDir=/..../relevant/dir/$subID		
		OutDir=/..../dir/to/save/to/$subID		

		# Copy files
		cp $FuncDir/$subID'_task-Rest1_bold.json' $OutDir/'ses-1/func/'$subID'_ses-1_task-Rest1_bold.json'
		cp $FuncDir/$subID'_task-Rest1_bold.nii.gz' $OutDir/'ses-1/func/'$subID'_ses-1_task-Rest1_bold.nii.gz'

		cp $FuncDir/$subID'_task-Rest2_bold.json' $OutDir/'ses-2/func/'$subID'_ses-2_task-Rest2_bold.json'
		cp $FuncDir/$subID'_task-Rest2_bold.nii.gz' $OutDir/'ses-2/func/'$subID'_ses-2_task-Rest2_bold.nii.gz'

		cp $FuncDir/$subID'_task-Rest3_bold.json' $OutDir/'ses-3/func/'$subID'_ses-3_task-Rest3_bold.json'
		cp $FuncDir/$subID'_task-Rest3_bold.nii.gz' $OutDir/'ses-3/func/'$subID'_ses-3_task-Rest3_bold.nii.gz'

		cp $FuncDir/$subID'_task-Rest3_bold.json' $OutDir/'ses-4/func/'$subID'_ses-4_task-Rest4_bold.json'
		cp $FuncDir/$subID'_task-Rest3_bold.nii.gz' $OutDir/'ses-4/func/'$subID'_ses-4_task-Rest4_bold.nii.gz'
			
done
