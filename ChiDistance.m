function [ Chi ] = ChiDistance( histA, histB )
%Calculate the Chi-square distance of two histograms
%   Detailed explanation goes here
Chi = 0.5 * sum((histA-histB).^2 / (histA+histB));
end