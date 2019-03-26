function imgFiltered = MedianFilter(img, support, imgShow, imgType)

%Apply the median filter with kernel of size = support
imgFiltered = medfilt2(img, [support, support]);

if(imgShow)
    figure, sgtitle(['Median filter [', num2str(support), 'x', num2str(support), ']'])
    subplot(2,2,1), imagesc(img), colormap gray, title([imgType, ' noisy image'])
    subplot(2,2,2),imagesc(imgFiltered),colormap gray,title('Filtered image')
    subplot(2,2,3), imhist(uint8(img),256), title([imgType, ' noisy image histogram'])
    subplot(2,2,4), imhist(uint8(imgFiltered),256), title('Filtered image histogram')
end

end