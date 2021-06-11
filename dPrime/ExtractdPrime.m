clear; clc; close all;

% Enter subject IDs
subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011'; 
         'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'}; 
         

% Create for-loop to extract dPrime scores
for i = 1:length(subID)
    
    % Directory to text file with dPrime scores
    DataDir = (['/dir/to/text/file/',subID{i},'/']);
    
    cond = {'Post_Sham'; 'Post_Real'; 'Pre_Sham'; 'Post_Sham'};
    
    for j = length(cond)
        
        Data = readtable([DataDir,subID{i}, '_',cond{j},'.txt']);
        
        dPrime_0back{i,j} = (Data.dPrime_0back);
        dPrime_2back{i,j} = (Data.dPrime_2back);        
             
        dPrime_all = table(dPrime_0back, dPrime_2back);         
        
    end
 
end

% Directory to save the ouput
OutDir = ('.....ouput/dir/');

% Enter column names
ColNames = {'0back', '2back'};

% Create table
sTable = array2table(table2array(dPrime_all),'RowNames',subID, 'VariableNames', ColNames);

% Save table
writetable(sTable, [OutDir,'Post_Sham.txt']);
