clc; clear all; close all;

addpath('/usr/local/spm12/matlab2015b.r6685/');

DataDir = ('/home/ttha0011/kg98/Thapa/cTBS_Study/7_TaskData/6_RecheckNamingSystem/');
ScriptsDir = ('/home/ttha0011/kg98/Thapa/cTBS_Study/7_TaskData/6_RecheckNamingSystem/ScriptsUsed/');

%Paths to 2nd Level analyses data
FullFlex_con1 = ('/FullFlexibleFactorial_con1s/');
FullFlex_con2 = ('/FullFlexibleFactorial_con2s/');

SPM_file = load([DataDir, FullFlex_con1 'SPM.mat']);

Real_Pre_Paths = SPM_file.SPM.xY.P(1:17);
Real_Post_Paths = SPM_file.SPM.xY.P(18:34);
Sham_Pre_Paths = SPM_file.SPM.xY.P(35:51);
Sham_Post_Paths = SPM_file.SPM.xY.P(52:end);


%Convert ROI to xyz coordinates
PFC_ROI = spm_read_vols(spm_vol([ScriptsDir, 'PFC.nii']), 1);
indx = find(PFC_ROI > 0);
[x,y,z] = ind2sub(size(PFC_ROI), indx);
PFC_ROI_XYZ = [x y z]';

%Average across all voxels within an ROI for a particular contrast
Real_Pre_cond = mean(spm_get_data(Real_Pre_Paths, PFC_ROI_XYZ), 2);
Real_Post_cond = mean(spm_get_data(Real_Post_Paths, PFC_ROI_XYZ), 2);
Sham_Pre_cond = mean(spm_get_data(Sham_Pre_Paths, PFC_ROI_XYZ), 2);
Sham_Post_cond = mean(spm_get_data(Sham_Post_Paths, PFC_ROI_XYZ), 2);

%Run T-test. h=0 indicates the t-test does not reject the null hypothesis.
%[h, p , ci, stats] = ttest(Real_Post_cond)

[h, p , ci, stats] = ttest(Sham_Pre_cond, Sham_Post_cond)


