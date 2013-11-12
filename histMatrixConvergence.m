function [ convergentedMatrix ] = histMatrixConvergence( matrix )
%Summary of this function goes here

num = 1;

difference = histMatrixConvolution(matrix) - matrix;
variance = var(difference(:));

while(variance > num)
    matrix = histMatrixConvolution(matrix);
    variance = var(difference(:));
end

convergentedMatrix = matrix;

end

