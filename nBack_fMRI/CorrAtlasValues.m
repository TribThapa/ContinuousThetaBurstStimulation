clc; clear all; close all;

PathDir = ('/home/ttha0011/kg98/Thapa/cTBS_Study/7_TaskData/6_RecheckNamingSystem/AtlasROIs/');

%Load Task files
LabelFile = readtable('/home/ttha0011/kg98/Thapa/cTBS_Study/7_TaskData/6_RecheckNamingSystem/ScriptsUsed/AtlasesROIs/ROI_MNI_V4.txt');

Post_Real_CON1_TotalVox = readmatrix([PathDir, 'OUTPUT_POST_REAL_NBACK/con1/TotalVoxels.txt'])';
Post_Real_CON1_SumVox = readmatrix([PathDir, 'OUTPUT_POST_REAL_NBACK/con1/SumVoxels.txt'])';
Post_Real_CON2_TotalVox = readmatrix([PathDir, 'OUTPUT_POST_REAL_NBACK/con2/TotalVoxels.txt'])';
Post_Real_CON2_SumVox = readmatrix([PathDir, 'OUTPUT_POST_REAL_NBACK/con2/SumVoxels.txt'])';

Post_Sham_CON1_TotalVox = readmatrix([PathDir, 'OUTPUT_POST_SHAM_NBACK/con1/TotalVoxels.txt'])';
Post_Sham_CON1_SumVox = readmatrix([PathDir, 'OUTPUT_POST_SHAM_NBACK/con1/SumVoxels.txt'])';
Post_Sham_CON2_TotalVox = readmatrix([PathDir, 'OUTPUT_POST_SHAM_NBACK/con2/TotalVoxels.txt'])';
Post_Sham_CON2_SumVox = readmatrix([PathDir, 'OUTPUT_POST_SHAM_NBACK/con2/SumVoxels.txt'])';

Pre_Real_CON1_TotalVox = readmatrix([PathDir, 'OUTPUT_PRE_REAL_NBACK/con1/TotalVoxels.txt'])';
Pre_Real_CON1_SumVox = readmatrix([PathDir, 'OUTPUT_PRE_REAL_NBACK/con1/SumVoxels.txt'])';
Pre_Real_CON2_TotalVox = readmatrix([PathDir, 'OUTPUT_PRE_REAL_NBACK/con2/TotalVoxels.txt'])';
Pre_Real_CON2_SumVox = readmatrix([PathDir, 'OUTPUT_PRE_REAL_NBACK/con2/SumVoxels.txt'])';

Pre_Sham_CON1_TotalVox = readmatrix([PathDir, 'OUTPUT_PRE_SHAM_NBACK/con1/TotalVoxels.txt'])';
Pre_Sham_CON1_SumVox = readmatrix([PathDir, 'OUTPUT_PRE_SHAM_NBACK/con1/SumVoxels.txt'])';
Pre_Sham_CON2_TotalVox = readmatrix([PathDir, 'OUTPUT_PRE_SHAM_NBACK/con2/TotalVoxels.txt'])';
Pre_Sham_CON2_SumVox = readmatrix([PathDir, 'OUTPUT_PRE_SHAM_NBACK/con2/SumVoxels.txt'])';

%Run t-test
[h1, p1] = ttest(Pre_Real_CON2_SumVox(3:118, 2:end)', Pre_Sham_CON2_SumVox(3:118, 2:end)');
[h2, p2] = ttest(Post_Real_CON2_SumVox(3:118, 2:end)', Post_Sham_CON2_SumVox(3:118, 2:end)');
[h3, p3] = ttest(Pre_Real_CON2_SumVox(3:118, 2:end)', Post_Real_CON2_SumVox(3:118, 2:end)');
[h4, p4] = ttest(Pre_Sham_CON2_SumVox(3:118, 2:end)', Post_Sham_CON2_SumVox(3:118, 2:end)');

%Get Labels and match the corresponding p, value
Labels = LabelFile.Var2;
Table = table(LabelFile.Var2, p1', p2', p3', p4');
header = {'Region', 'PreRealvSham', 'PostRealvSham', 'PrevPostReal', 'PrevPostSham'};
Table.Properties.VariableNames = header;

a = [Table.PostRealvSham; Table.PreRealvSham; Table.PrevPostReal; Table.PrevPostSham];
b = [ones(size(Table.PostRealvSham)); 2*ones(size(Table.PreRealvSham)); 3*ones(size(Table.PrevPostReal)); 4*ones(size(Table.PrevPostSham))];
boxplot(a,b, 'Labels', {'PreRealvSham', 'PostRealvSham', 'PrevPostReal', 'PrevPostSham'});
c = get(gca, 'XTickLabel');
set(gca,'xTickLabel', c, 'fontsize', 8);
d = get(gca, 'YTickLabel');
set(gca,'YTickLabel', d, 'fontsize', 6);
ylabel('Pvalue', 'fontsize', 8);

%Save Table & Fig
writetable(Table, [PathDir,'PostRealvSham_Con2_SumVox.csv']);
saveas(gcf, [PathDir, 'BoxPlots.png']);
