clc, clear all, close all;

%Read the original image
imgOriginal = imread('boccadasse.jpg', 'jpg');
% imgOriginal = imread('flower.jpg', 'jpg');
%In order to manipulate the image "flower.jpg" it is sufficient to comment
%the line reading the "boccadasse.jpg" image and decomment the next one.

%Convert to grayscale
imgGray = rgb2gray(imgOriginal);

%Set the following variable to "true" in order to display all the images
imgShow = true;

%Display the images
if(imgShow)
    %Print Original RGB image
    figure,imagesc(imgOriginal), title('Original image')
    %Print grayscale image
    figure,imagesc(imgGray),colormap gray, title('Grayscale image')
end

%% Translation

%Coefficients for the translation
tx = 100.4;
ty = 70.6;

imgTranslated = translate(imgGray, tx, ty, imgShow);


%% Rotation

%Angle for the rotation
theta = pi;

imgRotated = rotate(imgGray, theta, imgShow);


%% Shear (vertical)

%Shearing coefficient
sv = 0.7;

imgVertSheared = vertShear(imgGray, sv, imgShow);


%% Shear (horizontal)

%Shearing coefficient
sh = 0.7;

imgHorizSheared = horizShear(imgGray, sh, imgShow);


%% Colored rotation

imgRotatedColored = coloredRotation(imgOriginal, theta, imgShow);

%% Rotation and Translation in sequence

imgRotTrans = rotoTransl(imgGray, theta, tx, ty, imgShow);
