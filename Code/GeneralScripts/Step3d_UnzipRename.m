clc; clear all; close all;

% Step 1: Enter subject ID
subID = {'sub-GAB003'}; %'sub-GAB002'; 'sub-GAB003'; 'sub-GAB004'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB008'; 'sub-GAB009'; 
         %'sub-GAB010'; 'sub-GAB011'; 'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'}; %'sub-GAB003'; 

for j = 1:length(subID);

% Step 2: Enter condition(s)
Cond = {'Nback1Ses1'; 'Nback2Ses1'; 'Nback1Ses2'; 'Nback2Ses2'; 'Nback1Ses3'; 'Nback2Ses3'; 'Nback1Ses4'; 'Nback2Ses4'; }; 

    % Step 3: Create extraction loop for each condition
    for idx = 1:length(Cond)
    
    % Step 4: Determine path to subject specific fMRIPrep output directory
    fMRIPrepDir = ['/home/ttha0011/kg98/Thapa/cTBS_Study/4b_fMRIPrep_AROMA/derivatives/fmriprep/', subID{j}];

    % Step 5: Determine path to func directory
    funcDir = [fMRIPrepDir filesep 'func/'];
    
    % Step 6: Load subject specific .tsv file containing the regressors
    MNI_6Asym_preproc_file = [subID{j} '_task-' Cond{idx} '_space-MNI152NLin6Asym_desc-smoothAROMAnonaggr_bold.nii.gz'];
    
    MNI_2009cAsym_preproc_file = [subID{j} '_task-' Cond{idx} '_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii.gz'];

    
    gunzip([funcDir, MNI_6Asym_preproc_file]);

    gunzip([funcDir, MNI_2009cAsym_preproc_file]);
    
    end
end

    