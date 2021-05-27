clc; clear all; close all;

subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011'; 
         'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'};

for i= 1:length(subID);

Cond = {'1'; '2'; '3'; '4'}; 

    for j = 1:length(Cond)
    
        fMRIPrepDir = ['/home/ttha0011/kg98/Thapa/cTBS_Study/4c_fMRIPrep_AROMA/derivatives/fmriprep/', subID{i},'/ses-',Cond{j},'/func/'];

        % Step 3: Load subject specific .tsv file containing the regressors
        CSV_file = [subID{i} '_ses-',Cond{j},'_task-Rest',Cond{j},'_desc-confounds_regressors.tsv'];

        % Step 4: Change directory to func dir to ensure the script's outputs can be seen in the pane to your left
        cd(fMRIPrepDir);

        % Step 5: Read the .tsv file containing the regressors
        FileName = tdfread(CSV_file);

        % Step 6: Locate the CSF and WM .tsv file
        CSF = FileName.csf;
        WM = FileName.white_matter;

        % Step 7: Locate the x, y, and z plane regressors in the .tsv file
        X = FileName.trans_x;
        Y = FileName.trans_y;
        Z = FileName.trans_z;

        % Step 8: Locate files referring to rotation in the x, y, and z axis in the .tsv file   
        Rot_X = FileName.rot_x;
        Rot_Y = FileName.rot_y;
        Rot_Z = FileName.rot_z;

        % Step 8: Place regressors from Step 6 & 7 into a table
        T = table(FileName.csf, FileName.white_matter, FileName.trans_x, FileName.trans_y, FileName.trans_z, FileName.rot_x, FileName.rot_y, FileName.rot_z);

        OutDir = ['/home/ttha0011/kg98/Thapa/cTBS_Study/6_RestingState/18_Final_WholeBrainTS_Schaeferanalysis/',subID{i},'/Regressors/'];

        % Step 9 : Save the table using tab delimiter
        writetable(T, [OutDir, subID{i},'_ses-',Cond{j},'_task-Rest',Cond{j},'_Reg.txt'], 'Delimiter', ' ', 'WriteVariableNames', 0); 
    
    end 
end
