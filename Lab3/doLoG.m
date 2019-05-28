<<<<<<< HEAD
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

=======
function Z = doLoG(sd, sup, imgShow)

%sd is the standard deviation. It is related to the spatial support NxN: 
%N must be an odd number at least greater than or equal to 6 sd
if(  (sup <= 6*sd)  ||  ((sup>=6*sd)&&(mod(sup, 2)==0))  ) %The chosen support isn't correct
    sup = ceil(sd * 3)*2 + 1;
end

[X,Y]=meshgrid(-floor(sup/2):floor(sup/2));

%Compute the Laplacian of the Gaussian operator
Z=(1/(2*pi*sd^2))*((X.^2+Y.^2 -2*sd^2)/sd^4).*exp(-(X.^2+Y.^2)/(2*sd^2));

%Display the results
if(imgShow)
    figure, sgtitle(['Laplacian of Gaussian operator, \sigma = ', num2str(sd), ' , support = ', num2str(sup), 'x', num2str(sup)])
    subplot(1,2,1), imagesc(Z)
    subplot(1,2,2), surf(Z)
end

>>>>>>> master
end