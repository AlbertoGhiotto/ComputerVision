<<<<<<< HEAD
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
support = ceil(sigma * 3)*2 + 1;

%Minimum slope to consider the zero crossing 
threshold = 0.15;
%Detect edges of the image
edgeDetection(imgOriginal, sigma, support, threshold, doPlot);

%% The same for sigma = 2
sigma = 2;
support = ceil(sigma * 3)*2 + 1;

threshold = 0.85;

edgeDetection(imgOriginal, sigma, support, threshold, doPlot);

%% The same for sigma = 1
sigma = 1;
support = ceil(sigma * 3)*2 + 1;

threshold = 2.8;

edgeDetection(imgOriginal, sigma, support, threshold, doPlot);

%% The same for sigma = 1.5
sigma = 1.5;
support = ceil(sigma * 3)*2 + 1;

threshold = 0.85;

edgeDetection(imgOriginal, sigma, support, threshold, doPlot);
=======
close all;

imgOriginal = imread('cameraman.tif', 'tif');

%Set this variable to true if you want to see the resulting images
imgShow = true;


%% Part 1 - Execute the Laplacian of the Gaussian operator

sd = 2; %standard deviation
sup = ceil(sd * 3)*2 + 1; %support

doLoG(sd, sup, imgShow);



%% Part 2 - Filter the image with the LoG

convImg = filterLoG(imgOriginal, sd, sup, imgShow);


%% Part 3 - Detect zero crossing  (GOOD)

sd = 2;
sup = ceil(sd * 3)*2 + 1;
threshold = 0.6;
edgeDetection(imgOriginal, sd, sup, threshold, imgShow);


%% Part 3 - Detect zero crossing  (SMALL SIGMA -> NOISE)

sd = 1.5;
sup = ceil(sd * 3)*2 + 1;
threshold = 0.6;
edgeDetection(imgOriginal, sd, sup, threshold, imgShow);


%% Part 3 - Detect zero crossing  (SMALL THRESHOLD, GOOD SIGMA -> LOTS OF DETAILS)

sd = 2;
sup = ceil(sd * 3)*2 + 1;
threshold = 0.2;
edgeDetection(imgOriginal, sd, sup, threshold, imgShow);


%% Part 3 - Detect zero crossing  (HIGH SIGMA -> NO SMALL DETAILS)

sd = 3;
sup = ceil(sd * 3)*2 + 1;
threshold = 0.6;
edgeDetection(imgOriginal, sd, sup, threshold, imgShow);


%% Part 4 - Compare the results
sd = 2;
sup = ceil(sd * 3)*2 + 1;
threshold = 0.6;
compareAlg(imgOriginal, sd, sup, threshold, imgShow);

%% Animation  

% if(imgShow)
%     %The support is fixed to 19, which is the minimum support when sigma is 3
%     figure;
%     for sigma=0.3:0.1:3
%         support = ceil(sigma * 3)*2 + 1;
%         doPlot = false;
%         %                                                 threshold
%         e1 = edgeDetection(imgOriginal, sigma, support, 0.00001, doPlot);
%         e2 = edgeDetection(imgOriginal, sigma, support, 0.0001, doPlot);
%         e3 = edgeDetection(imgOriginal, sigma, support, 0.001, doPlot);
%         e4 = edgeDetection(imgOriginal, sigma, support, 0.01, doPlot);
%         e5 = edgeDetection(imgOriginal, sigma, support, 0.1, doPlot);
%         e6 = edgeDetection(imgOriginal, sigma, support, 1, doPlot);
%         e7 = edgeDetection(imgOriginal, sigma, support, 10, doPlot);
%         e8 = edgeDetection(imgOriginal, sigma, support, 100, doPlot);
%         e9 = edgeDetection(imgOriginal, sigma, support, 1000, doPlot);
% 
%         subplot(3, 3, 1), imagesc(e1), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 0.00001']);
%         subplot(3, 3, 2), imagesc(e2), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 0.0001']);
%         subplot(3, 3, 3), imagesc(e3), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 0.001']);
%         subplot(3, 3, 4), imagesc(e4), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 0.01']);
%         subplot(3, 3, 5), imagesc(e5), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 0.1']);
%         subplot(3, 3, 6), imagesc(e6), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 1']);
%         subplot(3, 3, 7), imagesc(e7), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 10']);
%         subplot(3, 3, 8), imagesc(e8), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 100']);
%         subplot(3, 3, 9), imagesc(e9), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 1000']);
%         pause(0.30); % 0.30 seconds between an image and the following one 
%         getframe; % Overlap the frames to create a video/animation
%     end
% end






>>>>>>> master
