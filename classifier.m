function [ classifiedPath ] = classifier( mdl, IMAGE_PATH, TARGET_IMAGE_PATH)
%Classify the given images. IMAGE_PATH is the path of the given images, and
%TARGET_IMAGE_PATH is the path of Monalisa.

    filenames = dir(fullfile(IMAGE_PATH, '*.jpg'));
    MANImagePath = [];
    NATImagePath = [];
    
    for j = 1 : size(filenames, 1),
        if IMGPredict(mdl, fullfile(IMAGE_PATH, filenames(j).name)) == 1,
            NATImagePath = [NATImagePath; fullfile(IMAGE_PATH, filenames(j).name)];
        else
            MANImagePath = [MANImagePath; fullfile(IMAGE_PATH, filenames(j).name)];
        end
    end
    
    if IMGPredict(mdl, TARGET_IMAGE_PATH) == 1,
        classifiedPath = NATImagePath;
    else
        classifiedPath = MANImagePath;
    end

end


function [ class ] = IMGPredict(mdl, image)
    I = imread(image);
    featureSet = extractFeatureSet(I);
    class = predict(mdl, featureSet);
end

