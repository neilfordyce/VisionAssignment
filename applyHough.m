function [ output_args ] = applyHough( I )
%UNTITLED Summary of this function goes here
    GRAY=rgb2gray(I);
    BW = edge(GRAY,'canny');
    [H,T,R] = hough(BW);
    
    %imshow(H,[],'XData',T,'YData',R, 'InitialMagnification','fit');
    %xlabel('\theta'), ylabel('\rho');
    %axis on, axis normal, hold on;
    
    P  = houghpeaks(H,10,'threshold',ceil(0.4*max(H(:))));
    %x = T(P(:,2)); y = R(P(:,1));
    
    %plot(x,y,'s','color','white');
    lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',50);
    %subplot(2,2,k);
    %imshow(I), hold on
    %max_len = 0;
    
    output_args = lines;
end
