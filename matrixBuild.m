function [ outMatrix ] = matrixBuild( I, PATCH_SIZE )
%Summary of this function goes here

%blow is an attempt of building a 3d matrix which will be convoluted
for j=PATCH_SIZE:PATCH_SIZE:size(I, 1)
       for k=PATCH_SIZE:PATCH_SIZE:size(I, 2)
            targetPatch = I(j-(PATCH_SIZE-1):j, k-(PATCH_SIZE-1):k, :);
            outMatrix(:, j/PATCH_SIZE, k/PATCH_SIZE) = rgbHist(targetPatch);
       end
end

end

