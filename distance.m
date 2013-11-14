function [ distance ] = distance( histA, histB )
%Calculate the Chi-square distance of two histograms
%   Detailed explanation goes here

% Below is the Euclidean Distance
%distance = sqrt((1/size(histA, 1)) * nansum((histA - histB).^2));
distance = 0.5 * nansum((histA-histB).^2 ./ (histA+histB));
end