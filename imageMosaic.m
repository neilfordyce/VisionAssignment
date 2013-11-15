function [ O ] = imageMosaic( I, MAN_PATH, NAT_PATH, PATCH_SIZE )
%Makes a new composite image O, based on target image I

%Read and resize images
manmadeImages = readResize(MAN_PATH, PATCH_SIZE); 
naturalImages = readResize(NAT_PATH, PATCH_SIZE);
%Concatenate the manmadeImages and naturalImages into a 4 dimensional array
%calls images
images = cat(4, manmadeImages, naturalImages);

O = I;

    %Compute all the source histograms now
    RGBHists = [];
    LBPHists = [];
    
    for j = 1:size(images, 4) %size(images, 4) is actually the total number of all images
        image = images(:,:,:,j);
        RGBHists = [RGBHists; RGBHist(image)]; %adds a new element into the histogram each time it iterates
        LBPHists = [LBPHists; LBPHist(image)];
    end

    'done computing source histograms'

    %Then find the most similar image for each patch
    for j=PATCH_SIZE:PATCH_SIZE:size(I, 1)-2*PATCH_SIZE
        for k=PATCH_SIZE:PATCH_SIZE:size(I, 2)-2*PATCH_SIZE
            targetPatch = I(j+1:j+PATCH_SIZE, k+1:k+PATCH_SIZE, :);
            NBPatch = I(j-(PATCH_SIZE-1):j+2*PATCH_SIZE, k-(PATCH_SIZE-1):k+2*PATCH_SIZE, :);
            subImageIndex = getMostSimilarImage(targetPatch, NBPatch, RGBHists, LBPHists);
            
            %replace part of the output image with the most similar source
            %image
            O(j+1:j+PATCH_SIZE, k+1:k+PATCH_SIZE, :) = images(:, :, :, subImageIndex);
        end
    end
end