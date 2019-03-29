function imgSPNoise = SPNoise(img, noiseDensity, imgShow)

img = double(img);
[rr,cc] = size(img);
%Find the maximum value among those of the pixels
maxv = max( max( img));
%Generate a matrix with all zeros but some elements in random positions
%with values between zero and one
indices = full( sprand( rr, cc, noiseDensity));
%Create a matrix with one value where the value is between 0(excluded) and
%0.5, and zero otherwise
mask1 = indices > 0 & indices < 0.5;
%Create a matrix with one value where the value is higher than
%0.5, and zero otherwise
mask2 = indices >= 0.5;
%Multiply by zero the pixels of the image in the same coordinates as those
%set in mask1
imgSPNoise = img .* (~mask1) ;
%Set to the maximum value the pixels of the image with the same coordinates
%as those set in mask2
imgSPNoise = (imgSPNoise .* (~mask2)) + (maxv * mask2);

if(imgShow)
    figure
    subplot(2,2,1), imagesc(img), colormap gray(256), title('Original image')
    subplot(2,2,2), image(imgSPNoise), colormap gray(256), title('Salt and pepper noisy image')
    subplot(2,2,3), imhist(uint8(img),256), ylim([0, 1500]), title('Original image histogram')
    subplot(2,2,4), imhist( uint8( imgSPNoise), 256), ylim([0, 1500]), title('Salt and pepper noisy image histogram')
end

end