#!/bin/bash

# Your project paths on your local machine/MASSIVE
PROJDIR=/projects/kg98/Thapa/cTBS_Study
DICOMDIR=$PROJDIR/1_DicomDir
RAWDATADIR=$PROJDIR/2_Rawdata_RestOnly


if [ ! -d $PROJDIR ]; then mkdir $PROJDIR; echo "making directory"; fi
if [ ! -d $DICOMDIR ]; then mkdir $DICOMDIR; echo "making directory"; fi
if [ ! -d $RAWDATADIR ]; then mkdir $RAWDATADIR; echo "making directory"; fi


# These variables are based on the name of your project and scans on XNAT
# Please edit them accordingly
# Often, scans are named differently on XNAT
# See "First level data cleaning on XNAT" in Evernote for instructions
# After running this script, please check whether all scans are there
# If they are missing, go back on XNAT and see if the scans are named differently

ANATOMICAL=Done_t1_mprage_sag_1_iso
STUDY=MRH084_
SESSION=_MR04 #can change to download different sessions

# Text file containing subject IDs
# These IDs just need to be the last three digits (zero padded) i.e. 007, 098, 231, etc
# Change to point to directory where text file is located
#SUBJIDS=023
SUBJIDS=$(</projects/kg98/Thapa/cTBS_Study/9_Scripts/SubjectIDs.txt)

# load modules
module purge;
module load xnat-utils;
# Load the dcm2niix software
module load mricrogl/1.0.20170207
# Module toggles (on/off)
MODULE1=1 #dcm2niix

# create for loop to loop over IDs
for ID in $SUBJIDS; do 
	
	# Dynamic directories
	SUBDICOMDIR=$DICOMDIR/sub-$ID
	OUTDIR=$RAWDATADIR/sub-$ID;
	T1OUTDIR=$OUTDIR/anat;

	# Create subject's DICOMS folders 
	mkdir -p $SUBDICOMDIR/

	# Download structural scans from XNAT
	cd $SUBDICOMDIR/; xnat-get $STUDY$ID$SESSION --scans $ANATOMICAL;


	# Delete intermediate folders
	mv $SUBDICOMDIR/$STUDY$ID$SESSION/* $SUBDICOMDIR

	rm -rf $SUBDICOMDIR/$STUDY$ID$SESSION

	# rename scan directories with more reasonable naming conventions

	# t1
	if [ -d "${SUBDICOMDIR/*$ANATOMICAL}" ]; then 
		mv $SUBDICOMDIR/*"2-"$ANATOMICAL $SUBDICOMDIR/T1; 
	else 
		echo "No T1 scan for $ID"; 
	fi
	
	
	# populate rawdata dir with subjects folders

	if [ ! -d $OUTDIR ]; then mkdir $OUTDIR; echo "$ID - making directory"; fi
	if [ ! -d $T1OUTDIR ]; then mkdir $T1OUTDIR; echo "$ID - making anat directory"; fi
	
	################################ MODULE 1: dcm2niix convert #######################################
	
	if [ $MODULE1 = "1" ]; then
		
		echo -e "\nRunning MODULE 1: dcm2niix $ID \n"
		
		# t1
		dcm2niix -f "sub-"$ID"_T1w"$SESSION -o $T1OUTDIR -b -m n -z y $SUBDICOMDIR"/T1/"
			
				
		echo -e "\nFinished MODULE 1: dcm2niix convert: $ID \n"
	else
		echo -e "\nSkipping MODULE 1: dcm2niix convert: $ID \n"
	fi
	###################################################################################################


done
