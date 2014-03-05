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