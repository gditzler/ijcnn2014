%     demo_sea.m
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
N = 500;
sz=2;

h1=figure;
hold on;
fill([0 0 7 0], [0 7 0 0], 'r')
fill([0 0 10 10 7 0],[7 10 10 0 0 7],'g')
plot(10*rand(N,1), 10*rand(N,1), 'o','LineWidth',sz, 'MarkerEdgeColor','none','MarkerFaceColor','k')
set(gca, 'fontsize', 22)

h2=figure;
hold on;
fill([0 0 9 0], [0 9 0 0], 'r')
fill([0 0 10 10 9 0],[9 10 10 0 0 9],'g')
plot(10*rand(N,1), 10*rand(N,1), 'o','LineWidth',sz, 'MarkerEdgeColor','none','MarkerFaceColor','k')
set(gca, 'fontsize', 22)
saveas(h1,'sea-evn0.eps','eps2c')
saveas(h2,'sea-evn1.eps','eps2c')
