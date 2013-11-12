function [ featureSet ] = extractFeatureSet( I )
%Extracts various features and packs them in a vector

    top = I(1:uint16(size(I,1)/2), :,:);
    bottom = I(uint16(size(I,1)/2) + 1:end, :,:);

    featureSet = [rgbHist(top), rgbHist(bottom)];
end

