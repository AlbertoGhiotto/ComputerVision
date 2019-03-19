function imgRotated = coloredRotation(imgOriginal, theta, imgShow)

%Dimensions of the image
[rr,cc, channels]=size(imgOriginal);

%Indexes of the centre of the image
midX = (cc + 1) / 2;
midY = (rr + 1) / 2;

[X, Y] = meshgrid(1 : cc, 1 : rr);
%Inverse of the transformation
Xc = (X - midX) * cos(theta) + (Y - midY) * sin(theta);
Yc = -(X - midX) * sin(theta) + (Y - midY) * cos(theta);
%Re-center the image 
Xn = Xc + midX;
Yn = Yc + midY;

%Divide the image in the three channels R,G and B 
redChannel = imgOriginal(:, :, 1);
greenChannel = imgOriginal(:, :, 2);
blueChannel = imgOriginal(:, :, 3);

%Interpolate the three images separately
redInterpolated = griddata(X,Y,double(redChannel),Xn,Yn,'linear');
greenInterpolated = griddata(X,Y,double(greenChannel),Xn,Yn,'linear');
blueInterpolated = griddata(X,Y,double(blueChannel),Xn,Yn,'linear');

%Recompose the three rotated channels to get the total RGB rotated 
%The division by 255 is required by matlab to display correctly the RGB image
imgRotated = cat(3, redInterpolated, greenInterpolated, blueInterpolated) / 255;


if(imgShow)
    figure,imagesc(redInterpolated),colormap autumn, title('red channel')
    figure,imagesc(greenInterpolated),colormap summer, title('green channel')
    figure,imagesc(blueInterpolated),colormap winter, title('blue channel')
    figure,imagesc(imgRotated), title('Colored rotation')
end

end