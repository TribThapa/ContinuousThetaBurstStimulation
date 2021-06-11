clc; clear all; close all;

%  Determine path to fMRIPrep's output directory
addpath('/...../..../fMRIPrep/derivatives/fmriprep/');

% Enter subject ID
subID = {'sub-GAB001';'sub-GAB002'; 'sub-GAB003'; 'sub-GAB004'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009';
         'sub-GAB010'; 'sub-GAB011'; 'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'};

for j = 1:length(subID);

% Enter condition(s)
Cond = {'Nback1Ses1'; 'Nback1Ses2'; 'Nback1Ses3'; 'Nback1Ses4'; 'Nback2Ses1'; 'Nback2Ses2'; 'Nback2Ses3'; 'Nback2Ses4'}; 

% Create extraction loop for each condition
for idx = 1:length(Cond)
    
    % Determine path to subject specific fMRIPrep output directory
    fMRIPrepDir = ['.../..../fMRIPrep/derivatives/fmriprep/', subID{j}];

    % Determine path to func directory
    funcDir = [fMRIPrepDir filesep 'func'];
    
    % Load subject specific .tsv file containing the regressors
    CSV_file = [subID{j} '_task-' Cond{idx} '_desc-confounds_regressors.tsv'];
    
    % Change directory to func dir to ensure the script's outputs can be seen in the pane to your left
    cd(funcDir);
    
    % Read the .tsv file containing the regressors
    FileName = tdfread(CSV_file);
    
    % Locate the x, y, and z plane regressors in the .tsv file
    X = FileName.trans_x;
    Y = FileName.trans_y;
    Z = FileName.trans_z;
    
    % Locate files referring to rotation in the x, y, and z axis in the .tsv file   
    Rot_X = FileName.rot_x;
    Rot_Y = FileName.rot_y;
    Rot_Z = FileName.rot_z;
    
    % Place regressors from Step 6 & 7 into a table
    T = table(FileName.trans_x, FileName.trans_y, FileName.trans_z, FileName.rot_x, FileName.rot_y, FileName.rot_z);
    
    % Define output directory to which to save the table
    OutDir = ['..../..../output/dir/',subID{j},'/'];
    
    % Save the table using tab delimiter
    writetable(T, [OutDir, subID{j} '_task-' Cond{idx} '_Reg.txt'], 'Delimiter', ' ', 'WriteVariableNames', 0); 
    
end 
end
