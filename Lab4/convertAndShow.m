function img_hsv = convertAndShow(img_rgb, doPlot)

img_hsv = rgb2hsv(img_rgb);

if(doPlot)
    figure,subplot(236)
    subplot(231),imagesc(img_rgb(:,:,1)),colormap autumn, title('R component')%as intensity
    subplot(232),imagesc(img_rgb(:,:,2)),colormap summer, title('G component')%as intensity
    subplot(233),imagesc(img_rgb(:,:,3)),colormap winter, title('B component')%as intensity
    subplot(234),imagesc(img_hsv(:,:,1)),colormap gray,   title('H component')%as intensity
    subplot(235),imagesc(img_hsv(:,:,2)),colormap gray,   title('S component')%as intensity
    subplot(236),imagesc(img_hsv(:,:,3)),colormap gray,   title('V component')%as intensity 
end

end