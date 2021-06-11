clc; clear all; close all

% Define data directory
DataDir = ['..../..../...../Rawdata/'];

% Enter subject IDs
subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB009'; 'sub-GAB010';'sub-GAB011'; 'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 
         'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'}; 

% Create empty cell to which you will save GM, WM, CSF
Values = [];
results=cell(length(subID),1);

for i = 1:length(subID)
    
    MRSDir = [DataDir, subID{i}, '/MRS/'];
    
    sess = {'MRO2'; 'MR04'}; %'MRO4', 'MR02', 'MR04'};
    
    for j = 1:length(sess)
        
        site =  {'DLPFC'; 'VISCORTEX'};
        
        for k = 1:length(site)
            
            MatFile = ([MRSDir,'MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST/MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST_MRS_struct.mat']);
           
            load(MatFile,'MRS_struct')
            
            GABA_IU = (MRS_struct.out.vox1.GABA.ConcIU); % raw GABA on water
            
            Cr_IU = (MRS_struct.out.vox1.GABA.ConcCr); % raw Cr on water
            
            GM = (MRS_struct.out.vox1.tissue.fGM);
            WM = (MRS_struct.out.vox1.tissue.fWM);
            CSF = (MRS_struct.out.vox1.tissue.fCSF);
        
            Values{i,j,k} = [GM, WM, CSF];
                        
            GABA_W_corr = GABA_IU/(GM+WM) % GABA corrected 
            Cr_W_corr = Cr_IU/(GM+WM) % Cr corrected 
             
        end
        
    end
    
end

                  
