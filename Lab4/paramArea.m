function [m, sd] = paramArea(imgOriginal, doPlot)

%To convert the red-green-blue colors to hue-saturation-value
img_hsv = rgb2hsv(imgOriginal);

%% Simple segmentation
lb = 5 / 360;
hb = 355 / 360;

[rr,cc,pp]=size(img_hsv);
seg = zeros(rr,cc);
mask = (  (img_hsv(:,:,1)> hb) & (img_hsv(:,:,1) < 1)  ) | (  (img_hsv(:,:,1) > 0) & (img_hsv(:,:,1) < lb)  ); %threshold on the hue component
seg = seg+mask;

%% Area selection and parameters computations
rMin = 390;
rMax = 400;
cMin = 700;
cMax = 710;

areaRGB = imgOriginal(rMin:rMax, cMin:cMax, 1:3);
areaH = img_hsv(rMin:rMax, cMin:cMax, 1);

%Compute mean and standard deviation
%Normalize the Hue values around 1 to obtain a good mean estimation
areaHnorm = areaH(:,:);
for r=1:rMax-rMin
   for c=1:cMax-cMin
       if(areaHnorm(r, c) < 0.5)
           areaHnorm(r, c) = areaHnorm(r, c) + 1;
       end
   end
end

m = mean2(areaHnorm);
sd = std2(areaHnorm);


%% Display the results
if(doPlot)
    figure, subplot(1,2,1), imagesc(imgOriginal),colormap gray, title('Original image')
    subplot(1,2,2), imagesc(seg),colormap gray, title('Segmented object (blob)') %binary image (segmented image, i.e. detection of a given color)
    
    
    figure, sgtitle(['Red car area: m = ', num2str(m), ', \sigma = ', num2str(sd)])
    subplot(1,2,1), imagesc(areaRGB), title('RGB')
    subplot(1,2,2),imagesc(areaHnorm),colormap gray,title('Hue (normalized)')%as intensity
end

end
