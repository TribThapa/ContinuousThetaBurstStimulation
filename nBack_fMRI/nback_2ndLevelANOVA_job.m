%-----------------------------------------------------------------------
% Job saved on 02-Jul-2020 10:23:20 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clc; clear all; close all;

addpath('/usr/local/spm12/matlab2015b.r6685/');

matlabbatch{1}.spm.stats.factorial_design.dir = {'..../..../.../.../2ndLevelAnalysis_2By2ANOVA_con1s'};
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).name = 'Group';
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).levels = 2;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).dept = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).name = 'Time';
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).levels = 2;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).levels = [1
                                                                    1];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).scans = {
                                                                   '..../..../.../.../sub-GAB001/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB002/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB003/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB005/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB006/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB007/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB008/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB009/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB010/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB011/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB012/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB013/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB014/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB015/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB016/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB018/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB019/OUTPUT_PRE_REAL/con_0001.nii,1'
                                                                   };
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).levels = [1
                                                                    2];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).scans = {
                                                                   '..../..../.../.../sub-GAB001/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB002/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB003/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB005/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB006/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB007/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB008/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB009/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB010/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB011/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB012/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB013/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB014/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB015/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB016/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB018/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB019/OUTPUT_POST_REAL/con_0001.nii,1'
                                                                   };
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).levels = [2
                                                                    1];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).scans = {
                                                                   '..../..../.../.../sub-GAB001/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB002/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB003/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB005/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB006/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB007/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB008/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB009/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB010/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB011/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB012/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB013/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB014/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB015/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB016/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB018/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB019/OUTPUT_PRE_SHAM/con_0001.nii,1'
                                                                   };
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).levels = [2
                                                                    2];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).scans = {
                                                                   '..../..../.../.../sub-GAB001/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB002/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB003/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB005/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB006/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB007/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB008/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB009/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB010/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB011/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB012/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB013/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB014/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB015/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB016/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB018/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   '..../..../.../.../sub-GAB019/OUTPUT_POST_SHAM/con_0001.nii,1'
                                                                   };
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.contrasts = 1;
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
matlabbatch{3}.spm.stats.con.consess{1}.fcon.name = 'MainGroupEffect';
matlabbatch{3}.spm.stats.con.consess{1}.fcon.weights = [1 1 -1 -1];
matlabbatch{3}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.fcon.name = 'MainTimeEffect';
matlabbatch{3}.spm.stats.con.consess{2}.fcon.weights = [1 -1 1 -1];
matlabbatch{3}.spm.stats.con.consess{2}.fcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;

spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);
