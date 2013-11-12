function [ output_args ] = tester( mdl, TEST_IMAGE_PATH, TARGET_OUTPUT )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    correctClassCount = 0;
    incorrectClassCount = 0;

    filenames = dir(fullfile(TEST_IMAGE_PATH, '*.jpg'));
    for j = 1 : size(filenames, 1),
        I = imread(fullfile(TEST_IMAGE_PATH, filenames(j).name));
        featureSet = extractFeatureSet(I);
        
        class = predict(mdl, featureSet);
        
        
        if class == TARGET_OUTPUT,
            correctClassCount = correctClassCount + 1;
        else
            'incorrectly classified:'
            imshow(I)
            j
            filenames(j).name
            incorrectClassCount = incorrectClassCount + 1; 
        end
    end
    
    'correctly classified examples:'
    correctClassCount
    
    'incorrectly classified examples:'
    incorrectClassCount

end

