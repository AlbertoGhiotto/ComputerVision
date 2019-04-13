function [mean_hue, sigma] = hue_id(img_hsv, xvl, yvl, xvu, yvu)
%% xvl,yvl : upper-left vertex coordinates of the region of the image in 
%% which to compute the mean and standard deviation 
%% xvu,yvu : bottom-right vertex coordinates
%% This function is thought to detect hue values of red and wrong if 
%% the mean value is around 0.5

%Consider only the hue values of the region of interest in the image
red_rectangle = img_hsv(yvl:yvu, xvl:xvu, 1);

%Consider separately pixels with values less than 0.5 and those greater
%than 0.5
mask1 = red_rectangle < 0.5;
%Shift the values greater than 0.5 of -1 so that the values are in the
%range [-0.5, 0.5]
circular_hue = (red_rectangle .* mask1) + ((red_rectangle .* ~mask1) - ~mask1);
%Compute the mean value of the hue value transformed in the previously
%discussed way
mean_hue = mean2( circular_hue );
%Compute also the standard deviation
sigma = std2( circular_hue );

%If the mean value is smaller than zero the value corresponds to the values
%in the range [0.5, 1] therefore revert the previous translation
if(mean_hue < 0)
    mean_hue = 1 + mean_hue;
end

end