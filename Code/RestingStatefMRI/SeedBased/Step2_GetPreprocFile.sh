#!/bin/bash

subID=$(</projects/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_ROIanalysis/ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
	ses=$(</projects/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_ROIanalysis/ScriptsUsed/Sessions.txt)	 
	
		for ses in $ses; do

			DataDir=/home/ttha0011/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_ROIanalysis
			fMRIPrep_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/4c_fMRIPrep_AROMA/derivatives/fmriprep
			sub_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_ROIanalysis/$subID

			cp $fMRIPrep_dir/$subID/'ses-'$ses/func/$subID'_ses-'$ses'_task-Rest'$ses'_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz' $sub_dir

		done
done
