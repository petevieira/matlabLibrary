function X = stft(x, Nfft, window, overlap)
    % INPUTS
        % x: signal to process
        % Npt: length of fft (default = 256)
        % window: length of hamming window (default = N)
        % overlap: fft frame overlap (default = w/2)
        % Fs: sampling frequency
    % BRIEF
        % takes the short time Fourier transform of signal x using
        % a f-point FFT, and an overlap of 'overlap'.

    % set default values if no arguments given
    if nargin < 2; Nfft = 256; end
    if nargin < 3; window = Nfft; end
    if nargin < 4; overlap = 0; end

    % change x to a row vector if it's not
    if size(x,1) > 1;
        x = x';
    end

    % store signal length
    sigLength = length(x);

    % if overlap not specified, set it to half the window length
    if overlap == 0
        overlap = floor(length(window)/2);
    end

    % counter for columns of fft storer
    c = 1;
 
    % pre-allocate memory for fft storer
    xTemp = zeros((Nfft/2+1), 1+fix((sigLength-Nfft)/overlap));

    % for each frame, with overlap 'overlap'
    for b = 0:overlap:(length(x)-Nfft)
        % get frame from b+1 to b+f(length of stft)
        u = window.*x((b+1):(b+Nfft));
        % take fft of the current frame
        t = fft(u);
        % save half of the fft
        xTemp(:,c) = t(1:Nfft/2+1)';
        % increment column counter
        c = c + 1;
    end
    X = xTemp; % output
end