function [ Chi ] = ChiDistance( histA, histB )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Chi = 0.5 * sum((histA-histB).^2 / (histA+histB));
end