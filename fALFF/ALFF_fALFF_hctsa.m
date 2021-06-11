clc; clear all; close all;

% Directory to fALFF function
addpath(genpath('dir/to/humanStructureFunction'));

% Data directory
DataDir = ('..directory/with/timeseries_data/');

% Enter subject IDs
subID = {'sub-GAB001'; 'sub-GAB002'; 'sub-GAB003'; 'sub-GAB004'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010';
         'sub-GAB011'; 'sub-GAB012'; 'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'};
     
% Define sampling period
samplingPeriod = 1.418;

% Create for loop to calculate fALFF
for i = 1:length(subID)
    
    cond = {'RealPre'; 'RealPost'; 'ShamPre'; 'ShamPost'};
    
    for j = 1:length(cond)
           
        PFC_ts = dlmread([DataDir, subID{i}, '/PFC_TimeSeries/',subID{i},'_task-',cond{j},'_PFC_ts.txt']);

        y = PFC_ts;

        out{i,j} = SP_fALFF(y, samplingPeriod);        
        
    end
end

% Concatenate the structure in each cell into a structure array:
struct = [out{1:end}]; 

fALFF_mat = cat(3, struct.fALFF);

fALFF_cell = squeeze(fALFF_mat(:, :, :));

% Create table
Table = table(subID(:,1), fALFF_cell(1:18, 1), ALFF_cell(1:18, 1), ALFFpower_cell(1:18, 1), fALFF_cell(19:36, 1), ALFF_cell(19:36, 1), ALFFpower_cell(19:36, 1), fALFF_cell(37:54, 1), ALFF_cell(37:54, 1), ALFFpower_cell(37:54, 1), fALFF_cell(55:end, 1), ALFF_cell(55:end, 1), ALFFpower_cell(55:end, 1));
Table.Properties.VariableNames = {'ID' 'fALFF_RealPre' 'ALFF_RealPre' 'ALFFpower_RealPre', 'fALFF_RealPost' 'ALFF_RealPost' 'ALFFpower_RealPost', 'fALFF_ShamPre' 'ALFF_ShamPre' 'ALFFpower_ShamPre', 'fALFF_ShamPost' 'ALFF_ShamPost' 'ALFFpower_ShamPost'};

% Generate plots
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

% Save table
writetable(Table, [DataDir,'WholeBrain_fALFF.csv']);




