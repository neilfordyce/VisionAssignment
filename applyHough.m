function [ lines ] = applyHough( I )
%Finds lines using Hough transform
    GRAY=rgb2gray(I);
    BW = edge(GRAY,'canny');
    [H,T,R] = hough(BW);
    
    P  = houghpeaks(H,10,'threshold',ceil(0.4*max(H(:))));
    lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',50);    
end
