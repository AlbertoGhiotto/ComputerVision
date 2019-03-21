function fft = fftGauss(sigma, size, show)

%Define a grid
[X,Y] = meshgrid(1:size);

%Gaussian
Z = exp((-X.^2 -Y.^2) / (2 * (sigma ^ 2)));

%Apply FFT
fft = fftshift( fft2(Z) );

if(show)
   figure, imagesc(log(abs(fft))), colormap gray, xlabel('wx'), ylabel('wy'), title('log(abs(FFTtransform)) of 2D-Gaussian') 
end
