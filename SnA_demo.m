rawDataFile = 'test_data.mat';
rawDataVar = 'T';
io_format = 'double';
N = 1000;
D = 5;
c = 2;
n = 100;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---------- DO NOT EDIT BELOW THIS LINE ---------- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

param.rawDataFile        = rawDataFile;
param.rawDataVar         = rawDataVar;
param.io_format          = io_format;
param.N                  = N;
param.D                  = D;
param.c                  = c;
param.n                  = n;
param.share_directory    = './';
param.fileName_directory = './worker0/';
param.fileName_prefix    = [param.fileName_directory '/dSq_N' num2str(N) '_n' num2str(n)];
param.fileName_template  = [param.fileName_prefix '_c%d_row%d_col%d.dat'];

SnA(param,1,0);
dSq_collect = collect_dSq(['dSq_N' num2str(N) '_n' num2str(n) '_c%d_row%d_col%d.dat'],io_format,N,n,c);

load(rawDataFile,rawDataVar)
command = sprintf("%s = %s(1:N,1:D)';",rawDataVar,rawDataVar);
eval(command)
command = sprintf("dSq_direct = dmat(concat(%s,c));",rawDataVar);
eval(command)
compareResults(dSq_direct,dSq_collect,c,0)
