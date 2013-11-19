function [ O ] = readResizeC( classifiedPath, OUT_SIZE )
%Reads all the images from SOURCE_PATH, then scales them
    
    %Pre-allocation optomisation
    O = zeros(OUT_SIZE, OUT_SIZE, 3, size(classifiedPath, 1), 'uint8');
    
    %Read all images
    for j = 1 : size( classifiedPath, 1 )
        I = imread( classifiedPath(j, :) );
        I = resize( I, OUT_SIZE );
        O(:, :, :, j) = I;
    end
end