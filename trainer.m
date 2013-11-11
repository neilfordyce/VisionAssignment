function [ mdl ] = trainer()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    imageHists = [];

    filenames = dir(fullfile('Images/manmade_training', '*.jpg'));
    for j = 1 : size(filenames, 1),
        I = imread(fullfile('Images/manmade_training', filenames(j).name));
        top = I(1:size(I,1)/2, :,:);
        bottom = I(size(I,1)/2 + 1:end, :,:);
        imageHists = [imageHists; rgbHist(top), rgbHist(bottom)];
    end

    filenames = dir(fullfile('Images/natural_training', '*.jpg'));
    for j = 1 : size(filenames, 1),
        I = imread(fullfile('Images/natural_training', filenames(j).name));
        top = I(1:size(I,1)/2, :,:);
        bottom = I(size(I,1)/2 + 1:end, :,:);
        imageHists = [imageHists; rgbHist(top), rgbHist(bottom)];
    end

    Y = [ones(500, 1); ones(500, 1) * -1];

    mdl = ClassificationKNN.fit(imageHists,Y,'NumNeighbors',3);

end

