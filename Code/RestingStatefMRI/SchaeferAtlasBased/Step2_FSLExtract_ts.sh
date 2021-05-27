#Step 1: Load FSL.
module load fsl

#Step 2: Enter subjects IDs.
subID=$(</projects/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_WholeBrainTS_Schaeferanalysis/ScriptsUsed/SubjectIDs.txt)

for subID in $subID; do
	
	#Step 3: Enter conditions.
	Cond=$(</projects/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_WholeBrainTS_Schaeferanalysis/ScriptsUsed/Conditions.txt)
		
		for Cond in $Cond; do
		
		#Step 4: Define paths to directories.
		DataDir=/home/ttha0011/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_WholeBrainTS_Schaeferanalysis
		MaskDir=$DataDir/ScriptsUsed/Schaefer2018_300Parcels_7Networks_order_FSLMNI152_2mm.nii.gz
		Func_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/4c_fMRIPrep_AROMA/derivatives/fmriprep/$subID/ses-$Cond/func		
		TimeSeriesDir=$DataDir/$subID/'TimeSeries'
		
		#Step 5: Use fslmeants to extract TimeSeries.
		fslmeants -i $Func_dir/$subID'_ses-'$Cond'_task-Rest'$Cond'_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii' \
		-o $TimeSeriesDir/$subID'_ses-'$Cond'_task-Rest'$Cond'_Schaefer300_ts.txt' \
		--label=$MaskDir \
		--transpose ;

	done 
done


