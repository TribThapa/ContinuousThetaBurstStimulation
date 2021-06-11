#!/bin/bash

# Data directory 
PROJDIR=/..../..../..../cTBS_Study/Rawdata

# Condtions to load from Xnat
#Cond1=RD_HC_DLPFC
#Cond2=RD_DLPFC
#Cond3=RD_DLPFC_2
#Cond4=RD_DLPFC_3
#Cond5=RD_DLPFC_WATER
#Cond6=RD_DLPFC_WATER_2
#Cond7=RD_DLPFC_WATER_3
#Cond8=RD_VIS_CORTEX
#Cond9=RD_VIS_CORTEX_2
#Cond10=RD_VIS_CORTEX_3
#Cond11=RD_VIS_CORTEX_WATER
#Cond12=RD_VIS_CORTEX_WATER_2
#Cond13=RD_VIS_CORTEX_WATER_3
#Cond14=KS_DLPFC
#Cond15=KS_DLPFC_WATER
#Cond16=KS_VIS_CORTEX
#Cond17=KS_VIS_CORTEX_WATER
#Cond18=SC_VOXEL_DLPFC
#Cond19=SC_VOXEL_VIS_CORTEX

#Cond1=mrs_ldlpfc_pos
Cond2=KS_DLPFC
Cond3=RD_DLPFC_2
Cond4=RD_DLPFC_3
Cond5=RD_DLPFC_W1
Cond6=RD_DLPFC_W2
Cond7=RD_DLPFC_W3
Cond8=RD_VC_1
Cond9=RD_VC_2
Cond10=RD_VC_3
Cond11=RD_VC_W1
Cond12=RD_VC_W2
Cond13=RD_VC_W3
Cond14=dlpfc_ks
Cond15=dlpfc_water_ks
Cond16=k_space_svs_vc_
Cond17=k_space_svs_vc_w
Cond18=mrs_vc_pos
#Cond19=k_space_gfm
#Cond20=VCW_POS

# Study ID
STUDY=MRH084_

# Session ID
SESSION=_MR04 #can change to download different sessions

# Subject ID
SUBJIDS=GAB001

# Load modules
module purge;
module load xnat-utils;

# Create for loop to loop over IDs
for ID in $SUBJIDS; do 
	
	# Dynamic directories
	SUBDICOMDIR=$PROJDIR/sub-$ID
	OUTDIR=$SUBDICOMDIR/MRS;
	
	if [ ! -d $OUTDIR ]; then mkdir $OUTDIR; echo "making directory"; fi

	# Create subject's DICOMS folders 
	mkdir -p $SUBDICOMDIR/

	# Download structural scans from XNAT
	cd $SUBDICOMDIR/; xnat-get $STUDY$ID$SESSION	

	# rename scan directories with more reasonable naming conventions

	if [ -d "${SUBDICOMDIR/*$Cond1}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond1- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond1 ; 
	else 
		echo "No $Cond1 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond2}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond2- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond2 ; 
	else 
		echo "No $Cond2 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond3}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond3- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond3 ; 
	else 
		echo "No Cond3 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond4}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond4- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond4 ; 
	else 
		echo "No Cond4 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond5}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond5- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond5 ; 
	else 
		echo "No Cond5 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond6}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond6- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond6 ; 
	else 
		echo "No Cond6 scan for $ID"; 
	fi

	if [ -d "${SUBDICOMDIR/*$Cond7}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond7- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond7 ; 
	else 
		echo "No Cond7 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond8}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond8- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond8 ; 
	else 
		echo "No Cond8 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond9}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond9- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond9 ; 
	else 
		echo "No Cond9 scan for $ID"; 
	fi

	if [ -d "${SUBDICOMDIR/*$Cond10}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond10- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond10 ; 
	else 
		echo "No Cond10 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond11}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond11- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond11 ; 
	else 
		echo "No Cond11 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond12}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond12- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond12 ; 
	else 
		echo "No Cond12 scan for $ID"; 
	fi

	if [ -d "${SUBDICOMDIR/*$Cond13}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond13- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond13 ; 
	else 
		echo "No Cond13 scan for $ID"; 
	fi

	if [ -d "${SUBDICOMDIR/*$Cond14}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond14-.dat $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond14 ; 
	else 
		echo "No Cond14 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond15}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond15-.dat $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond15 ; 
	else 
		echo "No Cond15 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond16}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond16-.dat $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond16 ; 
	else 
		echo "No Cond16 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond17}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond17-.dat $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond17 ; 
	else 
		echo "No Cond17 scan for $ID"; 
	fi

	if [ -d "${SUBDICOMDIR/*$Cond18}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond18- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond18; 
	else 
		echo "No Cond18 scan for $ID"; 
	fi
	
	if [ -d "${SUBDICOMDIR/*$Cond19}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond19- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond19 ; 
	else 
		echo "No Cond19 scan for $ID"; 
	fi	

	if [ -d "${SUBDICOMDIR/*$Cond20}" ]; then 
		mv $SUBDICOMDIR/$STUDY$ID$SESSION/*$Cond20- $OUTDIR/$STUDY'sub-'$ID$SESSION'_'$Cond20 ; 
	else 
		echo "No Cond20 scan for $ID"; 
	fi

done
