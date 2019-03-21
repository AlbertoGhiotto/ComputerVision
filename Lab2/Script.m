%imgOriginal = imread('tree.png');
imgOriginal = imread('i235.png');

%Set this variable to true if you want to see the resulting images
imgShow = true;



%% Part 1 (Adding noise)

%Gaussian noise
sigma = 20;
imgGaussianNoise = gaussianNoise(imgOriginal, sigma, imgShow);

%Salt and pepper noise
noiseDensity = 0.2;
imgSPNoise = SPNoise(imgOriginal, noiseDensity, imgShow);



%% Part 2 (Removing noise)
%% Dimension of the filter 3
support = 3;
%Moving average filter
MAFilter(imgGaussianNoise, support, imgShow);
MAFilter(imgSPNoise, support, imgShow);
%Gaussian filter
sigma = 0.5;
GaussianFilter(imgGaussianNoise, support, sigma, imgShow);
GaussianFilter(imgSPNoise, support, sigma, imgShow);
%Median filter
MedianFilter(imgGaussianNoise, support, imgShow);
MedianFilter(imgSPNoise, support, imgShow);
%% The same with a different dimension of the filter 7
support = 7;

MAFilter(imgGaussianNoise, support, imgShow);
MAFilter(imgSPNoise, support, imgShow);

GaussianFilter(imgGaussianNoise, support, sigma, imgShow);
GaussianFilter(imgSPNoise, support, sigma, imgShow);

MedianFilter(imgGaussianNoise, support, imgShow);
MedianFilter(imgSPNoise, support, imgShow);



%% Part 3 (Practice with linear filter)

support = 7;
%Filter without changing
noChangeFilter(imgOriginal, support, imgShow);

%Translate by filtering
translateFilter(imgOriginal, support, imgShow);

%Sharpening filter
sharpeningFilter(imgOriginal, support, imgShow);



%% Part 4 (FFT)

%FFT of the original image
Fimg = FFTtranformShow(imgOriginal, imgShow);

%Parameters of a 2D-gaussian image
sigma = 5;
size = 101;
%FFT of the gaussian function
Fgauss = FFTGauss(sigma, size, imgShow);