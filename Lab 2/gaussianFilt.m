function filtered = gaussianFilt(preFilt, fsize, imgShow)

sigma = fsize / 6;
h = fspecial('gaussian', fsize, sigma);
filtered = imfilter(preFilt, h); 

if(imgShow)
    figure, subplot(2, 2, 1), imagesc(preFilt),colormap gray, title('Pre-filter image');
    subplot(2, 2, 2), imagesc(filtered),colormap gray, title(['Gaussian filtered image ', num2str(fsize), 'x', num2str(fsize)]);
    subplot(2, 2, 3), imhist(uint8(preFilt), 256), title('Pre-filter histogram');
    subplot(2, 2, 4), imhist(uint8(filtered), 256), title('Filtered histogram');
    
    figure, subplot(1, 2, 1), imagesc(h), title(['Image gaussian sigma = ', num2str(sigma), ', support =', num2str(fsize)]);
    subplot(1, 2, 2), surf(h), title(['Surface gaussian sigma = ', num2str(sigma), ', support = ', num2str(fsize)]);
end
end
