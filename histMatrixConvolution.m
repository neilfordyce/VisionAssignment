function [ convolutedMatrix ] = histMatrixConvolution( originalMatrix )
%convert the original matrix to a new weighted matrix

mask = [1 2 1; 2 4 2; 1 2 1];
convolutedMatrix = conv2(matrixBuild(originalMatrix), mask);

end

