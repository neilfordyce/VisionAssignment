function [ BW, H ] = applyHough( I, k )
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
    subplot(2,2,k);
    imshow(I), hold on
    max_len = 0;
    
    output_args = lines;
    
    for k = 1:length(lines)
        xy = [lines(k).point1; lines(k).point2];
        plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
        plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
        plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
        % Determine the endpoints of the longest line segment
        len = norm(lines(k).point1 - lines(k).point2);
        if ( len > max_len)
            max_len = len;
            xy_long = xy;
        end
    end
end
