#!/bin/bash

# Enter subID here or into a text file to loop over multiple subjects
subID=$(<..../..../..../..../ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
	cond=$(<..../..../..../..../ScriptsUsed/Conditions.txt)	
	
		for cond in $cond; do
	
			# Define paths to anat, func directories
			DataDir=/..../..../..../ROIanalysis
			fMRIPrep_dir=/..../....fMRIPrep/derivatives/fmriprep
			sub_dir=/..../..../..../$subID

			# Copy dseg file and bold image to dicer_dir
			cp $fMRIPrep_dir/$subID/anat/$subID'_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii.gz' $sub_dir
	
		done
done
