function r = autocorrelation(x, numOfLags)
% BRIEF
    % computes the autocorrelation of the input
    % signal, x, creating a vector with a length
    % equivalent to the number of lags.
% INPUT
    % x: input signal
    % numOfLags: number of lags to compute
    
    xLength = length(x); % length of input signal
    numOfLags = abs(numOfLags) + 1; % add 1 to include zero lag
    
    r = zeros(1,numOfLags); % initialize output vector, r
    
    for i = 1:numOfLags % from zero-lag to number of lags
       y = x(1:(xLength-i+1)).*x(i:xLength);
       r(1,i) = sum(y(1:(xLength-i+1)));
    end
end