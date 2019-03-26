function imgFiltered = GaussianFilter(img, support, sigma, imgShow, imgType)

%Define the gaussian filter
h = fspecial('gaussian', support, sigma);
%Apply the filter
imgFiltered = imfilter(img, h); 

if(imgShow)
    figure, sgtitle(['Gaussian filter [', num2str(support), 'x', num2str(support), ']'])
    subplot(3,2,1), imagesc(h), colormap gray, title('Filter image')
    subplot(3,2,2), surf(h), colormap gray, title('Filter surface')
    subplot(3,2,3), imagesc(img), colormap gray, title([imgType, ' noisy image'])
    subplot(3,2,4), imagesc(imgFiltered), colormap gray, title('Filtered image')
    subplot(3,2,5), imhist(uint8(img),256), title([imgType, ' noisy image histogram'])
    subplot(3,2,6), imhist(uint8(imgFiltered),256), title('Filtered image histogram')
end

end