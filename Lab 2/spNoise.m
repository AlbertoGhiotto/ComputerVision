function img_sp = spNoise(imgOriginal, dens, imgShow)

img_sp = double(imgOriginal);
[rr,cc]=size(img_sp);
maxv = max(max(img_sp));
indices = full(sprand(rr,cc,dens)); %Dens is the noise density 
mask1 = indices > 0 & indices < 0.5;  mask2 = indices >= 0.5; %Matlab masking technique
img_sp = img_sp .*(~mask1) ;
img_sp = img_sp.*(~mask2)+maxv*mask2;

if(imgShow)
    figure, subplot(1, 2, 1), imagesc(img_sp),colormap gray, title('Salt&pepper noise image');
    subplot(1, 2, 2), imhist(uint8(img_sp), 256), title('Salt&pepper noise image histogram');
end
end