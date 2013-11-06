function [ Chi ] = ChiDistance( histA, histB )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Chi = sqrt((1/size(histA, 1)) * nansum((histA - histB).^2));
%Chi = 0.5 * nansum((histA-histB).^2 ./ (histA+histB));
end