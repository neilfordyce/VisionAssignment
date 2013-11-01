function [ similarImage ] = GetMostSimilarImage(targetPatch, images)
%Iterates over all the source images to find the best match for the target
%patch
    %Finds the minimum Chi Square Distance

    chi = 1;

    for j=1:size(images, 4)
        currentChi = ChiDistance(targetPatch, images(:,:,:,j));
        if currentChi < chi
            chi = currentChi;
            similarImage = images(:,:,:,j);       
        end
    end

end

