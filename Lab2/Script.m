%imgOriginal = imread('tree.png');
imgOriginal = imread('i235.png');

%Set this variable to true if you want to see the resulting images
imgShow = true;



%% Part 1 (Adding noise)

%Gaussian noise
sigma = 20;
imgGaussianNoise = GaussianNoise(imgOriginal, sigma, imgShow);

%Salt and pepper noise
noiseDensity = 0.2;
imgSPNoise = SPNoise(imgOriginal, noiseDensity, imgShow);



%% Part 2 (Removing noise)
%% Dimension of the filter 3
support = 3;
%Moving average filter
MAFilter(imgGaussianNoise, support, imgShow, 'Gaussian');
MAFilter(imgSPNoise, support, imgShow, 'Salt and pepper');
%Gaussian filter
sigma = support/6;      %3*sigma has to be equal or less than half width
GaussianFilter(imgGaussianNoise, support, sigma, imgShow, 'Gaussian');
GaussianFilter(imgSPNoise, support, sigma, imgShow, 'Salt and pepper');
%Median filter
MedianFilter(imgGaussianNoise, support, imgShow, 'Gaussian');
MedianFilter(imgSPNoise, support, imgShow, 'Salt and pepper');
%% The same with a different dimension of the filter 7
support = 7;

MAFilter(imgGaussianNoise, support, imgShow, 'Gaussian');
MAFilter(imgSPNoise, support, imgShow, 'Salt and pepper');

GaussianFilter(imgGaussianNoise, support, sigma, imgShow, 'Gaussian');
GaussianFilter(imgSPNoise, support, sigma, imgShow, 'Salt and pepper');

MedianFilter(imgGaussianNoise, support, imgShow, 'Gaussian');
MedianFilter(imgSPNoise, support, imgShow, 'Salt and pepper');



%% Part 3 (Practice with linear filter)

support = 7;
%Filter without changing
NoChangeFilter(imgOriginal, support, imgShow);

%Translate by filtering
TranslateFilter(imgOriginal, support, imgShow);

%Sharpening filter
SharpeningFilter(imgOriginal, support, imgShow);



%% Part 4 (FFT)

%FFT of the original image
Fimg = FFTtranformShow(imgOriginal, imgShow);

%Parameters of a 2D-gaussian image
sigma = 5;
size = 101;
%FFT of the gaussian function
Fgauss = FFTGauss(sigma, size, imgShow);