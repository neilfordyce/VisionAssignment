function [ O ] = ImageMosaic( I, images )
%Makes a new composite image O, based on target image I
%   Detailed explanation goes here

IMAGE_SIZE = 20;

O = I;

    %Compute all the source histograms now
    imageHists = [];
    lbpHists = [];
    
    for j=1:size(images, 4)
        image = images(:,:,:,j);
        imageHists = [imageHists; rgbHist(image)];
        lbpHists = [lbpHists; LBPHist(image)];
    end

    'done computing source histograms'

    %Then find the most similar image for each patch
    for j=IMAGE_SIZE:IMAGE_SIZE:size(I, 1)
        for k=IMAGE_SIZE:IMAGE_SIZE:size(I, 2)
            targetPatch = I(j-(IMAGE_SIZE-1):j, k-(IMAGE_SIZE-1):k, :);
            subImageIndex = GetMostSimilarImage(targetPatch, imageHists, lbpHists);
            
            subplot(2, 3, 1)
            imshow(uint8(images(:, :, :, subImageIndex)))
            subplot(2, 3, 2)
            imshow(uint8(targetPatch))
            subplot(2, 3, 3)
            title('source')
            plot(imageHists(subImageIndex, :))
            
            subplot(2, 3, 4)
            title('target')
            plot(rgbHist(targetPatch))
            
            subplot(2, 3, 5)
            
            
            subplot(2, 3, 6)
            
            %replace part of the output image with the most similar source
            %image
            O(j-(IMAGE_SIZE-1):j, k-(IMAGE_SIZE-1):k, :) = images(:, :, :, subImageIndex);
        end
    end
end
