%-----------------------------------------------------------------------
% Job saved on 04-Aug-2020 12:58:25 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clc; clear all; close all;

addpath('/usr/local/spm12/matlab2015b.r6685/');

matlabbatch{1}.spm.stats.factorial_design.dir = {'/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/2ndLevelTwoSampleT_RealvSham_Pre_con2'};
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans1 = {
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB001/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB002/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB003/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB005/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB006/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB007/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB008/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB009/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB010/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB011/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB012/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB013/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB014/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB015/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB016/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB018/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB019/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                           };
matlabbatch{1}.spm.stats.factorial_design.des.t2.scans2 = {
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB001/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB002/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB003/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB005/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB006/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB007/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB008/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB009/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB010/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB011/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB012/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB013/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB014/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB015/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB016/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB018/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB019/OUTPUT_PRE_SHAM_NBACK/con_0002.nii,1'
                                                           };
matlabbatch{1}.spm.stats.factorial_design.des.t2.dept = 1;
matlabbatch{1}.spm.stats.factorial_design.des.t2.variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.t2.gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.t2.ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'Real Only';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [1 0];
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'Sham Only';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [0 1];
matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{3}.tcon.name = 'Real>Sham';
matlabbatch{3}.spm.stats.con.consess{3}.tcon.weights = [1 -1];
matlabbatch{3}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{4}.tcon.name = 'Real<Sham';
matlabbatch{3}.spm.stats.con.consess{4}.tcon.weights = [-1 1];
matlabbatch{3}.spm.stats.con.consess{4}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;


spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);