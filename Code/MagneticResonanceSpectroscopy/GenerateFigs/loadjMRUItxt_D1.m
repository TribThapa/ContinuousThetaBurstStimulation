clc; clear all; close all;
 
opts = delimitedTextImportOptions("NumVariables", 4);

% Specify range and delimiter
opts.DataLines = [23, Inf];
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["sigreal", "sigimag", "fftreal", "fftimag"];
opts.VariableTypes = ["double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
Allspectrum = readtable("/projects/kg98/Thapa/cTBS_Study/3_Rawdata/RDAfiles_ChaoTest/RealPost_DLPFC/RealPost_DLPFC_All_PPM.txt", opts);

% Convert to output type
All = table2array(Allspectrum);

% Clear temporary variables
clear opts

S=zeros(1024,8)';

for i=1:8 
    S(i,:)=All((i-1)*1025+1:(i-1)*1025+1024,3);
end
    
for i=1:8
    plot(S(i,:),'k')
    hold on
    set(gca,'XDir','reverse')
end

 MEANALL=loadmean;
 MEAN=MEANALL(:,3);
 plot(MEAN,'r','LineWidth',4)
 
 hold off

 function MEAN=loadmean
 
 opts = delimitedTextImportOptions("NumVariables", 4);

% Specify range and delimiter
opts.DataLines = [23, Inf];
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["sigreal", "sigimag", "fftreal", "fftimag"];
opts.VariableTypes = ["double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
Mean = readtable("/projects/kg98/Thapa/cTBS_Study/3_Rawdata/RDAfiles_ChaoTest/RealPost_DLPFC/RealPost_DLPFC_Allavg_PPM.txt", opts);

% Convert to output type
MEAN = table2array(Mean);

% Clear temporary variables
clear opts

 end
 

