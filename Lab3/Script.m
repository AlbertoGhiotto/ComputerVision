close all;

% imgOriginal = imread('cameraman.tif', 'tif');
imgOriginal = double(imread('car.bmp', 'bmp'));
%Set to true if it is desired to show the image
doPlot = true;

%% Edge detection

%Standard deviation for the Gaussian filter
sigma = 3;
%Kernel dimension for the Gaussian filter, by default set to its minimum
%value, corresponding to 6 * sigma
support = ceil(sigma * 6) + 1;

%Minimum slope to consider the zero crossing 
threshold = 0.15;
%Detect edges of the image
edgeDetection(imgOriginal, sigma, support, threshold, doPlot);

%% The same for sigma = 2
sigma = 2;
support = ceil(sigma * 6) + 1;

threshold = 0.4;

edgeDetection(imgOriginal, sigma, support, threshold, doPlot);

%% The same for sigma = 1
sigma = 1;
support = ceil(sigma * 6) + 1;

threshold = 2.8;

edgeDetection(imgOriginal, sigma, support, threshold, doPlot);

%% The same for sigma = 1.5
sigma = 1.5;
support = ceil(sigma * 6) + 1;

threshold = 0.85;

edgeDetection(imgOriginal, sigma, support, threshold, doPlot);
