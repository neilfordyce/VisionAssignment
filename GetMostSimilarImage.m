function [ similarImageIndex ] = GetMostSimilarImage(targetPatch, imagesHists)
%Iterates over all the source images to find the best match for the target
%patch
    %Finds the minimum Chi Square Distance

    chi = 1;
    
    binNum = 1024;

    targetPatch = (targetPatch(:,:,1) * 256^2 + targetPatch(:,:,2) * 256 + targetPatch(:,:,3));
    histPatch = hist(targetPatch(:), binNum)/numel(targetPatch);
        
    for j=1:size(imagesHists, 1)
        currentChi = ChiDistance(histPatch, imagesHists(j));
        if currentChi < chi
            chi = currentChi;
            similarImageIndex = j;       
        end
    end

end

