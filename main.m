addpath("C:\Users\mlarn\Desktop\Perso\cours\TMS016\Project\Part_3\data")
addpath("C:\Users\mlarn\Desktop\Perso\cours\TMS016\Project\Part_3\functions")

% [imgs, labels] = digitTrain4DArrayData; %load dataset (needs the deep learning toolbox)
% 
% % N = 3210; % We have 5000 images so any number between 1 and 5000 works.
% % img = imgs(:,:,:,N);
% % imagesc(img), axis image, colormap gray
% 
% % We use 80% of the data for the training set and 20% for the validation set
% imgs_train = imgs(:,:,:,1:3000);
% labels_train = labels(1:3000);
% 
% imgs_val = imgs(:,:,:,3001:4000);
% labels_val = labels(3001:4000);
% 
% imgs_test = imgs(:,:,:,4001:5000);
% labels_test = labels(4001:5000);

[imgs labels] = readMNIST("train-images.idx3-ubyte", "train-labels.idx1-ubyte", 60000, 0);
imgs_train = imgs(:,:,1:50000);
imgs_train = reshape(imgs_train,[20 20 1 50000]);
imgs_train = imgs_train ~= 0;
labels_train = categorical(labels(1:50000));

imgs_val = imgs(:,:,50001:60000);
imgs_val = reshape(imgs_val,[20 20 1 10000]);
imgs_val = imgs_val ~= 0;
labels_val = categorical(labels(50001:60000));

[imgs_test labels_test] = readMNIST("t10k-images.idx3-ubyte", "t10k-labels.idx1-ubyte", 10000, 0);
imgs_test = reshape(imgs_test,[20 20 1 10000]);
imgs_test = imgs_test ~= 0;
labels_test = categorical(labels_test);

layers = cnn_classifier();
options = trainingOptions('sgdm',InitialLearnRate = 0.001, MaxEpochs = 15, ValidationData = {imgs_val,labels_val}, ValidationFrequency = 300, Plots="training-progress", ValidationPatience = 3);
net = trainNetwork(imgs_train, labels_train, layers, options);
predicted_labels = [];
sum = 0;

for k = 1:max(size(imgs_test))
    predicted_labels = [predicted_labels categorical(net.classify(imgs_test(:,:,:,k)))];
    if categorical(net.classify(imgs_test(:,:,:,k))) == labels_test(k)
        sum = sum + 1;
    end
end

accuracy = sum/max(size(imgs_test))