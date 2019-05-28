<<<<<<< HEAD
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

=======
function convertAndShow(img_rgb, doPlot)

%To convert the red-green-blue colors to hue-saturation-value
img_hsv=rgb2hsv(img_rgb);

%Display the results
if(doPlot)
    figure,subplot(2,3,6)
    subplot(2,3,1),imagesc(img_rgb(:,:,1)),colormap gray,title('R component')%as intensity
    subplot(2,3,2),imagesc(img_rgb(:,:,2)),colormap gray,title('G component')%as intensity
    subplot(2,3,3),imagesc(img_rgb(:,:,3)),colormap gray,title('B component')%as intensity
    subplot(2,3,4),imagesc(img_hsv(:,:,1)),colormap gray,title('H component')%as intensity
    subplot(2,3,5),imagesc(img_hsv(:,:,2)),colormap gray,title('S component')%as intensity
    subplot(2,3,6),imagesc(img_hsv(:,:,3)),colormap gray,title('V component')%as intensity
end

>>>>>>> master
end