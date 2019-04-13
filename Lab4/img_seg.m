function mask = img_seg(img_rgb, hue, sigma, doPlot)

sd = 3;
support = ceil(sd * 3)*2 + 1; 
h = fspecial('gaussian', support, sd);
img_rgb = imfilter(img_rgb, h); 

img_hsv = rgb2hsv(img_rgb);

%% Segmentation based on the hue values
%Set to one pixels whose value is in the range [hue-3sigma, hue+3sigma]
mask = ( img_hsv(:,:,1) > (hue - 3*sigma) ) & ( img_hsv(:,:,1) < (hue + 3*sigma) );
%The hue values are circular therefore if hue-3sigma is smaller than zero
%than the range of values to be accepted is to be re-enter from the upper
%extreme of the rage of hue vaues
if ( (hue - 3*sigma) < 0 )
    mask = mask + ( img_hsv(:,:,1) > (1 + (hue - 3*sigma)) );
end
%Same concept as before in case of upper overflow
if ( (hue + 3*sigma) > 1 )
    mask = mask + ( img_hsv(:,:,1) < ((hue + 3*sigma)-1) & img_hsv(:,:,1) > 0 );
end

%% Cleaning the segmented image from small details
%Dimension of the square structural element
w = 7;
%Structural element used for morphological functions
SE = strel('square',w);
mask = imerode(mask, SE);
mask = imdilate(mask, SE);

%Remove objects under this threshold
smallestAcceptableArea = 120;
mask = uint8(bwareaopen(mask, smallestAcceptableArea));


prop=regionprops(mask, 'Area','Centroid','BoundingBox');


%B = bwboundaries(mask);


% prop=regionprops(mask, 'Area','Centroid','BoundingBox');
% xc=floor(prop(1).Centroid(1));
% yc=floor(prop(1).Centroid(2));
% ul_corner_width=prop(1).BoundingBox;
% figure,imagesc(mask),colormap gray,title('detected object')
% hold on
% plot(xc,yc,'*r')
% rectangle('Position',ul_corner_width,'EdgeColor',[1,0,0])
figure, imagesc(mask), colormap gray, title('Segmented image') 
if (doPlot)
    figure
    subplot(1,2,1), imagesc(img_hsv),  colormap hsv,  title('Original image')
    subplot(1,2,2), imagesc(mask), colormap gray, title('Segmented image') 
end
end