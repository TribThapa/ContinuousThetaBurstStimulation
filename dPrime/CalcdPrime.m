clear; clc; close all;

addpath('/projects/kg98/Thapa/cTBS_Study/7_TaskData/11_FinalAnalysis_NbackBehavData/ScriptsUsed/FromNigel');

subID = {'sub-GAB018'}; %{'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011'; 
         %'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'}; 
     
for i = 1:length(subID)
    
    DataDir = (['/home/ttha0011/kg98/Thapa/cTBS_Study/7_TaskData/11_FinalAnalysis_NbackBehavData/',subID{i},'/']);
    
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
    
    %Calc Hits 
    Hits_0back = sum(Post_Real_0back.Resp_0back>0 & Post_Real_0back.HitTrials_0back>0); 
    Hits_2back = sum(Post_Real_2back.Resp_2back>0 & Post_Real_2back.HitTrials_2back>0);    
  
    %Calc False alarms
    fAlarm_0back = sum(Post_Real_0back.Resp_0back>0 & Post_Real_0back.HitTrials_0back==0); 
    fAlarm_2back = sum(Post_Real_2back.Resp_2back>0 & Post_Real_2back.HitTrials_2back==0);
        
    %Calc Misses
    Misses_0back = sum(Post_Real_0back.HitTrials_0back==1234)-sum(Post_Real_0back.Resp_0back>0); 
    Misses_2back = sum(Post_Real_2back.HitTrials_2back==1234)-sum(Post_Real_2back.Resp_2back>0);
    
    %Calc D'
    if (fAlarm_0back > 0 & Misses_0back > 0)
        dPrime_0back = norminv(Hits_0back/sum(Post_Real_0back.HitTrials_0back==1234)) - norminv(fAlarm_0back/sum(Post_Real_0back.HitTrials_0back~=1234));
    else
        Hits_0back_mod = Hits_0back + 0.5 ;
        fAlarm_0back_mod = fAlarm_0back + 0.5 ;
        target_mod = sum(Post_Real_0back.HitTrials_0back==1234) + 1 ;
        notarget_mod = sum(Post_Real_0back.HitTrials_0back~=1234) + 1 ;
        dPrime_0back = norminv(Hits_0back_mod/target_mod) - norminv(fAlarm_0back_mod/notarget_mod);    
    end 
    
    
    if (fAlarm_2back > 0 & Misses_2back > 0)
        dPrime_2back = norminv(Hits_2back/sum(Post_Real_2back.HitTrials_2back==1234)) - norminv(fAlarm_2back/sum(Post_Real_2back.HitTrials_2back~=1234));
    else
        Hits_2back_mod = Hits_2back + 0.5 ;
        fAlarm_2back_mod = fAlarm_2back + 0.5 ;
        target_mod = sum(Post_Real_2back.HitTrials_2back==1234) + 1 ;
        notarget_mod = sum(Post_Real_2back.HitTrials_2back~=1234) + 1 ;
        dPrime_2back = norminv(Hits_2back_mod/target_mod) - norminv(fAlarm_2back_mod/notarget_mod);    
       
    end
    
    dPrime_all = table(Hits_0back, Hits_0back_mod, fAlarm_0back, fAlarm_0back_mod, dPrime_0back, Hits_2back, Hits_2back_mod, fAlarm_2back, fAlarm_2back_mod, dPrime_2back);
    
    writetable(dPrime_all, [DataDir,subID{i},'_Post_Real.txt']);    
        
end











