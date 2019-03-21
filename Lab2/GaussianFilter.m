function imgFiltered = GaussianFilter(img, support, sigma, imgShow, imgType)

%Define the gaussian filter
h = fspecial('gaussian', support, sigma);
%Apply the filter
imgFiltered = imfilter(img, h); 

if(imgShow)
    figure
    subplot(3,2,1), imagesc(h), colormap gray, title(['Gaussian filter with support ', num2str(support), 'x', num2str(support)])
    subplot(3,2,2), surf(h), colormap gray, title(['Gaussian filter with support ', num2str(support), 'x', num2str(support)])
    subplot(3,2,3), imagesc(img), colormap gray, title([imgType, ' noisy image'])
    subplot(3,2,4), imagesc(imgFiltered), colormap gray, title({'smoothing by gaussian filter'; ['of the ', imgType, ' noisy image']})
    subplot(3,2,5), imhist(uint8(img),256), title([imgType, ' noisy image histogram'])
    subplot(3,2,6), imhist(uint8(imgFiltered),256), title({['filtered ', imgType]; ' noisy image histogram'})
end

end