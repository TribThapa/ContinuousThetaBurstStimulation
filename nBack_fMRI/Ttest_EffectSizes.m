clc; clear all; close all;

PathDir = ('/home/ttha0011/kg98/Thapa/cTBS_Study/7_TaskData/6_RecheckNamingSystem/AtlasROIs/');

%Load Task files
% Post_Real_CON1_EffectSize = readtable([PathDir, 'OUTPUT_POST_REAL_NBACK/con1/OUTPUT_POST_REAL_NBACK_con1_EffectSizes.csv']);
% Post_Real_CON2_EffectSize = readtable([PathDir, 'OUTPUT_POST_REAL_NBACK/con2/OUTPUT_POST_REAL_NBACK_con2_EffectSizes.csv']);
% Post_Sham_CON1_EffectSize = readtable([PathDir, 'OUTPUT_POST_SHAM_NBACK/con1/OUTPUT_POST_SHAM_NBACK_con1_EffectSizes.csv']);
% Post_Sham_CON2_EffectSize = readtable([PathDir, 'OUTPUT_POST_SHAM_NBACK/con2/OUTPUT_POST_SHAM_NBACK_con2_EffectSizes.csv']);
% 
% Pre_Real_CON1_EffectSize = readtable([PathDir, 'OUTPUT_PRE_REAL_NBACK/con1/OUTPUT_PRE_REAL_NBACK_con1_EffectSizes.csv']);
% Pre_Real_CON2_EffectSize = readtable([PathDir, 'OUTPUT_PRE_REAL_NBACK/con2/OUTPUT_PRE_REAL_NBACK_con2_EffectSizes.csv']);
% Pre_Sham_CON1_EffectSize = readtable([PathDir, 'OUTPUT_PRE_SHAM_NBACK/con1/OUTPUT_PRE_SHAM_NBACK_con1_EffectSizes.csv']);
% Pre_Sham_CON2_EffectSize = readtable([PathDir, 'OUTPUT_PRE_SHAM_NBACK/con2/OUTPUT_PRE_SHAM_NBACK_con2_EffectSizes.csv']);

AllRealPre_con2 = readtable([PathDir, '2ndLevelAnalysis_2By2ANOVA_con2s/AllRealPre.csv']));
AllRealPost_con2 = readtable([PathDir, '2ndLevelAnalysis_2By2ANOVA_con2s/AllRealPost.csv']);
AllShamPre_con2 = readtable([PathDir, '2ndLevelAnalysis_2By2ANOVA_con2s/AllShamPre.csv']);
AllShamPost_con2 = readtable([PathDir, '2ndLevelAnalysis_2By2ANOVA_con2s/AllShamPost.csv']);
clc;

%Run t-test
[h1, p1] = ttest(table2array(AllRealPre_con2(1:end, 2:end), AllRealPost_con2(1:end, 2:end))); %table array applies only to first table.
[h2, p2] = ttest(table2array(AllShamPre_con2(1:end, 2:end), AllShamPost_con2(1:end, 2:end)));
[h3, p3] = ttest(table2array(AllRealPre_con2(1:end, 2:end), AllShamPre_con2(1:end, 2:end)));
[h4, p4] = ttest(table2array(AllRealPost_con2(1:end, 2:end), AllShamPost_con2(1:end, 2:end)));

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
