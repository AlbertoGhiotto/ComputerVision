imgOriginal = imread('cameraman.tif', 'tif');

%Set this variable to true if you want to see the resulting images
imgShow = true;


%% Part 1 - Execute the Laplacian of the Gaussian operator

sd = 1.5; %standard deviation
sup = ceil(sd * 3)*2 + 1; %support

doLoG(sd, sup, imgShow);



%% Part 2 - Filter the image with the LoG

convImg = filterLoG(imgOriginal, sd, sup, imgShow);


%% Part 3 - Detect zero crossing  

threshold = 3;
edgeImg = edgeDetection(imgOriginal, sd, sup, threshold, imgShow);


%% Part 4 - Compare the results
sd = 1.8;
sup = ceil(sd * 3)*2 + 1;
threshold = 1.9;
compareAlg(imgOriginal, sd, sup, threshold, imgShow);

%% Animation  

if(imgShow)
    %The support is fixed to 19, which is the minimum support when sigma is 3
    figure;
    for sigma=0.3:0.1:3
        support = ceil(sigma * 3)*2 + 1;
        doPlot = false;
        %                                                 threshold
        e1 = edgeDetection(imgOriginal, sigma, support, 0.00001, doPlot);
        e2 = edgeDetection(imgOriginal, sigma, support, 0.0001, doPlot);
        e3 = edgeDetection(imgOriginal, sigma, support, 0.001, doPlot);
        e4 = edgeDetection(imgOriginal, sigma, support, 0.01, doPlot);
        e5 = edgeDetection(imgOriginal, sigma, support, 0.1, doPlot);
        e6 = edgeDetection(imgOriginal, sigma, support, 1, doPlot);
        e7 = edgeDetection(imgOriginal, sigma, support, 10, doPlot);
        e8 = edgeDetection(imgOriginal, sigma, support, 100, doPlot);
        e9 = edgeDetection(imgOriginal, sigma, support, 1000, doPlot);

        subplot(3, 3, 1), imagesc(e1), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 0.00001']);
        subplot(3, 3, 2), imagesc(e2), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 0.0001']);
        subplot(3, 3, 3), imagesc(e3), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 0.001']);
        subplot(3, 3, 4), imagesc(e4), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 0.01']);
        subplot(3, 3, 5), imagesc(e5), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 0.1']);
        subplot(3, 3, 6), imagesc(e6), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 1']);
        subplot(3, 3, 7), imagesc(e7), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 10']);
        subplot(3, 3, 8), imagesc(e8), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 100']);
        subplot(3, 3, 9), imagesc(e9), colormap gray, title(['\sigma = ', num2str(sigma), ', th = 1000']);
        pause(0.30); % 0.30 seconds between an image and the following one 
        getframe; % Overlap the frames to create a video/animation
    end
end






