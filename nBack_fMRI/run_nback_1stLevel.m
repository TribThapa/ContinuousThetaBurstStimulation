clear; clc; close all;

% Add paths
addpath('.../..../.../..../to/1stLevelAnalysis/');
addpath('/usr/local/spm12/matlab2015b.r6685/');

% Enter subject IDs
id = {'sub-GAB002'; 'sub-GAB003'; 'sub-GAB005'; 'sub-GAB006'; 'sub-GAB007'; 'sub-GAB008'; 'sub-GAB009'; 'sub-GAB010'; 'sub-GAB011'; 'sub-GAB012'; 
      'sub-GAB013'; 'sub-GAB014'; 'sub-GAB015'; 'sub-GAB016'; 'sub-GAB018'; 'sub-GAB019'};

% Enter parameters for the the function 
timePoint = {'PRE_REAL_NBACK';'POST_REAL_NBACK'; 'PRE_SHAM_NBACK'; 'POST_SHAM_NBACK'};
N = 119;

for x = 1:size(id,1)
    for y = 1:size(timePoint,1)
        nback_1stLevel(id{x,1},timePoint{y,1},N);
    end
end