function [ O ] = LBPHist( I )
%Computes an LBP texture map of the input image I, then returns a
%normalised histogram of the gradient values.
    O = rgb2gray(I);
    O = efficientLBP(O);
    O = imhist(O)/numel(I);
    O = O';
end

