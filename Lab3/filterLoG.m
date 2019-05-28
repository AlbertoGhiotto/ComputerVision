<<<<<<< HEAD
function imgFiltered = filterLoG(img, sigma, support, doPlot)

%Generate a Gaussian
imgLoG = doLoG(sigma, support, doPlot);
%Apply convolutrion between the image and the second derivative of a
%gaussian
imgFiltered = imfilter(img, imgLoG, 'conv');

if (doPlot)
   figure,imagesc(imgFiltered),colormap gray, title(['Image filtered with a LoG with standard deviation \sigma=', num2str(sigma)])
end

=======
function convImg = filterLoG(imgOriginal, sd, sup, imgShow)

 %Call the laplacian of gaussian operator
 Z = doLoG(sd, sup, false);
 
 %Execute the convolution
 convImg = conv2(imgOriginal, Z, 'same');
 
 %Display the results
 if(imgShow)
    figure, sgtitle(['Convolution between image and LoG, \sigma = ', num2str(sd)]);
    imagesc(convImg), colormap gray
end

 


 
 
 

>>>>>>> master
end