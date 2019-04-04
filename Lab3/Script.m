imgOriginal = imread('cameraman.tif', 'tif');

%Set this variable to true if you want to see the resulting images
imgShow = true;


%% Part 1 - Execute the Laplacian of the Gaussian operator

sd = 1.5; %standard deviation
sup = 9; %support

doLoG(sd, sup, imgShow);



%% Part 2 - Filter the image with the LoG

convImg = filterLoG(imgOriginal, sd, sup, imgShow);


%% Part 3 - Detect zero crossing  

threshold = 10;
edgeImg = detZeroCrossing(imgOriginal, sd, sup, threshold, imgShow);


%% Part 4 - Comparate the results
sd = 1.8;
sup = 13;
threshold = 1.9;
comparate(imgOriginal, sd, sup, threshold, imgShow);

%% Animation  

if(imgShow)
    %The support is fixed to 19, which is the minimum support when sigma is 3
    figure;
    for sigma=0.3:0.1:3
        %                                    support, threshold
        e1 = detZeroCrossing(imgOriginal, sigma, 19, 0.00001, false);
        e2 = detZeroCrossing(imgOriginal, sigma, 19, 0.0001, false);
        e3 = detZeroCrossing(imgOriginal, sigma, 19, 0.001, false);
        e4 = detZeroCrossing(imgOriginal, sigma, 19, 0.01, false);
        e5 = detZeroCrossing(imgOriginal, sigma, 19, 0.1, false);
        e6 = detZeroCrossing(imgOriginal, sigma, 19, 1, false);
        e7 = detZeroCrossing(imgOriginal, sigma, 19, 10, false);
        e8 = detZeroCrossing(imgOriginal, sigma, 19, 100, false);
        e9 = detZeroCrossing(imgOriginal, sigma, 19, 1000, false);

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






