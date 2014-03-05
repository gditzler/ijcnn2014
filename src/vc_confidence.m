%     vc_confidence.m
%     Copyright (C) 2014 Gregory Ditzler
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

delta = .05;
d = [100 200 500 5000];
N = 100:100:1e6;
c = {'r','b','k','c','g'};

figure;
hold on;
box on;
for i = 1:length(d)
  f = 4 * sqrt((2*d(i)*log(N)+log(2./delta))./N);
  plot(N, f, c{i}, 'LineWidth', 2)
end
ylim([0,3])
set(gca, 'fontsize', 18)
xlabel('N', 'FontSize', 18)
ylabel('VC confidence', 'FontSize', 18)
legend({'\nu=100','\nu=200','\nu=500','\nu=5000'})
