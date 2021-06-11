%-----------------------------------------------------------------------
% Job saved on 25-Feb-2020 07:50:27 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clc; clear all; close all

addpath('/usr/local/spm12/matlab2015b.r6685/');

% Enter subject IDs
subID = {'GAB001', 'GAB002', 'GAB003', 'GAB005', 'GAB006', 'GAB007', 'GAB008', 'GAB009', 'GAB010', 'GAB011', 'GAB012', 'GAB013', 'GAB014', 'GAB015', 
         'GAB016', 'GAB018', 'GAB019'};

for k = 1:length(subID)
    matlabbatch{1}.spm.stats.fmri_spec.dir = {['..../..../..../..../sub-',subID{k},'/Rest1vRest2']};
    matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
    matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 1.418;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
    
    for j = 1:340
        Rest1(j) = {['..../..../..../..../sub-',subID{k},'/sub-',subID{k},'_ses-1_task-Rest1_space-MNI152NLin2009cAsym_variant-2PGSR_regressed-preproc_bold_smooth.nii,',num2str(j)]};
    end
          
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).scans = Rest1';
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi = {''};
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi_reg = {['..../..../..../..../sub-',subID{k},'/TimeSeries/sub-',subID{k},'_ses-1_task-Rest1_PFC_ts.txt']};
    matlabbatch{1}.spm.stats.fmri_spec.sess(1).hpf = 128;    
%%
    for l = 1:340
        Rest2(l) = {['..../..../..../..../sub-',subID{k},'/sub-',subID{k},'_ses-2_task-Rest2_space-MNI152NLin2009cAsym_variant-2PGSR_regressed-preproc_bold_smooth.nii,',num2str(l)]};
    end

    matlabbatch{1}.spm.stats.fmri_spec.sess(2).scans = Rest2';
    matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi = {''};
    matlabbatch{1}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi_reg = {['..../..../..../..../sub-',subID{k},'/TimeSeries/sub-',subID{k},'_ses-2_task-Rest2_PFC_ts.txt']};
    matlabbatch{1}.spm.stats.fmri_spec.sess(2).hpf = 128;
    matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
    matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
    matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
    matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
    matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
    matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
    matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';
    matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
    matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
    matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
    matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
    matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = (['sub-',subID{k},'_Rest1_Only']);
    matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [1 0];
    matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = (['sub-',subID{k},'_Rest2_Only']);
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [0 1];
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
    matlabbatch{3}.spm.stats.con.consess{3}.tcon.name = (['sub-',subID{k},'_Rest1vRest2_Difference']);
    matlabbatch{3}.spm.stats.con.consess{3}.tcon.weights = [1 -1];
    matlabbatch{3}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
    matlabbatch{3}.spm.stats.con.consess{4}.tcon.name = (['sub-',subID{k},'_Rest1vRest2_Difference_Inverse']);
    matlabbatch{3}.spm.stats.con.consess{4}.tcon.weights = [-1 1];
    matlabbatch{3}.spm.stats.con.consess{4}.tcon.sessrep = 'none';
    matlabbatch{3}.spm.stats.con.consess{5}.tcon.name = (['sub-',subID{k},'_Rest1andRest2_Mean']);
    matlabbatch{3}.spm.stats.con.consess{5}.tcon.weights = [1 1];
    matlabbatch{3}.spm.stats.con.consess{5}.tcon.sessrep = 'none';
    matlabbatch{3}.spm.stats.con.delete = 0;
     
    spm('defaults', 'FMRI');
    spm_jobman('run', matlabbatch);
    
end
