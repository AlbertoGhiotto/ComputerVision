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

[X, Y] = meshgrid(1 : cc, 1 : rr);
%Inverse of the transformation
Xn = X - tx;
Yn = Y - ty;

figure,imagesc(griddata(X,Y,double(imgGray),Xn,Yn,'linear')),colormap gray, title('Backward translation')

%% Rotation

%Indeces of the centre of the image
midX = (cc + 1) / 2;
midY = (rr + 1) / 2;
%Angle for the rotation
theta = 3 * pi / 4;

[X, Y] = meshgrid(1 : cc, 1 : rr);
%Inverse of the transformation
Xc = (X - midX) * cos(theta) + (Y - midY) * sin(theta);
Yc = -(X - midX) * sin(theta) + (Y - midY) * cos(theta);
%Re-center the image 
Xn = Xc + midX;
Yn = Yc + midY;

figure,imagesc(griddata(X,Y,double(imgGray),Xn,Yn,'linear')),colormap gray, title('Backward rotation')

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

[X, Y] = meshgrid(1 : cc, 1 : rr);
%Inverse of the transformation
Xn = X - sv * Y;
Yn = Y;

figure,imagesc(griddata(X,Y,double(imgGray),Xn,Yn,'linear')),colormap gray, title('Shear (vertical)')

%% Shear (horizontal)

%Shearing coefficient
sh = 0.7;

[X, Y] = meshgrid(1 : cc, 1 : rr);
%Inverse of the transformation
Xn = X;
Yn = Y - sh * X;

figure,imagesc(griddata(X,Y,double(imgGray),Xn,Yn,'linear')),colormap gray, title('Shear (horizontal)')