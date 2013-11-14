function [ outMatrix ] = matrixBuild( I )
%Summary of this function goes here
for j=PATCH_SIZE:PATCH_SIZE:size(I, 1)
       for k=PATCH_SIZE:PATCH_SIZE:size(I, 2)
            targetPatch = I(j-(PATCH_SIZE-1):j, k-(PATCH_SIZE-1):k, :);
            outMatrix(j,k) = rgbHist(targetPatch);
       end
end

end

