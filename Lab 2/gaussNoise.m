function img_g = gaussNoise(imgOriginal, sd, imgShow)

img_g = double(imgOriginal)+ sd*randn(size(imgOriginal)); %Standard deviation

if(imgShow)
    figure, subplot(1, 2, 1), imagesc(img_g),colormap gray, title('Gaussian noise image');
    subplot(1, 2, 2), imhist(uint8(img_g), 256), title('Gaussian noise image histogram');
end
end