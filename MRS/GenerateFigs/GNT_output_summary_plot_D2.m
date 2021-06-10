clc; clear all; close all;

DataPath = '/projects/kg98/Thapa/cTBS_Study/3_Rawdata/GenerateFigs/2_GannetApproach/';

DLPFC_Real_Pre_Dir = fullfile(DataPath,'RealPre_DLPFC/');
DLPFC_Real_Post_Dir = fullfile(DataPath,'RealPost_DLPFC/');
VisCor_Real_Pre_Dir = fullfile(DataPath,'RealPre_VisCor/');
VisCor_Real_Post_Dir = fullfile(DataPath,'RealPost_VisCor/');

DLPFC_Real_Pre = dir([DLPFC_Real_Pre_Dir,  '*.mat']);
DLPFC_Real_Post = dir([DLPFC_Real_Post_Dir, '*.mat']);
VisCor_Real_Pre = dir([VisCor_Real_Pre_Dir,  '*.mat']);
VisCor_Real_Post = dir([VisCor_Real_Post_Dir, '*.mat']);

DLPFC_Sham_Pre_Dir = fullfile(DataPath,'ShamPre_DLPFC/');
DLPFC_Sham_Post_Dir = fullfile(DataPath,'ShamPost_DLPFC/');
VisCor_Sham_Pre_Dir = fullfile(DataPath,'ShamPre_VisCor/');
VisCor_Sham_Post_Dir = fullfile(DataPath,'ShamPost_VisCor/');

DLPFC_Sham_Pre = dir([DLPFC_Sham_Pre_Dir,  '*.mat']);
DLPFC_Sham_Post = dir([DLPFC_Sham_Post_Dir, '*.mat']);
VisCor_Sham_Pre = dir([VisCor_Sham_Pre_Dir,  '*.mat']);
VisCor_Sham_Post = dir([VisCor_Sham_Post_Dir, '*.mat']);


DLPFC_Real_Pre_Folder = cell({DLPFC_Real_Pre.folder});
DLPFC_Real_Pre_Name = cell({DLPFC_Real_Pre.name});

DLPFC_Real_Post_Folder = cell({DLPFC_Real_Post.folder});
DLPFC_Real_Post_Name = cell({DLPFC_Real_Post.name});

VisCor_Real_Pre_Folder = cell({VisCor_Real_Pre.folder});
VisCor_Real_Pre_Name = cell({VisCor_Real_Pre.name});

VisCor_Real_Post_Folder = cell({VisCor_Real_Post.folder});
VisCor_Real_Post_Name = cell({VisCor_Real_Post.name});

DLPFC_Sham_Pre_Folder = cell({DLPFC_Sham_Pre.folder});
DLPFC_Sham_Pre_Name = cell({DLPFC_Sham_Pre.name});

DLPFC_Sham_Post_Folder = cell({DLPFC_Sham_Post.folder});
DLPFC_Sham_Post_Name = cell({DLPFC_Sham_Post.name});

VisCor_Sham_Pre_Folder = cell({VisCor_Sham_Pre.folder});
VisCor_Sham_Pre_Name = cell({VisCor_Sham_Pre.name});

VisCor_Sham_Post_Folder = cell({VisCor_Sham_Post.folder});
VisCor_Sham_Post_Name = cell({VisCor_Sham_Post.name});

for i = 1:length(DLPFC_Real_Pre_Folder)
    
    DLPFC_Real_Pre_File = ([DLPFC_Real_Pre_Folder{i}, filesep, DLPFC_Real_Pre_Name{i}]);
    DLPFC_Real_Post_File = ([DLPFC_Real_Post_Folder{i}, filesep, DLPFC_Real_Post_Name{i}]);
    VisCor_Real_Pre_File = ([VisCor_Real_Pre_Folder{i}, filesep, VisCor_Real_Pre_Name{i}]);
    VisCor_Real_Post_File = ([VisCor_Real_Post_Folder{i}, filesep, VisCor_Real_Post_Name{i}]);
    DLPFC_Sham_Pre_File = ([DLPFC_Sham_Pre_Folder{i}, filesep, DLPFC_Sham_Pre_Name{i}]);
    DLPFC_Sham_Post_File = ([DLPFC_Sham_Post_Folder{i}, filesep, DLPFC_Sham_Post_Name{i}]);
    VisCor_Sham_Pre_File = ([VisCor_Sham_Pre_Folder{i}, filesep, VisCor_Sham_Pre_Name{i}]);
    VisCor_Sham_Post_File = ([VisCor_Sham_Post_Folder{i}, filesep, VisCor_Sham_Post_Name{i}]);
    
    DLPFC_Real_Pre_all{i} = [DLPFC_Real_Pre_File];
    DLPFC_Real_Post_all{i} = [DLPFC_Real_Post_File];
    VisCor_Real_Pre_all{i} = [VisCor_Real_Pre_File];
    VisCor_Real_Post_all{i} = [VisCor_Real_Post_File];
    DLPFC_Sham_Pre_all{i} = [DLPFC_Sham_Pre_File];
    DLPFC_Sham_Post_all{i} = [DLPFC_Sham_Post_File];
    VisCor_Sham_Pre_all{i} = [VisCor_Sham_Pre_File];
    VisCor_Sham_Post_all{i} = [VisCor_Sham_Post_File];
    
end

SUM=zeros(1,39318);
for j = 1:length(DLPFC_Real_Pre_all)    
    load(DLPFC_Real_Pre_all{j});
    yogabagaba = [MRS_struct.out.vox1.GABA.Area MRS_struct.out.vox1.Cr.Area MRS_struct.out.vox1.Cho.Area MRS_struct.out.vox1.water.Area MRS_struct.out.vox1.GABA.ConcCr MRS_struct.out.vox1.GABA.ConcCho MRS_struct.out.vox1.GABA.ConcIU MRS_struct.out.vox1.GABA.FitError MRS_struct.out.vox1.GABA.FWHM MRS_struct.out.vox1.GABA.SNR MRS_struct.out.vox1.Cr.FWHM MRS_struct.out.SpecReg.freq MRS_struct.out.vox1.water.FitError MRS_struct.out.vox1.water.SNR MRS_struct.out.vox1.GABA.FitError_W MRS_struct.out.vox1.Cr.FitError MRS_struct.out.vox1.GABA.FitError_Cr];
    yogabagaba = yogabagaba';
    figure(1)
    PaperPlotJC(MRS_struct.spec.freq, MRS_struct.spec.vox1.GABAGlx.diff,'k')
    title('DLPFC Real Pre')
    hold on;   
    
    % building SUM
    SUM=SUM+MRS_struct.spec.vox1.GABAGlx.diff;
    
end
MEAN=SUM./length(DLPFC_Real_Pre_all);
plot(MRS_struct.spec.freq,MEAN,'r','LineWidth',3);
hold off
saveas(gcf, [DataPath, 'DLPFC_Real_Pre_all.png']);



SUM=zeros(1,39318);
for k = 1:length(DLPFC_Real_Post_all)    
    load(DLPFC_Real_Post_all{k});
    yogabagaba = [MRS_struct.out.vox1.GABA.Area MRS_struct.out.vox1.Cr.Area MRS_struct.out.vox1.Cho.Area MRS_struct.out.vox1.water.Area MRS_struct.out.vox1.GABA.ConcCr MRS_struct.out.vox1.GABA.ConcCho MRS_struct.out.vox1.GABA.ConcIU MRS_struct.out.vox1.GABA.FitError MRS_struct.out.vox1.GABA.FWHM MRS_struct.out.vox1.GABA.SNR MRS_struct.out.vox1.Cr.FWHM MRS_struct.out.SpecReg.freq MRS_struct.out.vox1.water.FitError MRS_struct.out.vox1.water.SNR MRS_struct.out.vox1.GABA.FitError_W MRS_struct.out.vox1.Cr.FitError MRS_struct.out.vox1.GABA.FitError_Cr];
    yogabagaba = yogabagaba';
    figure(2)
    PaperPlotJC(MRS_struct.spec.freq, MRS_struct.spec.vox1.GABAGlx.diff,'k')
    title('DLPFC Real Post')
    hold on;    
    
    % building SUM
    SUM=SUM+MRS_struct.spec.vox1.GABAGlx.diff;
end
MEAN=SUM./length(DLPFC_Real_Post_all);
plot(MRS_struct.spec.freq,MEAN,'r','LineWidth',3);
hold off
saveas(gcf, [DataPath, 'DLPFC_Real_Post_all.png']);


SUM=zeros(1,39318);
for l = 1:length(VisCor_Real_Pre_all)    
    load(VisCor_Real_Pre_all{l});
    yogabagaba = [MRS_struct.out.vox1.GABA.Area MRS_struct.out.vox1.Cr.Area MRS_struct.out.vox1.Cho.Area MRS_struct.out.vox1.water.Area MRS_struct.out.vox1.GABA.ConcCr MRS_struct.out.vox1.GABA.ConcCho MRS_struct.out.vox1.GABA.ConcIU MRS_struct.out.vox1.GABA.FitError MRS_struct.out.vox1.GABA.FWHM MRS_struct.out.vox1.GABA.SNR MRS_struct.out.vox1.Cr.FWHM MRS_struct.out.SpecReg.freq MRS_struct.out.vox1.water.FitError MRS_struct.out.vox1.water.SNR MRS_struct.out.vox1.GABA.FitError_W MRS_struct.out.vox1.Cr.FitError MRS_struct.out.vox1.GABA.FitError_Cr];
    yogabagaba = yogabagaba';
    figure(3)
    PaperPlotJC(MRS_struct.spec.freq, MRS_struct.spec.vox1.GABAGlx.diff,'k')
    title('VisCor Real Pre')
    hold on;   

    % building SUM
    SUM=SUM+MRS_struct.spec.vox1.GABAGlx.diff;
end
MEAN=SUM./length(VisCor_Real_Pre_all);
plot(MRS_struct.spec.freq,MEAN,'r','LineWidth',3);
hold off
saveas(gcf, [DataPath, 'VisCor_Real_Pre_all.png']);



SUM=zeros(1,39318);
for m = 1:length(VisCor_Real_Post_all)    
    load(VisCor_Real_Post_all{m});
    yogabagaba = [MRS_struct.out.vox1.GABA.Area MRS_struct.out.vox1.Cr.Area MRS_struct.out.vox1.Cho.Area MRS_struct.out.vox1.water.Area MRS_struct.out.vox1.GABA.ConcCr MRS_struct.out.vox1.GABA.ConcCho MRS_struct.out.vox1.GABA.ConcIU MRS_struct.out.vox1.GABA.FitError MRS_struct.out.vox1.GABA.FWHM MRS_struct.out.vox1.GABA.SNR MRS_struct.out.vox1.Cr.FWHM MRS_struct.out.SpecReg.freq MRS_struct.out.vox1.water.FitError MRS_struct.out.vox1.water.SNR MRS_struct.out.vox1.GABA.FitError_W MRS_struct.out.vox1.Cr.FitError MRS_struct.out.vox1.GABA.FitError_Cr];
    yogabagaba = yogabagaba';
    figure(4)
    PaperPlotJC(MRS_struct.spec.freq, MRS_struct.spec.vox1.GABAGlx.diff,'k')
    title('VisCor Real Post')
    hold on;   

    % building SUM
    SUM=SUM+MRS_struct.spec.vox1.GABAGlx.diff;
end
MEAN=SUM./length(VisCor_Real_Post_all);
plot(MRS_struct.spec.freq,MEAN,'r','LineWidth',3);
hold off
saveas(gcf, [DataPath, 'VisCor_Real_Post_all.png']);



SUM=zeros(1,39318);
for n = 1:length(DLPFC_Sham_Pre_all)    
    load(DLPFC_Sham_Pre_all{n});
    yogabagaba = [MRS_struct.out.vox1.GABA.Area MRS_struct.out.vox1.Cr.Area MRS_struct.out.vox1.Cho.Area MRS_struct.out.vox1.water.Area MRS_struct.out.vox1.GABA.ConcCr MRS_struct.out.vox1.GABA.ConcCho MRS_struct.out.vox1.GABA.ConcIU MRS_struct.out.vox1.GABA.FitError MRS_struct.out.vox1.GABA.FWHM MRS_struct.out.vox1.GABA.SNR MRS_struct.out.vox1.Cr.FWHM MRS_struct.out.SpecReg.freq MRS_struct.out.vox1.water.FitError MRS_struct.out.vox1.water.SNR MRS_struct.out.vox1.GABA.FitError_W MRS_struct.out.vox1.Cr.FitError MRS_struct.out.vox1.GABA.FitError_Cr];
    yogabagaba = yogabagaba';
    figure(5)
    PaperPlotJC(MRS_struct.spec.freq, MRS_struct.spec.vox1.GABAGlx.diff,'k')
    title('DLPFC Sham Pre')    
    hold on;   

    % building SUM
    SUM=SUM+MRS_struct.spec.vox1.GABAGlx.diff;
end
MEAN=SUM./length(DLPFC_Sham_Pre_all);
plot(MRS_struct.spec.freq,MEAN,'r','LineWidth',3);
hold off
saveas(gcf, [DataPath, 'DLPFC_Sham_Pre_all.png']);



SUM=zeros(1,39318);
for o = 1:length(DLPFC_Sham_Post_all)    
    load(DLPFC_Sham_Post_all{o});
    yogabagaba = [MRS_struct.out.vox1.GABA.Area MRS_struct.out.vox1.Cr.Area MRS_struct.out.vox1.Cho.Area MRS_struct.out.vox1.water.Area MRS_struct.out.vox1.GABA.ConcCr MRS_struct.out.vox1.GABA.ConcCho MRS_struct.out.vox1.GABA.ConcIU MRS_struct.out.vox1.GABA.FitError MRS_struct.out.vox1.GABA.FWHM MRS_struct.out.vox1.GABA.SNR MRS_struct.out.vox1.Cr.FWHM MRS_struct.out.SpecReg.freq MRS_struct.out.vox1.water.FitError MRS_struct.out.vox1.water.SNR MRS_struct.out.vox1.GABA.FitError_W MRS_struct.out.vox1.Cr.FitError MRS_struct.out.vox1.GABA.FitError_Cr];
    yogabagaba = yogabagaba';
    figure(6)
    PaperPlotJC(MRS_struct.spec.freq, MRS_struct.spec.vox1.GABAGlx.diff,'k')
    title('DLPFC Sham Post')
    hold on;   

    % building SUM
    SUM=SUM+MRS_struct.spec.vox1.GABAGlx.diff;
end
MEAN=SUM./length(DLPFC_Sham_Post_all);
plot(MRS_struct.spec.freq,MEAN,'r','LineWidth',3);
hold off
saveas(gcf, [DataPath, 'DLPFC_Sham_Post_all.png']);



SUM=zeros(1,39318); 
for p = 1:length(VisCor_Sham_Pre_all)    
    load(VisCor_Sham_Pre_all{p});
    yogabagaba = [MRS_struct.out.vox1.GABA.Area MRS_struct.out.vox1.Cr.Area MRS_struct.out.vox1.Cho.Area MRS_struct.out.vox1.water.Area MRS_struct.out.vox1.GABA.ConcCr MRS_struct.out.vox1.GABA.ConcCho MRS_struct.out.vox1.GABA.ConcIU MRS_struct.out.vox1.GABA.FitError MRS_struct.out.vox1.GABA.FWHM MRS_struct.out.vox1.GABA.SNR MRS_struct.out.vox1.Cr.FWHM MRS_struct.out.SpecReg.freq MRS_struct.out.vox1.water.FitError MRS_struct.out.vox1.water.SNR MRS_struct.out.vox1.GABA.FitError_W MRS_struct.out.vox1.Cr.FitError MRS_struct.out.vox1.GABA.FitError_Cr];
    yogabagaba = yogabagaba';
    figure(7)
    PaperPlotJC(MRS_struct.spec.freq, MRS_struct.spec.vox1.GABAGlx.diff,'k')
    title('VisCor Sham Pre')
    hold on;
    
    % building SUM
    SUM=SUM+MRS_struct.spec.vox1.GABAGlx.diff;
end
MEAN=SUM./length(VisCor_Sham_Pre_all);
plot(MRS_struct.spec.freq,MEAN,'r','LineWidth',3);
hold off
saveas(gcf, [DataPath, 'VisCor_Sham_Pre_all.png']);



SUM=zeros(1,39318);
for q = 1:length(VisCor_Sham_Post_all)    
    load(VisCor_Sham_Post_all{q});
    yogabagaba = [MRS_struct.out.vox1.GABA.Area MRS_struct.out.vox1.Cr.Area MRS_struct.out.vox1.Cho.Area MRS_struct.out.vox1.water.Area MRS_struct.out.vox1.GABA.ConcCr MRS_struct.out.vox1.GABA.ConcCho MRS_struct.out.vox1.GABA.ConcIU MRS_struct.out.vox1.GABA.FitError MRS_struct.out.vox1.GABA.FWHM MRS_struct.out.vox1.GABA.SNR MRS_struct.out.vox1.Cr.FWHM MRS_struct.out.SpecReg.freq MRS_struct.out.vox1.water.FitError MRS_struct.out.vox1.water.SNR MRS_struct.out.vox1.GABA.FitError_W MRS_struct.out.vox1.Cr.FitError MRS_struct.out.vox1.GABA.FitError_Cr];
    yogabagaba = yogabagaba';
    figure(8)
    PaperPlotJC(MRS_struct.spec.freq, MRS_struct.spec.vox1.GABAGlx.diff,'k')
    title('VisCor Sham Post')
    hold on; 
    
    % building SUM
    SUM=SUM+MRS_struct.spec.vox1.GABAGlx.diff;
end
MEAN=SUM./length(VisCor_Sham_Post_all);
plot(MRS_struct.spec.freq,MEAN,'r','LineWidth',3);
hold off
saveas(gcf, [DataPath, 'VisCor_Sham_Post_all.png']);

