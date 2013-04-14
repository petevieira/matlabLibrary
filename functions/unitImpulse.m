
clc;
clear all;
close all;

% Generation of a sampled unit impulse signal
 N = 64; % define the # of samples
 n = -N/2:N/2-1; % define a vector of sample numbers 
 x = zeros(1,N); % define a vector of zeros
 x((N/2) + 1) = 1.0; % make the first sample (at t=0) to be 1
% subplot(2,1,1);
% plot(n, x); % plot the impulse signal
% grid on; % add grid to plot
% title('Unit Impulse Signal');
% xlabel('Sample Number');
% ylabel('Amplitude');
% 
 X = plotFFT(x, 1000, 256);
 Y = ifft(X);
 figure
 plot(Y);
