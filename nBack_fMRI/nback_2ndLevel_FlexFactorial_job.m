%-----------------------------------------------------------------------
% Job saved on 02-Nov-2020 07:31:09 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clc; clear all; close all;

addpath('/usr/local/spm12/matlab2015b.r6685/');

matlabbatch{1}.spm.stats.factorial_design.dir = {'/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/2ndLevelAnalysis_FlexFactorial_con2'};
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).name = 'Group';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).dept = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).variance = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).name = 'Time';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).dept = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).variance = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).ancova = 0;
%%
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.specall.scans = {
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
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB001/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB002/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB003/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB005/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB006/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB007/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB008/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB009/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB010/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB011/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB012/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB013/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB014/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB015/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB016/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB018/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB019/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
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
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB001/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB002/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB003/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB005/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB006/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB007/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB008/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB009/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB010/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB011/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB012/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB013/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB014/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB015/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB016/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB018/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              '/projects/kg98/Thapa/cTBS_Study/7_TaskData/10_FinalAnalysis_Nback/sub-GAB019/OUTPUT_POST_SHAM_NBACK/con_0002.nii,1'
                                                                              };
%%
%%
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.specall.imatrix = [1 1 1 1
                                                                                2 1 1 1
                                                                                3 1 1 1
                                                                                4 1 1 1
                                                                                5 1 1 1
                                                                                6 1 1 1
                                                                                7 1 1 1
                                                                                8 1 1 1
                                                                                9 1 1 1
                                                                                10 1 1 1
                                                                                11 1 1 1
                                                                                12 1 1 1
                                                                                13 1 1 1
                                                                                14 1 1 1
                                                                                15 1 1 1
                                                                                16 1 1 1
                                                                                17 1 1 1
                                                                                18 1 2 1
                                                                                19 1 2 1
                                                                                20 1 2 1
                                                                                21 1 2 1
                                                                                22 1 2 1
                                                                                23 1 2 1
                                                                                24 1 2 1
                                                                                25 1 2 1
                                                                                26 1 2 1
                                                                                27 1 2 1
                                                                                28 1 2 1
                                                                                29 1 2 1
                                                                                30 1 2 1
                                                                                31 1 2 1
                                                                                32 1 2 1
                                                                                33 1 2 1
                                                                                34 1 2 1
                                                                                35 2 1 1
                                                                                36 2 1 1
                                                                                37 2 1 1
                                                                                38 2 1 1
                                                                                39 2 1 1
                                                                                40 2 1 1
                                                                                41 2 1 1
                                                                                42 2 1 1
                                                                                43 2 1 1
                                                                                44 2 1 1
                                                                                45 2 1 1
                                                                                46 2 1 1
                                                                                47 2 1 1
                                                                                48 2 1 1
                                                                                49 2 1 1
                                                                                50 2 1 1
                                                                                51 2 1 1
                                                                                52 2 2 1
                                                                                53 2 2 1
                                                                                54 2 2 1
                                                                                55 2 2 1
                                                                                56 2 2 1
                                                                                57 2 2 1
                                                                                58 2 2 1
                                                                                59 2 2 1
                                                                                60 2 2 1
                                                                                61 2 2 1
                                                                                62 2 2 1
                                                                                63 2 2 1
                                                                                64 2 2 1
                                                                                65 2 2 1
                                                                                66 2 2 1
                                                                                67 2 2 1
                                                                                68 2 2 1];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{1}.fmain.fnum = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{2}.fmain.fnum = 2;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{3}.inter.fnums = [1
                                                                                  2];
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
matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'Real(Post-Pre)>Sham(Post-Pre)';
matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [0 0 0 0 -1 1 1 -1];
matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'Real(Post-Pre)<Sham(Post-Pre)';
matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [0 0 0 0 1 -1 -1 1];
matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
matlabbatch{3}.spm.stats.con.delete = 0;

spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);