# Load FSL.
module load fsl

# Enter subjects IDs.
subID=$(</..../..../..../..../SubjectIDs.txt)

for subID in $subID; do
	
	# Enter conditions.
	Cond=$(</..../..../..../..../Conditions.txt)
		
		for Cond in $Cond; do
		
		# Define paths to directories.
		DataDir=..../..../....WholeBrainTS_Schaeferanalysis
		MaskDir=$DataDir/..../..../Schaefer2018_300Parcels_7Networks_order_FSLMNI152_2mm.nii.gz
		Func_dir=/..../..../fMRIPrep/derivatives/fmriprep/$subID/ses-$Cond/func		
		TimeSeriesDir=$DataDir/$subID/'TimeSeries'
		
		# Use fslmeants to extract TimeSeries.
		fslmeants -i $Func_dir/$subID'_ses-'$Cond'_task-Rest'$Cond'_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii' \
		-o $TimeSeriesDir/$subID'_ses-'$Cond'_task-Rest'$Cond'_Schaefer300_ts.txt' \
		--label=$MaskDir \
		--transpose ;

	done 
done


