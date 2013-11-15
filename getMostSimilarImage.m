function [ similarImageIndex ] = getMostSimilarImage(targetPatch, NBPatch, RGBHists, LBPHists, NBTHists)
%Iterates over all the source images to find the best match for the target
%patch
    %Finds the minimum Dis Square Distance
    
    %Compute LBP historgram of target patch
    histLBP = LBPHist(targetPatch);

    %Compute RGB histogram of target patch
    histRGB = RGBHist(targetPatch);
    
    %Compute RGB histogram of target patch
    histNBT = RGBHist(NBPatch);

    %Compute the first distance values for each histgram types.
    RGBDist = distance(histRGB, RGBHists(1, :));
    LBPDist = distance(histLBP, LBPHists(1, :));
    NBTDist = distance(histNBT, NBTHists(1, :));
    similarImageIndex = 1; 
    
    for j=2:size(RGBHists, 1), %size(RGBHists, 1) is actually the numOfBins defined in RGBHist.m
        currentRGBDist = distance(histRGB, RGBHists(j, :));
        currentLBPDist = distance(histLBP, LBPHists(j, :));
        currentNBTDist = distance(histNBT, NBTHists(j, :));
        
        if diffFunction(currentRGBDist, currentLBPDist, currentNBTDist) ...
                < diffFunction(RGBDist, LBPDist, NBTDist)
            RGBDist = currentRGBDist;
            LBPDist = currentLBPDist;
            NBTDist = currentNBTDist;
            similarImageIndex = j;
        end
    end
end


%%Determines the amount of difference in two images by comparing their
%%similarity via a linear combination of a number of difference metrics
function [ diff ] = diffFunction(RGBDist, LBPDist, NBTDist)
    diff = 0.6 * RGBDist + 0.3 * LBPDist + 0.1 * NBTDist;
end
