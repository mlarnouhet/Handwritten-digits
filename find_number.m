% img = 1 - double(rgb2gray(imread("test_numbers.png")))/255;
% img(img ~= 0) = 1;
% 
% seg = extract(img);

features = [];

% We start by computing the features [height width mean label] that we use
% to find the numbers

for k = 1:length(digits)
    digit = digits{k};

        ma = max(digit,[],1);
        mi = min(digit,[],1);
        m = mean(digit,1);
        features = [features; ma(1)-mi(1) ma(2)-mi(2) m classification(k)];

end

alpha = 0.2;
index = zeros(1,size(features,1));
k = 1;

% We go over each digit add associate it with other digits if they are
% close enough both horizontally and vertically (the alpha parameter is
% used to tune the tolerance for vertical closeness

for i = 1:size(features,1)
    for j = 1:size(features,1)
        if i ~=j
            height = features(i,1);
            if (sqrt( (features(i,3) - features(j,3))^2 + (features(i,4) - features(j,4))^2) < 2*height) && ((features(i,3) - features(j,3)) < alpha*height)
                if index(i) == 0
                    index(i) = k;
                    index(j) = k;
                    k = k+1;
                else
                    index(j) = index(i);
                end
            end
        end
    end
end

% We sort the digits within each number using the x axis
numbers = {};

for k = 1:max(index)
    [sorted_list,order] = sort(features(index==k,4));
    digits_list = features(index==k,5);
    numbers{end+1} = digits_list(order);
end

% We add the digits to the numbers array

digits = features(index==0,5);
for k = 1:length(digits)
    numbers{end+1} = digits(k);
end

% img = 1 - double(rgb2gray(imread("test_numbers.png")))/255;
% loc = round(features(:,3:4));

% for k = 1:max(size(loc))
%     img(loc(k,1)-3:loc(k,1)+3,loc(k,2)-3:loc(k,2)+3) = 0.5;
% end
% 
% %img(sub2ind(size(img),loc(:,1), loc(:,2))) = 0.5;
% 
% imshow(1-img)

