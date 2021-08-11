clc; clear all; close all;

% DataDir
%DataDir = '/home/ttha0011/kg98/Thapa/cTBS_Study/3_Rawdata/JournalRebuttal_NeuroImage/';
DataDir = '/projects/kg98/Thapa/cTBS_Study/3_Rawdata/JournalRebuttal_NeuroImage/';


% Read in file
DLPFC_GABA = readtable([DataDir, 'DLPFC_GABA_MLE.csv']);

VisCor_GABA = readtable([DataDir, 'VisCor_GABA_MLE.csv']);

% Run MLE analysis
lme_dlpfc_gaba = fitlme(DLPFC_GABA,'GABA~Time+(1|Cond)+(Time-1|Cond)'); % DLPFC GABA - examine the main effect of Time while controlling for effect of condition

lme_viscor_gaba = fitlme(VisCor_GABA,'GABA~Time+(1|Cond)+(Time-1|Cond)'); % Visual cortex GABA - examine the main effect of Time while controlling for effect of condition

lme_dlpfc_gaba_2fixed_effects = fitlme(DLPFC_GABA,'GABA ~ Time * Cond'); % DLPFC GABA - examine the main effects of Time and Condition 

lme_viscor_gaba_2fixed_effects = fitlme(VisCor_GABA,'GABA ~ Time * Cond'); % Visual cortex GABA - examine the main effects of Time and Condition