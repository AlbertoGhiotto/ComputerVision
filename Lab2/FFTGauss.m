function Fimg = FFTGauss(sigma, size, imgShow)

%Define a grid
[X,Y] = meshgrid(1:size);

%Gaussian
Z = exp((-X.^2 -Y.^2) / (2 * (sigma ^ 2)));

%Apply FFT
Fimg = fftshift( fft2( Z));

if(imgShow)
   figure, imagesc(log(abs(Fimg))), colormap gray, xlabel('wx'), ylabel('wy'), title('log(abs(FFTtransform)) of 2D-Gaussian') 
end
