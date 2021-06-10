%-----------------------------------------------------------------------
% Job saved on 05-Nov-2019 14:11:09 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

addpath('/usr/local/spm12/matlab2015b.r6685/');

subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011'; 
         'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'}; 

for k=1:length(subID)

ses={'1', '2', '3', '4'};
    
for i=1:length(ses)
%%
matlabbatch{1}.spm.spatial.smooth.data = {['/projects/kg98/Thapa/cTBS_Study/4c_fMRIPrep_AROMA/derivatives/fmriprep/',subID{k},'/ses-',ses{i},'/func/',subID{k},'_ses-',ses{i},'_task-Nback1Ses',ses{i},'_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii']};
%%
for j=1:340
    temp_inputs(j)={['/projects/kg98/Thapa/cTBS_Study/4c_fMRIPrep_AROMA/derivatives/fmriprep/',subID{k},'/ses-',ses{i},'/func/',subID{k},'_ses-',ses{i},'_task-Nback1Ses',ses{i},'_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii,',num2str(j)]};
end

matlabbatch{1}.spm.spatial.smooth.data = temp_inputs';
        
%%
matlabbatch{1}.spm.spatial.smooth.fwhm = [6 6 6];
matlabbatch{1}.spm.spatial.smooth.dtype = 0;
matlabbatch{1}.spm.spatial.smooth.im = 0;
matlabbatch{1}.spm.spatial.smooth.prefix = 's';

spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);

end
end