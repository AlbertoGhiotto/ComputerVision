function imgGaussianNoise = GaussianNoise(img, sigma, imgShow)

%normal distribution noise
imgGaussianNoise = double(img) + sigma * randn( size( img));

if(imgShow)
    figure,
    subplot(2,2,1), imagesc(img), colormap gray(256), title('Original image')
    subplot(2,2,2),imagesc(imgGaussianNoise),colormap gray(256), title('Gaussian noisy image')
    subplot(2,2,3), imhist(uint8(img),256), ylim([0, 1500]), title('Original image histogram')
    subplot(2,2,4), imhist(uint8(imgGaussianNoise),256), ylim([0, 1500]), title('Gaussian noisy image histogram')
end

end