function mask = img_seg(img_hsv, hue, sigma, doPlot)

%Get the dimensions of the image
[rr,cc,depth] = size(img_hsv);

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
    mask = mask + ( img_hsv(:,:,1) < ((hue + 3*sigma)-1) );
end

if (doPlot)
    figure
    subplot(1,2,1), imagesc(img_hsv),  colormap hsv,  title('Original image')
    subplot(1,2,2), imagesc(mask), colormap gray, title('Segmented image') 
end
end