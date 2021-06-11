%-----------------------------------------------------------------------
% Job saved on 02-Jul-2020 10:23:20 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clc; clear all; close all;

addpath('/usr/local/spm12/matlab2015b.r6685/');

matlabbatch{1}.spm.stats.factorial_design.dir = {'..../..../..../..../2ndLevelAnalysis_2By2ANOVA'};
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
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB001/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB002/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB003/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB005/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB006/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB007/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB008/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB009/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB010/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB011/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB012/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB013/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB014/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB015/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB016/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB018/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB019/con_0001.nii,1'
                                                                   };
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).levels = [1
                                                                    2];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).scans = {
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB001/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB002/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB003/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB005/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB006/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB007/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB008/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB009/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB010/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB011/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB012/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB013/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB014/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB015/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB016/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB018/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/RealTMS/sub-GAB019/con_0002.nii,1'
                                                                   };
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).levels = [2
                                                                    1];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).scans = {
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB001/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB002/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB003/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB005/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB006/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB007/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB008/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB009/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB010/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB011/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB012/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB013/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB014/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB015/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB016/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB018/con_0001.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB019/con_0001.nii,1'
                                                                   };
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).levels = [2
                                                                    2];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).scans = {
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB001/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB002/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB003/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB005/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB006/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB007/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB008/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB009/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB010/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB011/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB012/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB013/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB014/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB015/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB016/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB018/con_0002.nii,1'
                                                                   '..../..../..../..../SecondLevelAnalysis/ShamTMS/sub-GAB019/con_0002.nii,1'
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
