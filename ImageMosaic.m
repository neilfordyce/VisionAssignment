function [ O ] = ImageMosaic( I, images )
%Makes a new composite image O, based on target image I
%   Detailed explanation goes here

O = I;
images = double(images);
I = double(I);

    for j=200:200:size(I, 1)
        for k=200:200:size(I, 2)
            subImage = GetMostSimilarImage(I(j-199:j, k-199:k, :), images);
            O(j-199:j, k-199:k, :) = subImage;
        end
    end
end
