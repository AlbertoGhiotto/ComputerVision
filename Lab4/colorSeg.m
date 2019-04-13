function mask = colorSeg(imgOriginal, hue, sd, doPlot)

%% Smooth the image with a Gaussian filter
%Standard deviation of the filter
sigma = 3;
%Spatial support of the filter
support = ceil(sigma * 3)*2 + 1; 
%Generate the filter
h = fspecial('gaussian', support, sigma);
%Apply the filter
imgFilt = imfilter(imgOriginal, h); 

%To convert from rgb colors to hsv
img_hsv = rgb2hsv(imgFilt);

%% Simple segmentation
%Boundaries for the segmentation
lb = (hue - 3*sd);
ub = (hue + 3*sd);

%Set to one pixels whose value is in the range [hue-3sigma, hue+3sigma]
mask = ( (img_hsv(:,:,1) > lb) & (img_hsv(:,:,1) < ub) );

%The hue values are circular therefore if hue-3sigma is smaller than zero
%than the range of values to be accepted is to be re-enter from the upper
%extreme of the rage of hue vaues
if ( (hue - 3*sd) < 0 )
    mask = mask + ( img_hsv(:,:,1) > (1 + (hue - 3*sd)) );
end
%Same concept as before in case of upper overflow
if ( (hue + 3*sd) > 1 )
    mask = mask + ( img_hsv(:,:,1) < ((hue + 3*sd)-1) & img_hsv(:,:,1) > 0 );
end

%% Cleaning the segmented image from small details
%Dimension of the square structural element
w = 2;
%Structural element used for morphological functions
SE = strel('square', w);
mask = imerode(mask, SE);
mask = imdilate(mask, SE);
%Remove objects under this threshold
smallestAcceptableArea = 1400;
mask = bwareaopen(mask, smallestAcceptableArea);


%% To display the results
if(doPlot)
    figure, sgtitle(['Segmentation using m = ', num2str(hue), ', \sigma = ', num2str(sd)])
    subplot(1,2,1), imagesc(imgOriginal),colormap gray, title('Original')
    subplot(1,2,2), imagesc(mask),colormap gray, title('Segmented') %binary image (segmented image, i.e. detection of a given color)

end