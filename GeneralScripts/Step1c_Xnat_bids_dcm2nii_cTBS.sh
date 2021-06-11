#!/bin/bash

# Data directory
PROJDIR=/.../..../cTBS_Study
DICOMDIR=$PROJDIR/1_DicomDir
RAWDATADIR=$PROJDIR/3_Rawdata


if [ ! -d $PROJDIR ]; then mkdir $PROJDIR; echo "making directory"; fi
if [ ! -d $DICOMDIR ]; then mkdir $DICOMDIR; echo "making directory"; fi
if [ ! -d $RAWDATADIR ]; then mkdir $RAWDATADIR; echo "making directory"; fi

# Define conditions to get from Xnat
CONDITION_1=D_ep2D_1_task_bold
CONDITION_2=D_ep2D_2_task_bold

# Enter study and session ID
STUDY=MRH084_
SESSION=_MR04 #can change to download different sessions

# Text file containing subject IDs
# These IDs just need to be the last three digits (zero padded) i.e. 007, 098, 231, etc
# Change to point to directory where text file is located
SUBJIDS=GAB003
#SUBJIDS=$(</projects/kg98/Thapa/cTBS_Study/9_Scripts/SubjectIDs.txt)

# Load modules
module purge;
module load xnat-utils;
# Load the dcm2niix software
module load mricrogl/1.0.20170207
# Module toggles (on/off)
MODULE1=1 #dcm2niix

# Create for loop to loop over IDs
for ID in $SUBJIDS; do 
	
	# Dynamic directories
	SUBDICOMDIR=$DICOMDIR/sub-$ID
	OUTDIR=$RAWDATADIR/sub-$ID;
	EPIOUTDIR=$OUTDIR/func;

	# Create subject's DICOMS folders 
	mkdir -p $SUBDICOMDIR/

	# Download resting state scans from XNAT
	cd $SUBDICOMDIR/; xnat-get $STUDY$ID$SESSION --scans $CONDITION_1;
	cd $SUBDICOMDIR/; xnat-get $STUDY$ID$SESSION --scans $CONDITION_2;


	# Delete intermediate folders
	mv $SUBDICOMDIR/$STUDY$ID$SESSION/* $SUBDICOMDIR

	rm -rf $SUBDICOMDIR/$STUDY$ID$SESSION

	# Rename scan directories with more reasonable naming conventions

	# fMRI
	if [ -d "${SUBDICOMDIR/*$CONDITION_1}" ]; then 
		mv $SUBDICOMDIR/"33-"D_ep2D_1_task_bold $SUBDICOMDIR/ses4_Nback1; 
	else 
		echo "No Nback1 scan for $ID"; 
	fi	

	if [ -d "${SUBDICOMDIR/*$CONDITION_1}" ]; then 
		mv $SUBDICOMDIR/"34-"D_ep2D_2_task_bold $SUBDICOMDIR/ses4_Nback2; 
	else 
		echo "No Nback2 scan for $ID"; 
	fi	
	# Populate rawdata dir with subjects folders

	if [ ! -d $OUTDIR ]; then mkdir $OUTDIR; echo "$ID - making directory"; fi
	if [ ! -d $EPIOUTDIR ]; then mkdir $EPIOUTDIR; echo "$ID - making func directory"; fi


	################################ MODULE 1: dcm2niix convert #######################################
	if [ $MODULE1 = "1" ]; then
		echo -e "\nRunning MODULE 1: dcm2niix $ID \n"		

		#Rest_data
	
		dcm2niix -f "sub-"$ID"_ses-4_task-Nback1_bold" -o $EPIOUTDIR -b -m n -z y $SUBDICOMDIR"/ses4_Nback1"
		
		dcm2niix -f "sub-"$ID"_ses-4_task-Nback2_bold" -o $EPIOUTDIR -b -m n -z y $SUBDICOMDIR"/ses4_Nback2"

	
		echo -e "\nFinished MODULE 1: dcm2niix convert: $ID \n"
	else
		echo -e "\nSkipping MODULE 1: dcm2niix convert: $ID \n"
	fi
	###################################################################################################


done
