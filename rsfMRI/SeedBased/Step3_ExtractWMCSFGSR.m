clc; clear all; close all;

% Define output directory
OutDir = '..../..../..../ROIanalysis/';

% Enter subject ID
subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011';
         'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015';'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'};

for i = 1:length(subID)

    Sess = {'1'; '2'; '3'; '4'};
    
    for j = 1:length(Sess)  
        
        fMRIPrepDir = ['..../..../fMRIPrep/derivatives/fmriprep/', subID{i},'/ses-', Sess{j},'/func/'];
            
        CSV_file = [fMRIPrepDir, subID{i}, '_ses-',Sess{j}, '_task-Rest',Sess{j},'_desc-confounds_regressors.tsv'];
    
        FileName = tdfread(CSV_file);   

        CSF = FileName.csf;
        WM = FileName.white_matter;
        global_signal = FileName.global_signal;
    
        T = table(FileName.csf, FileName.white_matter, FileName.global_signal);

        writetable(T, [OutDir,subID{i},'/',subID{i},'_ses-',Sess{j},'_task-Rest',Sess{j},'_WMCSFGSR.txt'], 'Delimiter', ' ', 'WriteVariableNames', 0); 
        
    end
end
