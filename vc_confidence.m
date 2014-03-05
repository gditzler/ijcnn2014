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