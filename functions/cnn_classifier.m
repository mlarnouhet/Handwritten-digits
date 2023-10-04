function  layers = cnn_classifier()
layers = [
    imageInputLayer([20 20 1])
    convolution2dLayer([5 5],32, 'Padding', 2)
    batchNormalizationLayer()
    reluLayer()
    maxPooling2dLayer(3,'Stride',2)

    convolution2dLayer([5 5],64, 'Padding', 2)
    batchNormalizationLayer()
    reluLayer()
    maxPooling2dLayer(3,'Stride',2)

    convolution2dLayer([5 5],128, 'Padding', 2)
    batchNormalizationLayer()
    reluLayer()
    maxPooling2dLayer(3,'Stride',2)

    fullyConnectedLayer(10)
    %dropoutLayer(0.1)

    softmaxLayer()
    classificationLayer()
    ];
   
   