function I = pre_process_img(img,N,beta,alpha)
% img = imread("test.jpg");
%   N = 600;
%   beta = 20;
%   alpha = 0.8;

    img = rgb2gray(img);
    r = size(img,2)/size(img,1);
    img = 1 - imresize(double(img)/255,[N round(N*r)]);
    img = exp(beta*(img - alpha*max(img,[],'all')) );
%     SE = strel('disk',1);
%     img = imdilate(img,SE);

%     threshold = 0.5;
%     img(img > threshold) = 1;
%     img(img <= threshold) = 0;
    I = img;

    %imshow(I)