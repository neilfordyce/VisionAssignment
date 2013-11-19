function [ O ] = imageMosaicC( I, classifiedPath, PATCH_SIZE )

    images = readResizeC( classifiedPath, PATCH_SIZE );

    O = I;

    RGBHists = [];
    LBPHists = [];
    
    for j = 1:size(images, 4)
        image = images(:,:,:,j);
        RGBHists = [RGBHists; RGBHist(image)];
        LBPHists = [LBPHists; LBPHist(image)];
        
        for j=PATCH_SIZE:PATCH_SIZE:size(I, 1)-2*PATCH_SIZE
            for k=PATCH_SIZE:PATCH_SIZE:size(I, 2)-2*PATCH_SIZE
                targetPatch = I( j+1:j+PATCH_SIZE, k+1:k+PATCH_SIZE, : );
                NBPatch = I(j-(PATCH_SIZE-1):j+2*PATCH_SIZE, k-(PATCH_SIZE-1):k+2*PATCH_SIZE, :);
                subImageIndex = getMostSimilarImage(targetPatch, NBPatch, RGBHists, LBPHists);
            
                %replace part of the output image with the most similar source
                %image
                O(j+1:j+PATCH_SIZE, k+1:k+PATCH_SIZE, :) = images(:, :, :, subImageIndex);
            end
        end
    end
end