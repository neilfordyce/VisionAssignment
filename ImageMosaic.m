function [ O ] = ImageMosaic( I, MAN_PATH, NAT_PATH, PATCH_SIZE )
%Makes a new composite image O, based on target image I

%Read and resize images
manmadeImages = readResize(MAN_PATH, PATCH_SIZE); 
naturalImages = readResize(NAT_PATH, PATCH_SIZE);
images = cat(4, manmadeImages, naturalImages);

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
    for j=PATCH_SIZE:PATCH_SIZE:size(I, 1)
        for k=PATCH_SIZE:PATCH_SIZE:size(I, 2)
            targetPatch = I(j-(PATCH_SIZE-1):j, k-(PATCH_SIZE-1):k, :);
            subImageIndex = GetMostSimilarImage(targetPatch, imageHists, lbpHists);
            
            %replace part of the output image with the most similar source
            %image
            O(j-(PATCH_SIZE-1):j, k-(PATCH_SIZE-1):k, :) = images(:, :, :, subImageIndex);
        end
    end
end
