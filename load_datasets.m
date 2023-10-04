
[imgs labels] = readMNIST("train-images.idx3-ubyte", "train-labels.idx1-ubyte", 60000, 0);
imgs_train = imgs(:,:,1:50000);
labels_train = labels(1:50000);
imgs_val = imgs(:,:,50001:60000);
labels_train = labels(50001:60000)
[imgs_test labels_test] = readMNIST("t10k-images.idx3-ubyte", "t10k-labels.idx1-ubyte", 10000, 0);