clc
clear
close all

data = {'chess','elec2','noaa','spam'};
disp(' & ftl & smv & wmv \\')
for k = 1:length(data)
  load(['results/',data{k},'.mat']);
  disp([data{k},' & ',num2str(100 * mean(errFTL),4),' & ',num2str(100 * mean(errSMV),4),...
    ' & ',num2str(100 * mean(errSWMV),4),' \\'])
end