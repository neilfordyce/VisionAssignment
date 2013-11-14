function [ out_hist ] = RGBHist( I )
%Makes a histogram of an RGB Image
    numOfBins = 256;
    channelLevels = 256;

    %Flatten the RGB channels into a colour cube representation
    I = double(I);
    I = (I(:,:,1) * (channelLevels^2) + I(:,:,2) * channelLevels + I(:,:,3));
    out_hist = hist(I(:), numOfBins)/numel(I);
end

