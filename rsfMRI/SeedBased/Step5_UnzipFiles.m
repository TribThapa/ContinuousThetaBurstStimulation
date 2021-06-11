clc; clear all; close all;

% Enter subject IDs
subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011';
         'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'}; 

% Create for-loop
for i = 1:length(subID);

ses = {'1'; '2'; '3'; '4'}; 

    for j = 1:length(ses)
        
        DataDir = ['/..../..../', subID{i}];
                
        MNI_2009cAsym_preproc_file = [subID{i},'_ses-',ses{j},'_task-Rest',ses{j},'_space-MNI152NLin2009cAsym_variant-2PGSR_regressed-preproc_bold.nii.gz'];
               
        gunzip([DataDir, '/', MNI_2009cAsym_preproc_file]);
    
    end
end

    