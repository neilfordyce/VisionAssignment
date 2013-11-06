function [ weightedMatrix ] = weightMatrix( originalMatrix )
%convert the original matrix to a new weighted matrix

mask = [1 2 1; 2 4 2; 1 2 1];
weightedMatrix = conv2(originalMatrix, mask);

end

