function [ distance ] = distance( histA, histB )
%Calculate the distance of two histograms
%   Detailed explanation goes here

%Euclidean Distance
%distance = sqrt((1/size(histA, 1)) * nansum((histA - histB).^2));

%Chi-Square Distance
distance = 0.5 * nansum((histA-histB).^2 ./ (histA+histB));
end
