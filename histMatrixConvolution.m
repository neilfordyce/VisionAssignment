function [ convolutedMatrix ] = histMatrixConvolution( Matrix )
%convert the original matrix to a new weighted matrix

%below is a 3d mask
%mask(:,:,1) = [1 2 1; 2 4 2; 1 2 1];
%mask(:,:,2) = [2 4 2; 4 16 4; 2 4 2];
%mask(:,:,3) = [1 2 1; 2 4 2; 1 2 1];

%below is a 2d mask
mask = [1 2 1; 2 4 2; 1 2 1];
convolutedMatrix = conv2(matrixBuild(Matrix, 20), mask);

end

