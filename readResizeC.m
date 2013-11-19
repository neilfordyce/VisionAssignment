function [ O ] = readResizeC(CLASSIFIED_PATH_STR, OUT_SIZE)
%Reads all the images from SOURCE_PATH, then scales them
    
    %Pre-allocation optomisation
    O = zeros(OUT_SIZE, OUT_SIZE, 3, size(CLASSIFIED_PATH_STR)/45, 'uint8');
    
    %Read all images
    for j = 1 : 45 : size(CLASSIFIED_PATH_STR)
        I = imread(CLASSIFIED_PATH_STR(j:44+j));
        I = resize(I, OUT_SIZE);
        O(:, :, :, j) = I;
    end
end