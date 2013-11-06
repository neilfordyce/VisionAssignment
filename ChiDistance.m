function [ Chi ] = ChiDistance( histA, histB )
%Calculate the Chi-square distance of two histograms
%   Detailed explanation goes here
Chi = sqrt((1/size(histA, 1)) * nansum((histA - histB).^2));
%Chi = 0.5 * nansum((histA-histB).^2 ./ (histA+histB));
end