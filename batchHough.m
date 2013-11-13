function [ ] = batchHough( TEST_IMAGE_PATH )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    k = 1;

    filenames = dir(fullfile(TEST_IMAGE_PATH, '*.jpg'));
    for j = 1 : size(filenames, 1),
        try
        I = imread(fullfile(TEST_IMAGE_PATH, filenames(j).name));
        applyHough(I, k);
        
        k = k+1;
        if k == 5,
            k = 1;
        end
        
        catch err
            'caught err'
        end
        
        
    end

end

