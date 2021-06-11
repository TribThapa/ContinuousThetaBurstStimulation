clear; clc; close all;

% Define path to function that reads in Presentation files
addpath('.../path/to/function/');

% Enter subID
subID = 'sub-GAB018';

% Directors for data and output
pathIn = (['/subject/dir/',subID,'/Task/']);
pathOut = (['/subject/dir/for/output/',subID,'/']);


% Uncomment if analysing subjects that started with Sham then did Real TMS
cond = {'POST_REAL_NBACK2';...
        'POST_SHAM_NBACK1';...
        'PRE_REAL_NBACK1';...
        'POST_REAL_NBACK1';...
        'PRE_SHAM_NBACK2';...
        'POST_SHAM_NBACK2';...
        'PRE_REAL_NBACK2';...
        'POST_REAL_NBACK2'};

% Uncomment if analysing subjects that started with Real then did Sham TMS
%cond = {'POST_SHAM_NBACK2';...
%         'POST_REAL_NBACK1';...
%         'PRE_SHAM_NBACK1';...
%         'POST_SHAM_NBACK1';...
%         'PRE_REAL_NBACK2';...
%         'POST_REAL_NBACK2';...
%         'PRE_SHAM_NBACK2';...
%         'POST_SHAM_NBACK2'};

fileName = {'NBACK_2-018-4.txt'};...
%             'NBACK_1-001-2.txt';...
%             'NBACK_1-001-3.txt';...
%             'NBACK_1-001-4.txt'};%...
%             'NBACK_2-001-1.txt';...
%             'NBACK_2-001-2.txt';...
%             'NBACK_2-001-3.txt';...
%             'NBACK_2-001-4.txt'};

% Create for loop to read in each subjects presentation file
for i = 1:size(cond,1)
    
    %Read in data
    [Titles,Header,Start,VarName4] = importfileNback([pathIn,fileName{i,1}]);
    
    titleNames = {'ZeroBackSlide';'TwoBackSlide'};
    titleNamesShort = {'0back';'2back'};
    
        for z = 1:size(titleNames,1)
        %Find onset times and trial length times
        output = [];
        trialLog = zeros(size(Titles,1),1);
        for x = 1:size(Titles,1)
            output(x,1) = any(regexp(Titles{x,1},titleNames{z,1})) && any(regexp(Titles{x,1},'OnsetTime:$')) && ~any(regexp(Titles{x,1},'ToOnsetTime:$'));
        end

        clear zeroTime
        onsTime = Header(logical(output));
        temp = (1:1:size(Start,1))';
        onsInd = temp(logical(output));
        
        [trialTime,~] = find(strcmp('TrialTime:',Titles));

        for x = 1:size(onsTime,1)
            onsTimeSec(x,1) = str2num(onsTime{x,1})./1000;
            [~,trialInd] = min(abs(onsInd(x,1)-trialTime));
            trialTimeSec(x,1) = str2num(Header{trialTime(trialInd,1),1})./1000;
        end

        % Find start and end of each block
        diffOns = diff(onsTimeSec);
        ons = [];
        off = [];
        ons = round(onsTimeSec(1,1));
        for x = 1:size(diffOns,1)
            if diffOns(x,1) > 4
                ons(1,size(ons,2)+1) = onsTimeSec(x+1,1);
                off(1,size(off,2)+1) = onsTimeSec(x,1)+trialTimeSec(x,1);
            end
        end
        off(1,size(off,2)+1) = onsTimeSec(end,1)+trialTimeSec(end,1);
        
        % Calculatie durations
        dur = off - ons;
        
        onsets{z} = ons;
        durations{z} = dur;
        names{z} = titleNamesShort{z,1};
        
    end
    
    % Insert instructions variable
    [tempOns,tempSort] = sort([onsets{1,1},onsets{1,2}]);
    onsets{3} = tempOns -3.3;
    durations{3} = ones(1,size(tempOns,2))*3.3;
    names{3} = 'Instructions';
    
    % Insert crosses variable
    onsets{4} = onsets{3} - 16;
    tempDur = [durations{1,1},durations{1,2}];
    tempDur2 = tempDur(tempSort);
    onsets{4}(1,end+1) = tempOns(1,end)+tempDur(1,end);
    durations{4} = ones(1,size(onsets{4},2))*16;
    names{4} = 'Crosses';
    
    % Remove start of scan
    for x = 1:size(onsets,2)
        onsets{x} = onsets{x} - onsets{4}(1,1);
    end
    
    % Match and extract RT data for the 0-back task
    RT_0back_names = regexp([Titles{:}],'ZeroBackSlide\d+\.RT|ZeroBackSlide.RT','match'); 
    RT_0back_Cell = find(contains(Titles, RT_0back_names)); 
    RT_0back_Cell(1:2:end,:) = [];

    Resp_0back_names = regexp([Titles{:}],'ZeroBackSlide\d+\.RESP|ZeroBackSlide.RESP','match');
    Resp_0back_Cell = find(contains(Titles, Resp_0back_names));
    
    % Match and extract Hit Trials data for the 0-back task
    HitTrials_0back_names = regexp([Titles{:}],'ZeroBackSlide\d+\.CRESP|ZeroBackSlide.CRESP','match'); 
    HitTrials_0back_Cell = find(contains(Titles, HitTrials_0back_names));
    
    RT_0back = str2double(Header(RT_0back_Cell(:,1), :));   
    Resp_0back = str2double(Header(Resp_0back_Cell(:,1), :));
    Resp_0back(isnan(Resp_0back))=0;
    HitTrials_0back = str2double(Header(HitTrials_0back_Cell(:,1), :));
    HitTrials_0back(isnan(HitTrials_0back))=0;

    % Match and extract RT data for the 2-back task  
    RT_2back_names = regexp([Titles{:}],'TwoBackSlide\d+\.RT|TwoBackSlide.RT','match');
    RT_2back_Cell = find(contains(Titles, RT_2back_names));
    RT_2back_Cell(1:2:end,:) = [];
    
    % Match and extract Response data for the 2-back task  
    Resp_2back_names = regexp([Titles{:}],'TwoBackSlide\d+\.RESP|TwoBackSlide.RESP','match');
    Resp_2back_Cell = find(contains(Titles, Resp_2back_names));

    % Match and extract Hit Trials data for the 2-back task  
    HitTrials_2back_names = regexp([Titles{:}],'TwoBackSlide\d+\.CRESP|TwoBackSlide.CRESP','match');
    HitTrials_2back_Cell = find(contains(Titles, HitTrials_2back_names));
    
    RT_2back = str2double(Header(RT_2back_Cell(:,1), :));
    Resp_2back = str2double(Header(Resp_2back_Cell(:,1), :));
    Resp_2back(isnan(Resp_2back))=0;
    HitTrials_2back = str2double(Header(HitTrials_2back_Cell(:,1), :));
    HitTrials_2back(isnan(HitTrials_2back))=0;

    % Tabulate outputs
    Table_0back = table(HitTrials_0back(:,1), Resp_0back(:,1), RT_0back(:,1));
    Table_0back.Properties.VariableNames = {'HitTrials_0back','Resp_0back', 'RT_0back'};
    
    Table_2back = table(HitTrials_2back(:,1), Resp_2back(:,1), RT_2back(:,1));
    Table_2back.Properties.VariableNames = {'HitTrials_2back', 'Resp_2back', 'RT_2back'};   
    
    % Save table
    writetable(Table_0back, [pathOut,subID,'_',cond{i},'_0back.txt']);    
    writetable(Table_2back, [pathOut,subID,'_',cond{i},'_2back.txt']);    
           
end

