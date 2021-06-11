clc; clear all; close all

% Add Gannet folder and SPM to path.
addpath('..../...../..../Gannet3.1-master');
addpath('/usr/local/spm12/matlab2015b.r6685/');

% Define data directory
DataDir = ['..../..../...../Rawdata/'];

% Enter subject IDs
subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB009'; 'sub-GAB010';'sub-GAB011'; 'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 
         'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'}; 
         
% Create for-loop based upon subject IDs
for i = 1:length(subID)
    
    AnatDir = ([DataDir, subID{i},'/anat/']);

    MRSDir = ([DataDir, subID{i}, filesep 'MRS/']);
    
    chdir(MRSDir)
    
    sess = {'MR02'}; %'MR01'
        
    for j = 1:length(sess)
               
        site = {'DLPFC', 'VISCORTEX'}; %'DLPFC', 'VISCORTEX'
        
        for k = 1:length(site)
            
            RDA_POST3 = ([MRSDir,'MRH084_',subID{i},'_',sess{j},'_RD_',site{k},'_POST_3.rda']);
            
            RDA_POST1 = ([MRSDir,'MRH084_',subID{i},'_',sess{j},'_RD_',site{k},'_POST_1.rda']);

            RDA_POSTW1 = ([MRSDir,'MRH084_',subID{i},'_',sess{j},'_RD_',site{k},'_POST_W_1.rda']);

                 
            MRS_struct = GannetLoad({RDA_POST3 RDA_POST1},{[RDA_POSTW1]});
            saveas(gcf, ['MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST_GannetLoad.png']);

            MRS_struct = GannetFit(MRS_struct);
            saveas(gcf, ['MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST_GannetFit.png']);

            MRS_struct = GannetCoRegister(MRS_struct, {[AnatDir,subID{i},'_T1w_',sess{j},'.nii']});
            saveas(gcf, ['MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST_GannetCoReg.png']);
       
            MRS_struct = GannetSegment(MRS_struct);
            saveas(gcf, ['MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST_GannetSeg.png']);
                
            [a b c] = fileparts([MRSDir,'MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST.dat']);
        
            mkdir([MRSDir, b]);
            save ([b,'_MRS_struct.mat']);
       
            movefile ([MRSDir, 'MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST_GannetLoad.png'], [MRSDir, b]);
            movefile ([MRSDir, 'MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST_GannetFit.png'], [MRSDir, b]);
            movefile ([MRSDir, 'MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST_GannetCoReg.png'], [MRSDir, b]);
            movefile ([MRSDir, 'MRH084_',subID{i},'_',sess{j},'_KSPACE_',site{k},'_POST_GannetSeg.png'], [MRSDir, b]);
            movefile ([b,'_MRS_struct.mat'], [MRSDir, b]);
            
        end
        
    end
        
end
