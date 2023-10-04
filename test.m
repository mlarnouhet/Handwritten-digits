% img = rgb2gray(imread("HW-image_9.png"));
% img = 1 - imresize(double(img)/255,[20 20]);
% threshold = 0.1;
% img(img > threshold) = 1;
% img(img <= threshold) = 0;
% imshow(img)
% net.classify(img)

addpath("C:\Users\mlarn\Desktop\Perso\cours\TMS016\Project\Part_3_old\functions")
addpath("C:\Users\mlarn\Desktop\Perso\cours\TMS016\Project\Part_3\functions")

%pre-processing and thresholding
img = imread("20230513_003035.jpg");
img = pre_process_img(img,600,10,0.8);
[Gmag,~] = imgradient(img);
%img = Gmag;
threshold = 0.9;
img(Gmag > threshold) = 1;
img(Gmag <= threshold) = 0;
imshow(img)


% img = 1 - double(rgb2gray(imread("test_numbers_3.png")))/255;
% img(img ~= 0) = 1;
% 
seg = extract(img);

%We get rid of the smaller clusters
digits = {};

for k = 1:length(seg)
    if max(size(seg{k})) > 100
        digits{end+1} = seg{k};
    end
end

%We add padding and classify
classification = zeros(1,length(digits));
for k = 1:length(digits)

loc = digits{k};

mi = min(loc,[],1);
loc(:,1) = loc(:,1) - mi(1)+1;
loc(:,2) = loc(:,2) - mi(2)+1;
ma = max(loc,[],1);

img_digit = zeros(1,ma(1)*ma(2));


img_digit(sub2ind(max(loc,[],1),loc(:,1), loc(:,2))) = 1;

%I = padarray(reshape(img_digit,ma),[5 5],0,'both');
I = reshape(img_digit,ma);

img = imresize(double(I),[20 20]);
threshold = 0.1;
img(img > threshold) = 1;
img(img <= threshold) = 0;
imshow(img)
classification(k) = str2double(string(net.classify(img)));
end

%imshow(I)







