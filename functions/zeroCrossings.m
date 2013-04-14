function zeroCross = zeroCrossings(x, window)
% INPUTS
    % x:         input signal
    % Fs:        sampling frequency
    % frameTime: # of seconds to compute zero crossing rate over

% BRIEF

    if nargin < 2
        window = hamming(0.015*8000); % default frame time (s)
    end
    
    xLength = length(x); % length of input signal
    wLength = length(window); % length of window
    
    % initialize column vector for zero crossings
    zeroCross = zeros(xLength,1);

    for i=1:xLength - wLength-1
        wSig = x(i:i+wLength-1).*window;
        for j=1:wLength-1
            if (wSig(j)<0 && wSig(j+1)>0 || wSig(j)>0 && wSig(j+1)<0)
                zeroCross(i) = zeroCross(i) + 1;
            end
        end
    end
    
end
