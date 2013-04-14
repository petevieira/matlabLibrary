
clc;
clear all;
close all;

% Generation of a sampled unit step signal
N = 64; % define the # of samples
n = -N/2:N/2-1; % define a vector of sample numbers 
x = zeros(1,N); % define a vector of zeros
x(N/2+2:N) = 1.0;
subplot(2,1,1);
plot(n, x); % plot the impulse signal
axis([-N/2,N/2, -.5, 1.5]);
grid on; % add grid to plot
title('Unit Step Signal');
xlabel('Sample Number');
ylabel('Amplitude');

plotXCorr(x);
