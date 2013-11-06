function [ similarImageIndex ] = GetMostSimilarImage(targetPatch, imagesHists, lbpHists)
%Iterates over all the source images to find the best match for the target
%patch
    %Finds the minimum Chi Square Distance
    
    %Compute LBP historgram of target patch
    histLbp = LBPHist(targetPatch);

    %Compute RGB histogram of target patch
    histPatch = rgbHist(targetPatch);

    chi = ChiDistance(histPatch, imagesHists(1, :));
    lbpChi = ChiDistance(histLbp, lbpHists(1, :));    
    similarImageIndex = 1; 
    
    for j=2:size(imagesHists, 1),
        currentChi = ChiDistance(histPatch, imagesHists(j, :));
        currentLbpChi = ChiDistance(histLbp, lbpHists(j, :));        
        
        if 0.6 * currentChi + 1 * currentLbpChi < (0.6 * chi + 1 * lbpChi)
            chi = currentChi;
            lbpChi = currentLbpChi;
            similarImageIndex = j;       
        end
    end
end

