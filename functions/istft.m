function x = istft(X, Npt, window, overlap)
    % INPUTS
        % X: fft of a signal to be inverted
        % Npt: length of istft
        % window: window function sequence
        % overlap: amount to overlap between istft
    % BRIEF
        % takes the inverse short-time Fourier transfer of a 
        % signal in frequency domain using an N-point ifft,
        % the specified window function and overlap
        
    if nargin < 2; Npt = 2*(size(X,1)-1); end
    if nargin < 3; window = 0; end
    if nargin < 4; overlap = 0; end
    
    sigLength = size(X);
    cols = sigLength(2);
    
    % set frame overlap if not specified
    if overlap == 0
        overlap = floor(length(window)/2);
    end
    
    % create storage holder for output array
    xLength = Npt + (cols-1)*overlap;
    x = zeros(1, xLength);
    
    for b = 0:overlap:(overlap*(cols-1))
        % get next frame of FFT
        F = X(:,1+b/overlap)';
        % 
        F = [F, conj(F([((Npt/2)):-1:2]))];
        px = real(ifft(F)); % compute ifft
        % store it
        x((b+1):(b+Npt)) = x((b+1):(b+Npt))+px.*window;
    end;
end