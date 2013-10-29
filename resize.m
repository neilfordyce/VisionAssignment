function [ O ] = resize( I )
%Resizes image by sub/super sampling and cropping to make it 200 x 200
%pixels
    OUT_SIZE = 200;

    %Decide what dimension to resize
    %Take the minimum dimension
    %And then crop the rest away
    if size(I, 1) < size(I, 2)
        O = imresize(I, [OUT_SIZE NaN]);
        center = size(O, 2) / 2;
        crop_start = uint8(1 + center - OUT_SIZE/2);
        crop_end = uint8(center + OUT_SIZE/2);       
        O = O(:, crop_start: crop_end, :);
    else
        O = imresize(I, [NaN OUT_SIZE]);
        center = size(O, 1) / 2;
        crop_start = uint8(1 + center - OUT_SIZE/2);
        crop_end = uint8(center + OUT_SIZE/2);    
        O = O(crop_start: crop_end, :, :);
    end
end
