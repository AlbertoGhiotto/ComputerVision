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

 


 
 
 

end