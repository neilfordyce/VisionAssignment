function [ out_hist ] = RGBMean( I, colorSpace )
%Mean of the individual colour components
    if exist('colorSpace', 'var') == 1
        if colorSpace == 1
            I = RGB2Lab(I);
        elseif colorSpace == -1
            I = rgb2hsv(I);
        else
            err;
        end
    end
    
    out_hist = [mean(mean(I(:,:,1))) mean(mean(I(:,:,2))) mean(mean(I(:,:,3)))];
end

