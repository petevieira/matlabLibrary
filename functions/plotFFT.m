%% Function: plotFFT(signal, Fs, Nfft)
 % Parameters: signal: the signal to process
 %                 Fs: sampling frequency
 %               Nfft: # of points in the FFT
 % Description: takes in a signal, sampling frequency, and # of points
 %              in the FFT and plots the signal and the fft scaled so that
 %              the frequency scale is 1-to-1 with actual frequency
 %              component

function F1 = plotFFT(signal, Fs, Nfft)

% Plot the signal versus sample ('time')
subplot(3,1,1);
plot(signal), grid on;
xlabel('time (s)');
ylabel('amplitude');

% take N point fft of x. Divides sampling frequency by N to get Fs/N bins
F1 = abs(fft(signal, Nfft));

% adjust frequency axis to reflect actual frequencies, where N is the
% number which multiplies the frequency values to get the original freqs
N = Fs/length(F1);
baxis = 0:N:N*length(F1)/2-N;

% Plot the fft
subplot(3,1,2);
plot(baxis, (F1(1:length(F1)/2)));
grid on;
xlabel('frequency (Hz)');
ylabel('amplitude');

% Plot the spectrogram of the signal
% signal, hamming window length, # of sample each segment overlaps,
% length of FFT, sampling frequency, frequency axis.
% subplot(3,1,3);
% spectrogram(signal, Nfft, 120, 128, 1E3, 'yaxis');
% title('Spectrogram');
% colorbar
end