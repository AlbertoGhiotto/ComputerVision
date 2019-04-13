function seg = colorSeg(imgOriginal, m, sd, doPlot)

%To convert the red-green-blue colors to hue-saturation-value
img_hsv = rgb2hsv(imgOriginal);

%Simple segmentation
lb = (m - 3*sd);
ub = (m + 3*sd);

[rr,cc,pp]=size(img_hsv);
seg = zeros(rr,cc);
mask = ( (img_hsv(:,:,1) > lb)&(img_hsv(:,:,1)<ub) );
seg = seg+mask;

%To display the results
if(doPlot)
    figure, sgtitle(['Segmentation using m = ', num2str(m), ', \sigma = ', num2str(sd)])
    subplot(1,2,1), imagesc(imgOriginal),colormap gray, title('Original')
    subplot(1,2,2), imagesc(seg),colormap gray, title('Segmented') %binary image (segmented image, i.e. detection of a given color)

end