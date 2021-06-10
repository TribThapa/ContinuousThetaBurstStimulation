clc; clear all; close all;

DataDir = '/home/ttha0011/kg98/Thapa/cTBS_Study/7_TaskData/12_FInalAnalysis_Nback_RT/';

subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011'; 
         'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'}; 
     
for i = 1:length(subID)
    
    RT_file = readtable([DataDir, subID{i}, '/', subID{i},'_mean_RTs.txt']);
    
    % Tabulate results
    DataOut = [];    
    DataOut.ID = subID{i};
    DataOut.Pre_Real_2back_MeanRT = RT_file.Pre_Real_2back_MeanRT;
    DataOut.Post_Real_2back_MeanRT = RT_file.Post_Real_2back_MeanRT;
    DataOut.Pre_Sham_2back_MeanRT = RT_file.Pre_Sham_2back_MeanRT;
    DataOut.Post_Sham_2back_MeanRT = RT_file.Post_Sham_2back_MeanRT;

    T{i} = struct2table(DataOut, 'AsArray', true);
    Table = vertcat(T{:}); 
     
    writetable(Table, [DataDir,'MeanRT_AllSubs.csv']);
end
