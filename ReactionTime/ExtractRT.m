clear; clc; close all;

% Enter subject IDs
subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011'; 
         'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'}; 
     
% Create for-loop to extract Reaction Time data
for i = 1:length(subID)
    
    DataDir = (['..../..../..../',subID{i},'/']);
    
    Pre_Real1_0back = readtable([DataDir,subID{i}, '_PRE_REAL_NBACK1_0back.txt']);
    Pre_Real2_0back = readtable([DataDir,subID{i}, '_PRE_REAL_NBACK2_0back.txt']);
    Pre_Real_0back = [Pre_Real1_0back;Pre_Real2_0back];
    
    Post_Real1_0back = readtable([DataDir,subID{i}, '_POST_REAL_NBACK1_0back.txt']);
    Post_Real2_0back = readtable([DataDir,subID{i}, '_POST_REAL_NBACK2_0back.txt']);
    Post_Real_0back = [Post_Real1_0back;Post_Real2_0back];
    
    Pre_Sham1_0back = readtable([DataDir,subID{i}, '_PRE_SHAM_NBACK1_0back.txt']);
    Pre_Sham2_0back = readtable([DataDir,subID{i}, '_PRE_SHAM_NBACK2_0back.txt']);
    Pre_Sham_0back = [Pre_Sham1_0back;Pre_Sham2_0back];
    
    Post_Sham1_0back = readtable([DataDir,subID{i}, '_POST_SHAM_NBACK1_0back.txt']);
    Post_Sham2_0back = readtable([DataDir,subID{i}, '_POST_SHAM_NBACK2_0back.txt']);
    Post_Sham_0back = [Post_Sham1_0back;Post_Sham2_0back];
    
    Pre_Real1_2back = readtable([DataDir,subID{i}, '_PRE_REAL_NBACK1_2back.txt']);
    Pre_Real2_2back = readtable([DataDir,subID{i}, '_PRE_REAL_NBACK2_2back.txt']);
    Pre_Real_2back = [Pre_Real1_2back;Pre_Real2_2back];
    
    Post_Real1_2back = readtable([DataDir,subID{i}, '_POST_REAL_NBACK1_2back.txt']);
    Post_Real2_2back = readtable([DataDir,subID{i}, '_POST_REAL_NBACK2_2back.txt']);
    Post_Real_2back = [Post_Real1_2back;Post_Real2_2back];
    
    Pre_Sham1_2back = readtable([DataDir,subID{i}, '_PRE_SHAM_NBACK1_2back.txt']);
    Pre_Sham2_2back = readtable([DataDir,subID{i}, '_PRE_SHAM_NBACK2_2back.txt']);
    Pre_Sham_2back = [Pre_Sham1_2back;Pre_Sham2_2back];
    
    Post_Sham1_2back = readtable([DataDir,subID{i}, '_POST_SHAM_NBACK1_2back.txt']);
    Post_Sham2_2back = readtable([DataDir,subID{i}, '_POST_SHAM_NBACK2_2back.txt']);
    Post_Sham_2back = [Post_Sham1_2back;Post_Sham2_2back];

    % Tabulate all data
    RT_all = table(Pre_Real_0back.HitTrials_0back, Pre_Real_0back.Resp_0back, Pre_Real_0back.RT_0back, ...
                   Post_Real_0back.HitTrials_0back, Post_Real_0back.Resp_0back, Post_Real_0back.RT_0back,...
                   Pre_Sham_0back.HitTrials_0back, Pre_Sham_0back.Resp_0back, Pre_Sham_0back.RT_0back, ...
                   Post_Sham_0back.HitTrials_0back, Post_Sham_0back.Resp_0back, Post_Sham_0back.RT_0back,...
                   Pre_Real_2back.HitTrials_2back, Pre_Real_2back.Resp_2back, Pre_Real_2back.RT_2back, ...
                   Post_Real_2back.HitTrials_2back, Post_Real_2back.Resp_2back, Post_Real_2back.RT_2back,...
                   Pre_Sham_2back.HitTrials_2back, Pre_Sham_2back.Resp_2back, Pre_Sham_2back.RT_2back, ...
                   Post_Sham_2back.HitTrials_2back, Post_Sham_2back.Resp_2back, Post_Sham_2back.RT_2back);
    
    % Enter headers for Reaction Time table data
    RT_all.Properties.VariableNames = {'PreReal_0back_Hits', 'PreReal_0back_Resp', 'PreReal_0back_RT',...
                                       'PostReal_0back_Hits', 'PostReal_0back_Resp', 'PostReal_0back_RT',...
                                       'PreSham_0back_Hits', 'PreSham_0back_Resp', 'PreSham_0back_RT',...
                                       'PostSham_0back_Hits', 'PostSham_0back_Resp', 'PostSham_0back_RT',...
                                       'PreReal_2back_Hits', 'PreReal_2back_Resp', 'PreReal_2back_RT',...
                                       'PostReal_2back_Hits', 'PostReal_2back_Resp', 'PostReal_2back_RT',...
                                       'PreSham_2back_Hits', 'PreSham_2back_Resp', 'PreSham_2back_RT',...
                                       'PostSham_2back_Hits', 'PostSham_2back_Resp', 'PostSham_2back_RT'};  
                                   
    % Create table to collate Reaction Time for the 2-back task                             
    RT_mean = table(mean(Pre_Real_2back.RT_2back), mean(Post_Real_2back.RT_2back), mean(Pre_Sham_2back.RT_2back), mean(Post_Sham_2back.RT_2back));
    RT_mean.Properties.VariableNames = {'Pre_Real_2back_MeanRT', 'Post_Real_2back_MeanRT', 'Pre_Sham_2back_MeanRT', 'Post_Sham_2back_MeanRT'};
    
    % Define directory to save table
    OutDir = (['..../..../....RT/',subID{i},'/']);

    % Save tables
    writetable(RT_all, [OutDir,subID{i},'_RTs.txt']);      
    writetable(RT_mean, [OutDir,subID{i},'_mean_RTs.txt']);    
    
end











