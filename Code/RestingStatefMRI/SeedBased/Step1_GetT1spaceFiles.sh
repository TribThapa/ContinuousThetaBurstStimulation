#!/bin/bash

#Step 1: Enter subID here or into a text file to loop over multiple subjects.
subID=$(</projects/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_ROIanalysis/ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
	cond=$(</projects/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_ROIanalysis/ScriptsUsed/Conditions.txt)	
	
		for cond in $cond; do
	
			#Step 4: Define paths to anat, func, and dicer directories.
			DataDir=/home/ttha0011/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_ROIanalysis
			fMRIPrep_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/4c_fMRIPrep_AROMA/derivatives/fmriprep
			sub_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_ROIanalysis/$subID

			#Step 6: Copy dseg file and bold image to dicer_dir.
			cp $fMRIPrep_dir/$subID/anat/$subID'_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii.gz' $sub_dir
	
		done
done
