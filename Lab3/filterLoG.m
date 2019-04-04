function imgFiltered = filterLoG(img, sigma, support, doPlot)

%Generate a Gaussian
imgLoG = doLoG(sigma, support, doPlot);
%Apply convolutrion between the image and the second derivative of a
%gaussian
imgFiltered = imfilter(img, imgLoG, 'conv');

if (doPlot)
   figure,imagesc(imgFiltered),colormap gray, title(['Image filtered with a LoG with standard deviation \sigma=', num2str(sigma)])
end

end