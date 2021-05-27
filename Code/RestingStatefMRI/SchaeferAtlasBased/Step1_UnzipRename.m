clc; clear all; close all;

subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003';'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011'; 
         'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'};

for i = 1:length(subID);

    cond = {'1'; '2'; '3'; '4'}; 

    for j = 1:length(cond)
        
        fMRIPrepDir = ['/home/ttha0011/kg98/Thapa/cTBS_Study/4c_fMRIPrep_AROMA/derivatives/fmriprep/', subID{i},'/ses-',cond{j},'/func/'];
   
        MNI_2009cAsym_preproc_file1 = [subID{i},'_ses-',cond{j},'_task-Rest',cond{j},'_space-MNI152NLin2009cAsym_desc-smoothAROMAnonaggr_bold.nii.gz'];
        
        gunzip([fMRIPrepDir, MNI_2009cAsym_preproc_file1]);
    
    end
end

    