function [ O ] = readImages(SOURCE_PATH)
%Reads all the images from SOURCE_PATH
    %The last index of the returned matrix represents the image number
    %e.g. O(:, :, :, 1) is the first image in the 4D matrix
    filenames = dir(fullfile(SOURCE_PATH, '*.jpg'));
    
    %Pre-allocation optomisation
    IMAGE_SIZE = 20;
    O = zeros(IMAGE_SIZE, IMAGE_SIZE, 3, size(filenames, 1), 'uint8');
    
    %Read all images
    for j = 1 : size(filenames, 1),
        I = imread(fullfile(SOURCE_PATH, filenames(j).name));
        O(:, :, :, j) = I;
    end

end

