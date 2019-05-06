function [mX,mY] = corrDetection(img, template, doPlot)

%Convert to gray scale
imgGray = rgb2gray(img);
%Compute the cross-correlation 
C = normxcorr2(template, imgGray);

%Find the indices of the max value in the correlation
[mY, mX] = find(C == max(C(:)));
%Compute the template dimensions
templateHeight = size(template, 1);
templateWidth = size(template, 2);

%Account for the padding that normxcorr2 adds
mX = mX - templateWidth/2;
mY = mY - templateHeight/2;
%Compute the coordinates of the bottom left vertex (to plot the rectangle)
minX = mX - templateWidth/2;
minY = mY - templateHeight/2;

if(doPlot)
    figure, subplot(1,2,1), imagesc(C),colormap gray, title('Crosscorrelation')
    subplot(1,2,2), imagesc(img), title('Car detection')
    hold on
    rectangle('Position', [minX, minY, templateWidth, templateHeight], 'EdgeColor', [0, 1, 0]);
    plot(mX,mY,'*g');
end

end