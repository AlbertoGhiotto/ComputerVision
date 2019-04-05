function imgLoG = doLoG(sigma, support, doPlot)

%Check that the support is at least 6 times sigma
if (support < (6 * sigma))
   support = ceil(sigma * 3)*2 + 1; 
end

[X,Y] = meshgrid(-support : support);
%Generate the second derivative of a Gaussian
imgLoG = (1 / (2 * pi * (sigma^2))) * (( X .^ 2 + Y .^ 2 - 2 * (sigma^2)) / (sigma^4)) .* exp(-(X.^2 + Y.^2) / (2*sigma^2));

if (doPlot)
    figure, sgtitle(['LoG with standard deviation \sigma=', num2str(sigma)])
    subplot(1,2,1), imagesc(imgLoG),colormap gray
    subplot(1,2,2), surf(imgLoG)
end

end