function imgFiltered = GaussianFilter(img, support, sigma, imgShow)

%Define the gaussian filter
h = fspecial('gaussian', support, sigma);
%Apply the filter
imgFiltered = imfilter(img, h); 

if(imgShow)
    figure
    subplot(2,2,1), imagesc(h), colormap gray, title('Gaussian filter')
    subplot(2,2,2), surf(h), colormap gray, title('Gaussian filter')
    subplot(2,2,3), imagesc(imgFiltered), colormap gray, title('smoothing by Gaussian filter')
    subplot(2,2,4), imhist(uint8(imgFiltered),256), title('filtered image histogram')
end

end