#!/bin/bash

# Load FSL.
module purge
module load fsl/5.0.9

# Enter subID here or into a text file to loop over multiple subjects
subID=$(</projects/kg98/Thapa/cTBS_Study/9_Scripts/SubjectIDs.txt)

# Create for loop to re-name MRS files
for subID in $subID; do
		
		# Define paths to anat, func, and dicer directories
		data_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/3_Rawdata_RestOnly
		MRS_dir=$data_dir/'sub-'$subID/MRS


		# Rename files
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
