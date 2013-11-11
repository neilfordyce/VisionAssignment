function [ O ] = readResize(SOURCE_PATH, OUT_SIZE)
%Reads all the images from SOURCE_PATH, then scales them
    %The last index of the returned matrix represents the image number
    %e.g. O(:, :, :, 1) is the first image in the 4D matrix
    filenames = dir(fullfile(SOURCE_PATH, '*.jpg'));
    
    %Pre-allocation optomisation
    O = zeros(OUT_SIZE, OUT_SIZE, 3, size(filenames, 1), 'uint8');
    
    %Read all images
    for j = 1 : size(filenames, 1),
        I = imread(fullfile(SOURCE_PATH, filenames(j).name));
        I = resize(I, OUT_SIZE);
        O(:, :, :, j) = I;
    end

end

