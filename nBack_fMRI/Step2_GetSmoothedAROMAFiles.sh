#!/bin/bash

# Define location for text file with subject IDs
subID=$(</..../..../SubjectIDs.txt)

# Create for loop to get files
for subID in $subID; do
	
	ses=$(</.../.../.../Sessions.txt)	 
	
		for ses in $ses; do

			fMRIPrep_dir=/..../..../fMRIPrep/derivatives/fmriprep
			sub_dir=/..../..../TaskData/$subID

			cp $fMRIPrep_dir/$subID/'ses-'$ses/func/'s'$subID* $sub_dir

		done
done
