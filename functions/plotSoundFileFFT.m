
%% Function: plotSoundFileFFT(wavFile)
%  Usage 1: plotFFT('coolSound.wav'); this won't play the file
%  Usage 2: plotFFT('coolSound.wav', true); this will play the file
%  Description: This function takes a .wav file and plots the waveform and
%  the fft.

function [] = plotSoundFileFFT(wavFile, playSound)

% Set default for second argument if not specified
if (nargin < 2)
    playSound = false;
end

% Read .wav file (y(sampled data), sample rate(Fs), #of bits/sample(nbits)
[signal, Fs, nbits] = wavread(wavFile);

% Plot waveform
subplot(3,1,1);
plot(signal);
xlabel('time (s)');
ylabel('amplitude');

% Play waveform if 2nd argument is true
if (playSound == true)
    sound(signal, Fs);
end

% take N point fft of x. Divides sampling frequency by N to get Fs/N bins
F1 = abs(fft(signal, length(signal))); 

% adjust frequency axis to reflect actual frequencies, where N is the
% number which multiplies the frequency values to get the original freqs
N = Fs/length(F1);
baxis = 0:N:N*length(F1)/2-N;

% Add plot of fft
subplot(3,1,2);
plot(baxis, real(F1(1:length(F1)/2)));
grid on;
xlabel('frequency (Hz)');
ylabel('amplitude');

% Plot the spectrogram of the signal
% signal, hamming window length, # of sample each segment overlaps,
% length of FFT, frequency axis.
% subplot(3,1,3);
% spectrogram(signal(1));
% title('Spectrogram');
% colorbar

end