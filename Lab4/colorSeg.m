function seg = colorSeg(imgOriginal, m, sd, doPlot)

%To smooth the image
sigma = 3;
support = ceil(sigma * 3)*2 + 1; 
h = fspecial('gaussian', support, sigma);
imgFilt = imfilter(imgOriginal, h); 

%To convert the red-green-blue colors to hue-saturation-value
img_hsv = rgb2hsv(imgFilt);

%% Simple segmentation
lb = (m - 3*sd);
ub = (m + 3*sd);

[rr,cc,pp]=size(img_hsv);
seg = zeros(rr,cc);
mask = ( (img_hsv(:,:,1) > lb)&(img_hsv(:,:,1)<ub) );
seg = seg+mask;

%% Cleaning the segmented image from small details
%Dimension of the square structural element
w = 7;
%Structural element used for morphological functions
SE = strel('square', w);
seg = imerode(seg, SE);
seg = imdilate(seg, SE);
%Remove objects under this threshold
smallestAcceptableArea = 150;
seg = bwareaopen(seg, smallestAcceptableArea);


%% To display the results
if(doPlot)
    figure, sgtitle(['Segmentation using m = ', num2str(m), ', \sigma = ', num2str(sd)])
    subplot(1,2,1), imagesc(imgOriginal),colormap gray, title('Original')
    subplot(1,2,2), imagesc(seg),colormap gray, title('Segmented') %binary image (segmented image, i.e. detection of a given color)

end