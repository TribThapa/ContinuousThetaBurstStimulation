#!/bin/bash

# Enter subID here or into a text file to loop over multiple subjects
subID=$(<..../..../..../..../ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
	ses=$(<..../..../..../..../ScriptsUsed/Sessions.txt)	 
	
		for ses in $ses; do

			# Define paths to anat, func directories
			DataDir=/..../..../..../ROIanalysis
			fMRIPrep_dir=/..../..../fMRIPrep/derivatives/fmriprep
			sub_dir=/..../..../..../$subID

			# Copy files
			cp $fMRIPrep_dir/$subID/'ses-'$ses/func/$subID'_ses-'$ses'_task-Rest'$ses'_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz' $sub_dir

		done
done
