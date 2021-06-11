clc; clear all; close all;

% Enter subject IDs
subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011';
         'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'};
 
% Define subject directories
DataDir = ('..../..../..../WholeBrainTS_Schaeferanalysis/');     
     
for i = 1:length(subID);
    
    Sess = {'RealPre'; 'ShamPost'}; %'RealPre'; 'RealPost; 'ShamPre'; 'ShamPost'
    
    for k = 1:length(Sess)
        
        ts = dlmread([DataDir,'RealTMS/',subID{i},'_task-',Sess{k},'_Schaefer300_ts.txt']);      
        
        FC_Sess{i,k} = corrcoef(ts');   
           
    end
 
end

% Concatenate files
FC_all = cat(3, FC_Sess{:,:});
 
save([DataDir, 'FC_all_Sham.mat'], 'FC_all');
     
FC_mat_Real = load([DataDir,'FC_all_Real.mat']);
FC_mat_Sham = load([DataDir,'FC_all_Sham.mat']);

FC_Comb = cat(3, FC_mat_Real.FC_all, FC_mat_Sham.FC_all);

save([DataDir, 'FC_RealPrePostnShamPrePost.mat'], 'FC_Comb');
