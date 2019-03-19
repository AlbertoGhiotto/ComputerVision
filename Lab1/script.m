clc, clear all, close all;

%Read the original image
imgOriginal = imread('boccadasse.jpg', 'jpg');
%imgOriginal = imread('flower.jpg', 'jpg');

%Convert to grayscale
imgGray = rgb2gray(imgOriginal);

%Want to show the images?
imgShow = true;

%Show
if(imgShow)
    %Print Original RGB image
    figure,imagesc(imgOriginal), title('Original image')
    figure,imagesc(imgGray),colormap gray, title('Grayscale image')
end

%% Translation

%Coefficients for the translation
tx = 100.4;
ty = 70.6;

imgTranslated = translate(imgGray, tx, ty, imgShow);


%% Rotation

%Angle for the rotation
theta = pi / 4;

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
