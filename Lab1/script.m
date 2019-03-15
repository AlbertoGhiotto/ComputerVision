clc, clear all, close all;

%Read the original image
imgOriginal = imread('boccadasse.jpg', 'jpg');
%imgOriginal = imread('flower.jpg', 'jpg');

%Convert to grayscale
imgGray = rgb2gray(imgOriginal);

%Show
figure,imagesc(imgGray),colormap gray, title('Original image')
%Dimensions of the image
[rr,cc]=size(imgGray);


%% Translation

%Coefficients for the translation
tx = 100.4;
ty = 70.6;

imgTranslated = translate(imgGray, tx, ty);

figure,imagesc(imgTranslated),colormap gray, title('Backward translation')

%% Rotation

%Angle for the rotation
theta = 3 * pi / 4;

imgRotated = rotate(imgGray, theta);

figure,imagesc(imgRotated),colormap gray, title('Backward rotation')

%% Colored rotation

% redChannel = imgOriginal(:, :, 1);
% greenChannel = imgOriginal(:, :, 2);
% blueChannel = imgOriginal(:, :, 3);
%  
% redInterpolated = griddata(X,Y,double(redChannel),Xn,Yn,'linear');
% greenInterpolated = griddata(X,Y,double(greenChannel),Xn,Yn,'linear');
% blueInterpolated = griddata(X,Y,double(blueChannel),Xn,Yn,'linear');
% 
% rotatedImage = cat(3, redInterpolated, greenInterpolated, blueInterpolated);
% 
% %figure,imagesc(blueInterpolated),colormap blue, title('Colored rotation')
% figure,imagesc(rotatedImage),title('Colored rotation')


%% Shear (vertical)

%Shearing coefficient
sv = 0.7;

imgVertSheared = vertShear(imgGray, sv);

figure,imagesc(imgVertSheared),colormap gray, title('Shear (vertical)')

%% Shear (horizontal)

%Shearing coefficient
sh = 0.7;

imgHorizSheared = horizShear(imgGray, sh);

figure,imagesc(imgHorizSheared),colormap gray, title('Shear (horizontal)')