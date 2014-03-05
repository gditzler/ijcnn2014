%% set paths
s = RandStream('mcg16807','Seed',0);
RandStream.setGlobalStream(s);
%% choose data 
clc; clear; 
close all;
dat = 'elec2';
n_classifiers = 25;

if strcmp(dat,'noaa')
  load neweather_rain;
  alldata = alldata';   % old format of data needs transpose
  allclass = allclass'; % ^^^^^
  win_size = 120;    % size of train / test batch (3 months - 1 season)
  mclass = 2;
elseif strcmp(dat,'elec2')
  load elec2;
  alldata(3,:) = []; % remove the "cheating" features
  alldata(4,:) = []; 
  win_size = 125;    % size of train / test batch
  alldata = alldata';   % old format of data needs transpose
  allclass = allclass'; % ^^^^^
  mclass = 2;
elseif strcmp(dat,'dataLU')
  load dataLU
  alldata = dataLU.X';
  allclass = dataLU.y' + 1;
  win_size = 100;
  mclass = max(allclass);
elseif strcmp(dat,'chess')
  load chessIZ
  alldata = alldata';   % old format of data needs transpose
  allclass = allclass'; % ^^^^^
  mclass = max(allclass);
  win_size = 35;
elseif strcmp(dat,'spam')
  load spam2
  alldata = alldata';   % old format of data needs transpose
  allclass = allclass'; % ^^^^^
  mclass = max(allclass);
  win_size = 100;
elseif strcmp(dat, 'sea')
  win_size = 250;
  len = 200;
  noise = .1;
  alldata = 10 * rand(win_size * len,3);
  s1 = sum(alldata(1:floor(win_size * len / 4),1:2),2);
  s1(s1 > 8) = 1;
  s1(s1 ~= 1) = 2;
  s2 = sum(alldata(1+floor(win_size * len / 4):2*floor(win_size * len / 4),1:2),2);
  s2(s2 > 9) = 1;
  s2(s2 ~= 1) = 2;
  s3 = sum(alldata(1+2*floor(win_size * len / 4):3*floor(win_size * len / 4),1:2),2);
  s3(s3 > 7.5) = 1;
  s3(s3 ~= 1) = 2;
  s4 = sum(alldata(1+3*floor(win_size * len / 4):end,1:2),2);
  s4(s4 > 9.5) = 1;
  s4(s4 ~= 1) = 2;
  allclass = [s1;s2;s3;s4];
  mclass = 2;
  win_size = win_size-1;
end

[data_train,data_test,labels_train,labels_test] = test_then_train(alldata, ...
  allclass, win_size);
%% run algorithms
disp([' Running FTL on ', dat])
model.type = 'CART';          % base classifier
netFTL.mclass = mclass;               % number of classes in the prediciton problem
netFTL.base_classifier = model;  % set the base classifier in the net struct
netFTL.n_classifiers = n_classifiers;
[netFTL,fmFTL,gmFTL,precFRM,recFTL,errFTL] = follow_the_leader(netFTL, ...
  data_train, labels_train, data_test, labels_test);

disp([' Running SMV on ', dat])
netSMV.mclass = mclass;               % number of classes in the prediciton problem
netSMV.base_classifier = model;  % set the base classifier in the net struct
netSMV.n_classifiers = n_classifiers;
[netSMV,fmSMV,gmSMV,precSMV,recSMV,errSMV] = smv(netSMV, data_train, ...
  labels_train, data_test, labels_test);

disp([' Running SWMV on ', dat])
netSWMV.mclass = mclass;               % number of classes in the prediciton problem
netSWMV.base_classifier = model;  % set the base classifier in the net struct
netSWMV.n_classifiers = n_classifiers;
[netSWMV,fmSWMV,gmSWMV,precSWMV,recSWMV,errSWMV] = swmv(netSWMV, data_train, ...
  labels_train, data_test, labels_test);

disp([' Running Learn++.NSE on ', dat])
netNSE.a = .5;                   % slope parameter to a sigmoid
netNSE.b = 10;                   % cutoff parameter to a sigmoid
netNSE.threshold = 0.01;         % how small is too small for error
netNSE.mclass = mclass;          % number of classes in the prediciton problem
netNSE.base_classifier = model;  % set the base classifier in the net struct
[netNSE,fmNSE,gmNSE,precNSE,recNSE,errNSE] = learn_nse(netNSE, data_train, ...
  labels_train, data_test, labels_test);

lw = 2;
fs = 18;
h=figure; 
hold on;
box on;
plot(errFTL, 'ro-', 'LineWidth', lw);
plot(errSMV, 'bx-', 'LineWidth', lw);
plot(errSWMV, 'ms-', 'LineWidth', lw);
plot(errNSE, 'k*-', 'LineWidth', lw);
legend('FTL', 'SMV', 'WMV', 'L++.NSE');
%saveas(gcf, ['./results/',dat,'-error'], 'fig')
%save(['./results/',dat,'.mat'])
