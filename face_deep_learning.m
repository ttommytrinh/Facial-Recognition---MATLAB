function [] = face_deep_learning()
%FACE_DEEP_LEARNING run this for machine learning of facal recognition
g = alexnet;
layers = g.Layers;
layers(23) = fullyConnectedLayer(2);
layers(25) = classificationLayer;
allImages = imageDatastore('database','IncludeSubfolders',true, 'LabelSource','foldernames');
opts = trainingOptions('sgdm','InitialLearnRate',0.001,'MaxEpochs',20,'MiniBatchSize',64);
FaceMatching = trainNetwork(allImages,layers,opts);
save FaceMatching;
end

