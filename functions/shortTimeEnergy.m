function shortTimeEnergy = shortTimeEnergy(x, Fs, window, print)

% INPUT
    % x:      input signal
    % window: window function to use for analysis

% BRIEF
    % computes the short time energy of the input
    % signal, x, using the specified window function
    % STE = sum(x^2 * window)
    
    if nargin < 2
        frameTime = 0.015; % seconds
        Fs = 8000; % samples/second
    end
    
    if nargin < 3
        window = hamming(frameTime*Fs);
    end
    
    if nargin < 4
        print = 0;
    end

    xLength = length(x); % length of input signal
    wLength = length(window); % length of window
    overlap = length(window)-1; % overlap
    
    % Separate signal into frames and window them
    xFramed   = buffer(x, wLength, overlap, 'nodelay');
    xWindowed = diag(sparse(window)) * xFramed;
    
    % Compute short-time energy of each framed, windowed signal
    shortTimeEnergy = sum(xWindowed.^2,1); % initialize
    
    % Plot speech signal and its short-time energy
    if print == 1
        t = (0:xLength-1)/Fs;
        plot(t,x);
        title('Speech Signal');
        xlims = get(gca, 'Xlim');
        
        hold on;

        delay = ceil((wLength-1)/2);
        tDelay = t(delay:end-delay);
        plot(tDelay, shortTimeEnergy, 'r');
        xlim(xlims);
        xlabel('Time (sec)');
        legend({'Speech', 'Short-time Energy'});
        hold off;
    end
    
end