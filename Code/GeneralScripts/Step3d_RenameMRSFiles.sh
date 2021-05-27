#!/bin/bash

#This script will reorder tissue_T1w to CSF=1, GM=2, WM=3 (note the alphabetical order to help remember). Currently, with the newer version of fMRIPrep, the tiusses are in this order: GM=1, WM=2, CSF=3.

#Step1: Load FSL.
module purge
module load fsl/5.0.9

#Step 2: Enter subID here or into a text file to loop over multiple subjects.
subID=$(</projects/kg98/Thapa/cTBS_Study/9_Scripts/SubjectIDs.txt)

for subID in $subID; do
		
		#Step 4: Define paths to anat, func, and dicer directories.
		data_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/3_Rawdata_RestOnly
		MRS_dir=$data_dir/'sub-'$subID/MRS


		#Step 7: Rename the desg file (is the output from the new fMRIPrep version) to dseg_old.
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_1' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_2' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_3' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_3.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_W_1' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_W_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_W_2' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_W_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_W_3' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_DLPFC_PRE_W_3.rda' ; 

		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_1' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_2' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_3' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_3.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_W_1' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_W_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_W_2' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_W_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_W_3' $MRS_dir/'MRH084_sub-'$subID'_MR01_RD_VISCORTEX_PRE_W_3.rda' ; 



		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_1' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_2' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_3' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_3.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_W_1' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_W_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_W_2' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_W_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_W_3' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_DLPFC_POST_W_3.rda' ; 

		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_1' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_2' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_3' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_3.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_W_1' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_W_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_W_2' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_W_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_W_3' $MRS_dir/'MRH084_sub-'$subID'_MR02_RD_VISCORTEX_PRE_W_3.rda' ; 


		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_1' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_2' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_3' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_3.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_W_1' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_W_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_W_2' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_W_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_W_3' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_DLPFC_PRE_W_3.rda' ; 

		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_1' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_2' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_3' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_3.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_W_1' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_W_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_W_2' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_W_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_W_3' $MRS_dir/'MRH084_sub-'$subID'_MR03_RD_VISCORTEX_PRE_W_3.rda' ; 


		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_1' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_2' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_3' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_3.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_W_1' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_W_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_W_2' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_W_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_W_3' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_DLPFC_POST_W_3.rda' ; 

		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_1' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_2' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_3' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_3.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_W_1' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_W_1.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_W_2' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_W_2.rda' ; 
		mv $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_W_3' $MRS_dir/'MRH084_sub-'$subID'_MR04_RD_VISCORTEX_POST_W_3.rda' ; 
			
done
