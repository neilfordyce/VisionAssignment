function [ Chi ] = ChiDistance( A, B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

binNum = 1024;

A = double(A);
B = double(B);

a = (A(:,:,1) * 256^2 + A(:,:,2) * 256 + A(:,:,3));
b = (B(:,:,1) * 256^2 + A(:,:,2) * 256 + B(:,:,3));

histA = hist(a(:), binNum)/numel(a);
histB = hist(b(:), binNum)/numel(b);

Chi = 0.5 * sum((histA-histB).^2 / (histA+histB));
end