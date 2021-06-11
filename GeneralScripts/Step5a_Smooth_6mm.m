% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'..../.../....Step5a_Smooth_6mm_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
