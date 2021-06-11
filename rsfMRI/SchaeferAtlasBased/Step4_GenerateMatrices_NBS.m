clc; clear all; close all;

% Enter subject IDs
subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011';
         'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'};

% Create for-loop
for i = 1:length(subID);

Cond = {'1'; '2'; '3'; '4'}; 

    for j = 1:length(Cond)
    
        DataDir = ['..../..../..../WholeBrainTS_Schaeferanalysis/', subID{i}];

        % Determine path to func directory
        TS = [DataDir filesep 'TimeSeries'];

        TimeSeries = dlmread([DataDir '/TimeSeries/',subID{i},'_ses-', Cond{j},'_task-Rest',Cond{j},'_Schaefer300_ts.txt']);

        Corr_matrix = corr(TimeSeries');  

        OutDir = [DataDir filesep 'Matrices/'];

        save([OutDir, subID{i},'_ses-',Cond{j},'_task-Rest',Cond{j},'_Schaefer300_ts.mat'], 'Corr_matrix');
        save([OutDir, subID{i},'_ses-',Cond{j},'_task-Rest',Cond{j},'_Schaefer300_ts.txt'], 'Corr_matrix', '-ascii');
    
    end
end

