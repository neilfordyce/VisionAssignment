function [ featureSet ] = extractFeatureSet( I )
%Extracts various features and packs them in a vector

    top = I(1:uint16(size(I,1)/2), :,:);
    bottom = I(uint16(size(I,1)/2) + 1:end, :,:);
    MAX_LINES = 5;  %Max number of lines to classify
    lineCount = 0;
    
    try
        lines = applyHough(I);
        lineCount = size(lines, 2);
        
        %Find the length of all the lines
        for j=1:size(lines, 2),  %Number of lines found
            length = pdist([lines(j).point1; lines(j).point2], 'euclidean');
            lines(j).length = length;
        end
    catch err
       %Exception here means that no lines were found 
       lines = [];
    end
    
    if size(lines, 2) < MAX_LINES,
        %Create line lengths with invalid values to take the extra places
        %Missing line is represented to the classifier as -1
        dummyLines = repmat(struct('length', -1, ...
                                   'rho', NaN, ...
                                   'theta', NaN, ...
                                   'point1', NaN, ...
                                   'point2', NaN), 1, MAX_LINES - size(lines, 2));       
        lines = cat(2, lines, dummyLines);
    end
    
    %Sort the lines by length then pick top 5
    sortedLines = [lines(:).length];
    sortedLines = sort(sortedLines, 'descend');
    sortedLines = sortedLines(1:5);     
    
    featureSet = [RGBHist(top), RGBHist(bottom), sortedLines, lineCount];
end

