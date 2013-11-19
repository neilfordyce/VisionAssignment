function [ meanArea, varArea, meanPerim, varPerim] = connectedCompStats( I )
%Computes the mean area of regions of connected components from edge
%detection output
edges = edge(rgb2gray(I), 'canny');

stats = regionprops(edges, 'Area', 'Perimeter');

varArea = var([stats(:).Area]);
meanArea = mean([stats(:).Area]);
varPerim = var([stats(:).Perimeter]);
meanPerim = mean([stats(:).Perimeter]);

end

