#!/bin/bash
#SBATCH --job-name=ExtractTimeseries
#SBATCH --account=kg98
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1-00:00:00
#SBATCH --mail-user=tribikram.thapa@monash.edu
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --export=ALL
#SBATCH --mem-per-cpu=12000
#SBATCH --qos=normal
#SBATCH -A kg98

# Load FSL.
module purge
module load fsl

# Enter subjects IDs.
subID=$(<..../..../..../..../ScriptsUsed/SubjectIDs.txt)


for subID in $subID; do
	
	# Enter sesitions.
	ses=$(<..../..../..../..../ScriptsUsed/Sessions.txt)

		for ses in $ses; do
		
		# Define paths to directories.
		fmriprep_dir=/home/ttha0011/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_ROIanalysis
		TimeSeries_dir=$fmriprep_dir/$subID/'TimeSeries'
		MNI_template=$fmriprep_dir/ScriptsUsed/mni_icbm152_t1_tal_nlin_asym_09c_2mm.nii
		Out_dir=$fmriprep_dir/$subID/TimeSeries

		# Create ROI mask.
		echo -e "\nCreating ROI mask for left PFC\n"
		fslmaths $MNI_template -mul 0 -add 1 -roi 28 1 81 1 54 1 0 1 $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFC_left_point' -odt float;
		fslmaths $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFC_left_point' -kernel sphere 5 -fmean $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFC_left_sphere' -odt float;
		fslmaths $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFC_left_sphere' -bin $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFC_left_sphere';

		##################################################################Transform ROI to native space##########################################################################

		# Get initial affine transform that maps T1 to MNI.
		echo -e "\nGetting affine transformation to map T1 to MNI space\n"
		flirt -ref $MNI_template \
		-in $fmriprep_dir/$subID/$subID'_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii.gz' \
		-omat $fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_affine_T1toMNI.mat'; 

		# Use the affine transform to get warp coefficients to convert T1 to MNI space.
		echo -e "\nUsing affine transformation to get warp coefficients to convert T1 to MNI space\n"
		fnirt --ref=$MNI_template \
		--in=$fmriprep_dir/$subID/$subID'_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii.gz' \
		--aff=$fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_affine_T1toMNI.mat';

		# Rename warpcoeffient file to subID and session.
		echo -e "\nRenaming warpcoeff based upon subID and sesition\n"
		mv $fmriprep_dir/$subID/$subID'_space-MNI152NLin2009cAsym_desc-preproc_T1w_warpcoef.nii.gz' $fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_space-MNI152NLin2009cAsym_desc-preproc_T1_to_MNI_warpcoef.nii.gz'; 

		# Inverse the T1_to_MNI warp coefficients to MNI_to_T1 warp. You can use this to convert the PFC sphere to T1 space, as it is currently in MNI space.
		echo -e "\nFlipping T1_to_MNI warp coefficients to MNI_to_T1 warp. You can use this to convert the PFC sphere to T1 space, as it is currently in MNI space\n"
		invwarp --ref=$fmriprep_dir/$subID/$subID'_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii.gz' \
		--warp=$fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_space-MNI152NLin2009cAsym_desc-preproc_T1_to_MNI_warpcoef.nii.gz' \
		--out=$fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_space-MNI152NLin2009cAsym_desc-preproc_MNI_to_T1_warpcoef.nii.gz';

		# Apply the MNI_to_T1 warp to PFC sphere as the PFC sphere is in MNI space. So, we need to convert it to T1 space.
		echo -e "\nApply the MNI_to_T1 warp to PFC sphere as the PFC sphere is in MNI space. So, we need to convert it to T1 space\n"
		applywarp --ref=$fmriprep_dir/$subID/$subID'_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii.gz' \
		--in=$Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFC_left_sphere' \
		--warp=$fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_space-MNI152NLin2009cAsym_desc-preproc_MNI_to_T1_warpcoef.nii.gz' \
		--out=$Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFC_left_sphere_space-T1' \
		--interp=nn;

		# Get matrix to convert T1 to func space.
		echo -e "\nGetting matrix to convert T1 to functional image space\n"
		flirt -ref $fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_space-MNI152NLin2009cAsym_variant-2PGSR_regressed-preproc_bold_smooth.nii' \
		-in $fmriprep_dir/$subID/$subID'_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii.gz' \
		-dof 6 \
		-omat $fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_T1_to_func.mat';

		# Get PFC sphere that is in T1 space to func space.
		flirt -ref $fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_space-MNI152NLin2009cAsym_variant-2PGSR_regressed-preproc_bold_smooth.nii' \
		-in $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFC_left_sphere_space-T1.nii.gz' \
		-init $fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_T1_to_func.mat' \
		-applyxfm \
		-interp nearestneighbour \
		-out $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFCsphere_space-func.nii.gz';

		# Binarise PFC sphere_space-func.
		fslmaths $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFCsphere_space-func.nii.gz' \
		-thr 0.5 \
		-bin $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFCsphere_space-func_bin';

		# Use fslmeants, and the PFC sphere_space-func mask to extract the timeseries from the preproc_bold_smooth.nii file.
		fslmeants -i $fmriprep_dir/$subID/$subID'_ses-'$ses'_task-Rest'$ses'_space-MNI152NLin2009cAsym_variant-2PGSR_regressed-preproc_bold_smooth.nii' \
		-o $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFC_ts.txt' \
		-m $Out_dir/$subID'_ses-'$ses'_task-Rest'$ses'_PFCsphere_space-func_bin';

		done
done

