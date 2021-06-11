%-----------------------------------------------------------------------
% Job saved on 24-Jul-2020 13:25:34 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6685)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clc; clear all; close all

matlabbatch{1}.spm.tools.cat.tools.showslice.data_vol = {'..../..../..../....sub-GAB001/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB002/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB003/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB005/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB006/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB007/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB008/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB009/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB010/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB011/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB012/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB013/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB014/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB015/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB016/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB018/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB019/OUTPUT_PRE_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB001/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB002/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB003/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB005/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB006/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB007/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB008/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB009/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB010/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB011/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB012/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB013/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB014/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB015/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB016/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB018/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'
                                                         '..../..../..../....sub-GAB019/OUTPUT_POST_REAL_NBACK/con_0002.nii,1'};

matlabbatch{1}.spm.tools.cat.tools.showslice.scale = 0;
matlabbatch{1}.spm.tools.cat.tools.showslice.orient = 3; % 3=axial
matlabbatch{1}.spm.tools.cat.tools.showslice.slice = 0;

spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);
