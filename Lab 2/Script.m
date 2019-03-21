clc, clear all, close all;

%Read the original image
imgOriginal = imread('i235.png', 'png');
subplot(1, 2, 1), imagesc(imgOriginal), colormap gray, title('Original image')
subplot(1, 2, 2), imhist(uint8(imgOriginal), 256), title('Original image histogram');

show = true; %To show the images

%% ADD NOISE

%Add Gaussian noise
img_g = gaussNoise(imgOriginal, 20, show); %Sigma = 20

%Add salt&pepper noise
img_sp = spNoise(imgOriginal, 0.2, show); %Salt&pepper 20% 

%% FILTERING NOISE

% Moving Average filter
movAverFilt(img_g, 3, show); % 3x3 window
movAverFilt(img_g, 7, show); % 7x7 window
movAverFilt(img_sp, 3, show); 
movAverFilt(img_sp, 7, show); 

% Gaussian filter
gaussianFilt(img_g, 3, show); 
gaussianFilt(img_g, 7, show);
gaussianFilt(img_sp, 3, show); 
gaussianFilt(img_sp, 7, show);

% Median filter
medianFilt(img_g, 3, show);
medianFilt(img_g, 7, show);
medianFilt(img_sp, 3, show); 
medianFilt(img_sp, 7, show);

%% CONVOLUTION FILTERS

%Filter without changing
noChangeFilt(imgOriginal, 7, show);

%Translate by filtering
transFilt(imgOriginal, 7, show);

%Sharpening filter
sharpFilt(imgOriginal, 7, show);

%% FFT

%FFT of the original image
fftImg = fftshift( fft2(imgOriginal) );
figure, imagesc(log(abs(fftImg))), colormap gray, xlabel('wx'), ylabel('wy'), title('log(abs(FFTtransform)) of the original image') 

%Parameters of a 2D-gaussian image
sigma = 5;
size = 101;

%FFT of the gaussian function
fftGauss(sigma, size, show);


















