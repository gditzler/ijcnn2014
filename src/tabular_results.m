%     tabular_results.m
%     Copyright (C) 2013 Gregory Ditzler
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

clc;
clear;
close all;

data = {'chess','elec2','noaa','spam'};
disp(' & ftl & smv & wmv \\')
for k = 1:length(data)
  load(['results/',data{k},'.mat']);
  disp([data{k},' & ',num2str(100 * mean(errFTL),4),' & ',num2str(100 * mean(errSMV),4),...
    ' & ',num2str(100 * mean(errSWMV),4),' \\'])
end
