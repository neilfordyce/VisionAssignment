function [ mdl, trainingSet, Y ] = trainer()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    %%Make up the training set matrix
    manmadeTraining = buildTrainingSet('Images/manmade_training');
    naturalTraining = buildTrainingSet('Images/natural_training');
    trainingSet = [manmadeTraining; naturalTraining];
    
    %Make up the vector which specifies the class of each row in the
    %training set
    Y = [ones(size(manmadeTraining, 1), 1); ones(size(naturalTraining, 1), 1) * -1];

    %Make the model from the training set
    mdl = ClassificationKNN.fit(trainingSet, Y, 'NumNeighbors', 7);
end

%%Builds the training set matrix.  Every row is a feature set for a
%%particular training example.  Every column is a particular feature.
function [trainingSet] = buildTrainingSet(IMAGE_PATH)
    CROP = 10; % Amount of pixels to remove from border.  
               % Prevents lines caused by artifacts and embossing
    
    filenames = dir(fullfile(IMAGE_PATH, '*.jpg'));
    
    %Pre-allocate trainingSet for speed
    featureVectorSize = size(extractFeatureSet(zeros(10,10,3)), 2);
    trainingSet = zeros(size(filenames, 1), featureVectorSize);
    
    for j = 1 : size(filenames, 1),
        j
        I = imread(fullfile(IMAGE_PATH, filenames(j).name));
        I = I(CROP:end - CROP, CROP:end - CROP, :);
        featureSet = extractFeatureSet(I);
        
        trainingSet(j, :) = featureSet;
    end
end
