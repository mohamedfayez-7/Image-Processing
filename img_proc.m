imagefiles = dir('Training set\*.jpg');      
nfiles = length(imagefiles);                                                % Number of files found
features = [];
for i = 1 : nfiles                                                          % for loop to read all training images 
    training_image = imread(['Training set/' imagefiles(i).name]);           
    allfeatures=fft2(double(training_image));				    % to do fast fourier transform to Training images
    allfeatures=abs(allfeatures(:));
    allfeatures=sort(allfeatures,'descend');
    fivefeatures=allfeatures(1:5);
    features=[features fivefeatures];                           % array that holds 5 features for all Training images
end

testing_image=imread('Testing set/11.png');               % read Testing image
testing_image_red = testing_image(:,:,1) ;                  % geting the red channel


testing_image_red =  medfilt2(testing_image_red);       % doing the median filter to reduce the noise in image

allfeatures=fft2(double(testing_image_red));            % to do fast fourier transform to test image
allfeatures=abs(allfeatures(:));
allfeatures=sort(allfeatures,'descend');
imagefeatures=allfeatures(1:5);

nearest = [];               %array that holds all distances  from the test image to all other images

for i=1:15                  % calculating the distance 
nearest(i)=sqrt((imagefeatures(1) - features(1,i))^2+(imagefeatures(2) - features(2,i))^2+(imagefeatures(3) - features(3,i))^2 + (imagefeatures(4) - features(4,i))^2 + (imagefeatures(5)-features(5,i))^2);
end

[distance,index] = min(nearest);  % geting the nearest distance and it's index

if(index == 1)||(index == 2)||(index == 3)			%to classify the image according to its class
    disp('Image belongs to class 1');
elseif(index == 4)||(index == 5)||(index == 6)
    disp('Image belongs to class 2');
elseif(index == 7)||(index == 8)||(index == 9)
    disp('Image belongs to class 3');
elseif(index == 10)||(index == 11)||(index == 12)
    disp('Image belongs to class 4');
elseif(index == 13)||(index == 14)||(index == 15)
    disp('Image belongs to class 5');
end
