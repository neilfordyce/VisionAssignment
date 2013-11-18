function [ meanArea, varArea] = connectedCompStats( I )
%Computes the mean area of regions of connected components from edge
%detection output
edges = edge(rgb2gray(I), 'canny');

stats = regionprops(edges, 'Area');

varArea = var([stats(:).Area]);
meanArea = mean([stats(:).Area]);

%Should we divide the area by the total number of pixels to normalise

end

