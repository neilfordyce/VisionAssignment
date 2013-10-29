function [ ] = storeResizedImages(SOURCE_PATH, OUTPUT_PATH)
%Read jpgs in SOURCE_PATH, resize, then write files OUTPUT_PATH
    filenames = dir(fullfile(SOURCE_PATH, '*.jpg'));
    
    for j = 1 : size(filenames, 1),
        I = imread(fullfile(SOURCE_PATH, filenames(j).name));
        I = resize(I);
        imwrite(I, fullfile(OUTPUT_PATH, filenames(j).name));
    end
end

