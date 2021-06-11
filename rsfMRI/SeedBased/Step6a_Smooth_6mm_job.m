%-----------------------------------------------------------------------
% Job saved on 05-Nov-2019 14:11:09 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

% Add SPM
addpath('/usr/local/spm12/matlab2015b.r6685/');

% Enter subject IDs
subID = {'GAB001'; 'GAB002'; 'GAB003'; 'GAB005'; 'GAB006'; 'GAB007'; 'GAB008'; 'GAB009'; 'GAB010'; 'GAB011'; 'GAB012'; 'GAB013'; 'GAB014'; 'GAB015';
         'GAB016'; 'GAB018'; 'GAB019'}; 

% Create for-loop
for k=1:length(subID)

    ses={'1', '2', '3', '4'};
    
    for i=1:length(ses)
        %%
        matlabbatch{1}.spm.spatial.smooth.data = {['..../..../..../..../sub-',subID{k},'/sub-',subID{k},'ses-',ses{i},'_task-Rest',ses{i},'_space-MNI152NLin2009cAsym_variant-2PGSR_regressed-preproc_bold.nii']};
        %%
        
        for j=1:340
            temp_inputs(j)={['..../..../..../..../sub-',subID{k},'/sub-',subID{k},'_ses-',ses{i},'_task-Rest',ses{i},'_space-MNI152NLin2009cAsym_variant-2PGSR_regressed-preproc_bold.nii,',num2str(j)]};
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