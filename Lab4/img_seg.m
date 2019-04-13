function mask = img_seg(img_rgb, hue, sigma, doPlot)

%% Smooth the image with a Gaussian filter
%Standard deviation of the filter
sd = 3;
support = ceil(sd * 3)*2 + 1; 
%Generate the filter
h = fspecial('gaussian', support, sd);
%Fiter
img_rgbSmooth = imfilter(img_rgb, h); 

%Convert the filtered image to hsv
img_hsv = rgb2hsv(img_rgbSmooth);

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
w = 2;
%Structural element used for morphological functions
SE = strel('square',w);
mask = imerode(mask, SE);
mask = imdilate(mask, SE);

%Remove objects under this threshold
smallestAcceptableArea = 1400;
mask = bwareaopen(mask, smallestAcceptableArea);

%% Computing centroids and bounding box of the two cars
%Finding countours of the cars and label them in a matrix
[B,L] = bwboundaries(mask, 'noholes');
car1 = B{1};
car2 = B{2};

%Car1
%Finding centroid coordinates
[rr, cc] = find(L == 1);
mY1 = mean(rr);
mX1 = mean(cc);
%Finding bounding box coordinates
minY1 = min(rr);
minX1 = min(cc);
maxY1 = max(rr);
maxX1 = max(cc);

%Car2
[rr, cc] = find(L == 2);
mY2 = mean(rr);
mX2 = mean(cc);

minY2 = min(rr);
minX2 = min(cc);
maxY2 = max(rr);
maxX2 = max(cc);

if (doPlot)
    subplot(1,2,1), imagesc(img_rgbSmooth),  colormap hsv,  title('Original image')
    hold on
    plot(car1(:,2), car1(:,1), 'w', 'LineWidth', 2)
    plot(car2(:,2), car2(:,1), 'w', 'LineWidth', 2)
    plot(mX1,mY1,'*g');
    plot(mX2,mY2,'*g');
    rectangle('Position', [minX1, minY1, maxX1-minX1, maxY1-minY1], 'EdgeColor', [0, 1, 0]);
    rectangle('Position', [minX2, minY2, maxX2-minX2, maxY2-minY2], 'EdgeColor', [0, 1, 0]); 
    subplot(1,2,2), imagesc(mask), colormap gray, title('Segmented image') 
    hold on
    plot(car1(:,2), car1(:,1), 'w', 'LineWidth', 2)
    plot(car2(:,2), car2(:,1), 'w', 'LineWidth', 2)
    plot(mX1,mY1,'*g');
    plot(mX2,mY2,'*g');
    rectangle('Position', [minX1, minY1, maxX1-minX1, maxY1-minY1], 'EdgeColor', [0, 1, 0]);
    rectangle('Position', [minX2, minY2, maxX2-minX2, maxY2-minY2], 'EdgeColor', [0, 1, 0]); 
end
end