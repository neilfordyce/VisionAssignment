function [ mdl, trainingSet, Y ] = trainer()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    %%Make up the training set matrix
    trainingSet = buildTrainingSet('Images/manmade_training');
    trainingSet = [trainingSet; buildTrainingSet('Images/natural_training')];
    
    %Make up the vector which specifies the class of each row in the
    %training set
    Y = [ones(500, 1); ones(500, 1) * -1];
    
    %Make the model from the training set
    mdl = ClassificationKNN.fit(trainingSet, Y, 'NumNeighbors', 7);
end

%%Builds the training set matrix.  Every row is a feature set for a
%%particular training example.  Every column is a particular feature.
function [trainingSet] = buildTrainingSet(IMAGE_PATH)
    %CROP = 10; % Amount of pixels to remove from border.  
               % Prevents lines caused by artifacts and embossing

    trainingSet = [];
    
    filenames = dir(fullfile(IMAGE_PATH, '*.jpg'));
    for j = 1 : size(filenames, 1),
        j
        I = imread(fullfile(IMAGE_PATH, filenames(j).name));
        %I = I(CROP:end - CROP, CROP:end - CROP, :);
        featureSet = extractFeatureSet(I);
        
        trainingSet = [trainingSet; featureSet];
    end
end
