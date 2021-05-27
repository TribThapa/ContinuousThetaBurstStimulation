clc; clear all; close all;

addpath('/usr/local/spm12/matlab2015b.r6685/');
addpath(genpath('/projects/kg98/Thapa/cTBS_Study/6_RestingState/16_ALFF_fALFF/Scripts/humanStructureFunction'));

DataDir = ('/home/ttha0011/kg98/Thapa/cTBS_Study/6_RestingState/16_ALFF_fALFF/');

subID = {'sub-GAB001'}; %'sub-GAB002'; 'sub-GAB003'; 'sub-GAB004'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010';
         %'sub-GAB011'; 'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'};
     
%PFC_ts = dlmread([DataDir, 'sub-GAB001/PFC_TimeSeries/sub-GAB001_task-RealPre_PFC_ts.txt']);

samplingPeriod = 1.418;

% low = zeros(length(subID),340);

% for i = 1:length(subID)
%     y = PFC_ts(:,i);
%     w = linspace(0,pi,340);
%     [S_low, w] = periodogram(y,hamming(340),w);
%     low(i,:) = S_low;
% end
% 
% low_mean = mean(low);
% 
% f = figure('color','w');
% plot((w/(2*pi)/.72),low_mean,'.-b','linewidth',2)

% y = PFC_ts;
% numBands = 4;
% bandOfInterest = 2
% 
% powerInBand = giveMePower(y,samplingPeriod,numBands,bandOfInterest)

for i = 1:length(subID)
    
    cond = {'RealPre'; 'RealPost'; 'ShamPre'; 'ShamPost'};
    
    for j = 1:length(cond)
           
        PFC_ts = dlmread([DataDir, subID{i}, '/PFC_TimeSeries/',subID{i},'_task-',cond{j},'_PFC_ts.txt']);

        WholeBrain_ts = dlmread([DataDir, subID{i}, '/WholeBrain_TimeSeries/',subID{i},'_task-',cond{j},'_TimeSeries_Schaefer.txt']);

        y = WholeBrain_ts;

        out{i,j} = SP_fALFF(y, samplingPeriod);        
        
    end
end

struct = [out{1:end}]; %concatenate the structure in each cell into a structure array:

fALFF_mat = cat(3, struct.fALFF);
ALFF_mat = cat(3, struct.ALFF);
ALFFpower_mat = cat(3, struct.ALFFpower);

fALFF_cell = squeeze(fALFF_mat(:, :, :));
ALFF_cell = squeeze(ALFF_mat(:, :, :));
ALFFpower_cell = squeeze(ALFFpower_mat(:, :, :));

Table = table(subID(:,1), fALFF_cell(1:18, 1), ALFF_cell(1:18, 1), ALFFpower_cell(1:18, 1), fALFF_cell(19:36, 1), ALFF_cell(19:36, 1), ALFFpower_cell(19:36, 1), fALFF_cell(37:54, 1), ALFF_cell(37:54, 1), ALFFpower_cell(37:54, 1), fALFF_cell(55:end, 1), ALFF_cell(55:end, 1), ALFFpower_cell(55:end, 1));
Table.Properties.VariableNames = {'ID' 'fALFF_RealPre' 'ALFF_RealPre' 'ALFFpower_RealPre', 'fALFF_RealPost' 'ALFF_RealPost' 'ALFFpower_RealPost', 'fALFF_ShamPre' 'ALFF_ShamPre' 'ALFFpower_ShamPre', 'fALFF_ShamPost' 'ALFF_ShamPost' 'ALFFpower_ShamPost'};

%plot
subplot(3,3,1:3)
scatter(1:18, Table.fALFF_RealPre, 15, 'red', 'd',  'MarkerEdgeColor', 'red', 'LineWidth', 1);
hold on;
scatter(1:18, Table.fALFF_RealPost, 15, 'red', 'd',  'filled', 'MarkerEdgeColor', 'red', 'LineWidth', 1);
hold on;
scatter(1:18, Table.fALFF_ShamPre, 15, 'blue',  'MarkerEdgeColor', 'blue', 'LineWidth', 1);
hold on;
scatter(1:18, Table.fALFF_ShamPost, 15, 'blue', 'filled', 'MarkerEdgeColor', 'blue', 'LineWidth', 1);
%legend('RealPre', 'RealPost', 'ShamPre', 'ShamPost');
%xlabel('subject IDs');
ylabel('fALFF values');
set(gca, 'FontSize', 5)


subplot(3,3,4:6)
scatter(1:18, Table.ALFF_RealPre, 15, 'red', 'd', 'MarkerEdgeColor', 'red', 'LineWidth', 1);
hold on;
scatter(1:18, Table.ALFF_RealPost, 15, 'red', 'd', 'filled', 'MarkerEdgeColor', 'red', 'LineWidth', 1);
hold on;
scatter(1:18, Table.ALFF_ShamPre, 15, 'blue', 'MarkerEdgeColor', 'blue', 'LineWidth', 1);
hold on;
scatter(1:18, Table.ALFF_ShamPost, 15, 'blue', 'filled', 'MarkerEdgeColor', 'blue', 'LineWidth', 1);
%legend('RealPre', 'RealPost', 'ShamPre', 'ShamPost');
%xlabel('subject IDs');
ylabel('ALFF values');
set(gca, 'FontSize', 5)

subplot(3,3,7:9)
scatter(1:18, Table.ALFFpower_RealPre, 15, 'red', 'd', 'MarkerEdgeColor', 'red', 'LineWidth', 1);
hold on;
scatter(1:18, Table.ALFFpower_RealPost,15,  'red', 'd', 'filled', 'MarkerEdgeColor', 'red', 'LineWidth', 1);
hold on;
scatter(1:18, Table.ALFFpower_ShamPre, 15, 'blue', 'MarkerEdgeColor', 'blue', 'LineWidth', 1);
hold on;
scatter(1:18, Table.ALFFpower_ShamPost, 15, 'blue', 'filled', 'MarkerEdgeColor', 'blue', 'LineWidth', 1);
legend('RealPre', 'RealPost', 'ShamPre', 'ShamPost');
xlabel('subject IDs');
ylabel('ALFF power values');
set(gca, 'FontSize', 5)

writetable(Table, [DataDir,'WholeBrain_fALFF.csv']);

%saveas(gcf, [DataDir,'WholeBrain_fALFF.png']);



