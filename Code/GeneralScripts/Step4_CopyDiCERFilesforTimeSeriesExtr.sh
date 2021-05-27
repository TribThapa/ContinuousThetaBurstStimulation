#!/bin/bash

#Step 1: Enter subID here or into a text file to loop over multiple subjects.
#subID=sub-GAB001
subID=$(</projects/kg98/Thapa/cTBS_Study/6_TimeSeriesExtraction/2_DBscanFiles/SubjectIDs.txt)

for subID in $subID; do
	
	#Step 2: Enter conditions.
	cond=$(</projects/kg98/Thapa/cTBS_Study/6_TimeSeriesExtraction/2_DBscanFiles/Conditions.txt)
		
		for cond in $cond; do
		
		#Step 3: Define paths to DiCER directory.
		sub_dicer_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/5_DiCER/12_SameSpace/$subID
		dicer_dir=$sub_dicer_dir/$subID"_"$cond"_dicer_lite0.2"
		dbscan_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/6_TimeSeriesExtraction/2_DBscanFiles/$subID
		timeseries_dir=$dbscan_dir/"TimeSeries"
		
		#Step 4: Make dicrectories if it doesn't exist.
		if [ ! -d $dbscan_dir ]; then mkdir $dbscan_dir; echo "$ID - making directory"; fi
		if [ ! -d $timeseries_dir ]; then mkdir $timeseries_dir; echo "$ID - making directory"; fi	

		#Step 5: Copy tissues segmentations from the anat folder, and AROMA-ed epi from the func folder to the dicer directory created in Step 5.
		cp $dicer_dir/$subID"_task-"$cond"_space-MNI152NLin6Asym_desc-smoothAROMAnonaggr_bold_dbscan.nii.gz" $dbscan_dir
	
		done
done


