#!/bin/bash

subID=$(</projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
	ses=$(</projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/ScriptsUsed/Sessions.txt)	 
	
		for ses in $ses; do

			fMRIPrep_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/4c_fMRIPrep_AROMA/derivatives/fmriprep
			sub_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/$subID

			cp $fMRIPrep_dir/$subID/'ses-'$ses/func/'s'$subID* $sub_dir

		done
done
