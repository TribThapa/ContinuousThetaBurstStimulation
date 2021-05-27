%-----------------------------------------------------------------------
% Job saved on 05-Nov-2019 14:11:09 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

addpath('/usr/local/spm12/matlab2015b.r6685/');

subID = {'GAB001'; 'GAB002'; 'GAB003'; 'GAB004'; 'GAB005'; 'GAB006'; 'GAB007'; 'GAB008'; 'GAB009'; 'GAB010'; 
         'GAB011'; 'GAB012'; 'GAB013'; 'GAB014'; 'GAB015'; 'GAB016'; 'GAB018'; 'GAB019'}; 

for k=1:length(subID)

con={'Nback1Ses1', 'Nback1Ses2', 'Nback1Ses3', 'Nback1Ses4', 'Nback2Ses1', 'Nback2Ses2', 'Nback2Ses3', 'Nback2Ses4'};
    
for i=1:length(con)
%%
matlabbatch{1}.spm.spatial.smooth.data = {['/projects/kg98/Thapa/cTBS_Study/4a_fMRIPrep_AROMA/derivatives/fmriprep/sub-',subID{k},'/func/sub-',subID{k},'task-',con{i}]};
%%
for j=1:119
    temp_inputs(j)={['/projects/kg98/Thapa/cTBS_Study/4b_fMRIPrep_AROMA/derivatives/fmriprep/sub-',subID{k},'/func/sub-',subID{k},'_task-',con{i},'_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii,',num2str(j)]};
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