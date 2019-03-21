function imgFiltered = MedianFilter(img, support, imgShow)

%Apply the median filter with kernel of size = support
imgFiltered = medfilt2(img, [support, support]);

if(imgShow)
    figure
    subplot(1,2,1),imagesc(imgFiltered),colormap gray,title('smoothing by median')
    subplot(1,2,2), imhist(uint8(imgFiltered),256), title('filtered image histogram')
end

end