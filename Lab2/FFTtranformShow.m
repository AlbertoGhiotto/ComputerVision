function Fimg = FFTtranformShow(img, imgShow)

%Apply FFT
Fimg = fftshift( fft2( img));

if(imgShow)
   figure, imagesc(log(abs(Fimg))), colormap gray, xlabel('wx'), ylabel('wy'), title('log(abs(FFTtransform)) of the original image') 
end
