function [ out_hist ] = RGBHist( I, numOfBins, colorSpace )
%Makes a histogram of an RGB Image
    
    if ~exist('numOfBins', 'var') %If no numOfBins specified
        numOfBins = 256;  %Default to 256
    end
    channelLevels = 256;
    
    if exist('colorSpace', 'var') == 1
        if colorSpace == 1
            I = RGB2Lab(I);
        elseif colorSpace == -1
            I = rgb2hsv(I);
        else
            err;
        end
    end

    %Flatten the RGB channels into a colour cube representation
    I = double(I);
    %out_hist = [imhist(I(:,:,1)); imhist(I(:,:,2)); imhist(I(:,:,3))];
    %out_hist = out_hist'/numel(I(:,:,1));
    I = (I(:,:,1) * (channelLevels^2) + I(:,:,2) * channelLevels + I(:,:,3));
    out_hist = hist(I(:), numOfBins)/numel(I);
end

