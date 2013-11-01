function [ O ] = ImageMosaic( I, images )
%Makes a new composite image O, based on target image I
%   Detailed explanation goes here

O = I;
images = double(images);
I = double(I);

    %Compute all the source histograms now
    imageHists = [];
    binNum = 1024;
    for j=1:size(images,4)
        image = images(:,:,:,j);
        image = (image(:,:,1) * 256^2 + image(:,:,2) * 256 + image(:,:,3));
        imageHists = [imageHists; hist(image(:), binNum)/numel(image)];
    end

    'done computing source histograms'

    for j=200:200:size(I, 1)
        for k=200:200:size(I, 2)
            subImageIndex = GetMostSimilarImage(I(j-199:j, k-199:k, :), imageHists);
            O(j-199:j, k-199:k, :) = images(:, :, :, subImageIndex);
        end
    end
end
