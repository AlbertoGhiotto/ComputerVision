function imgFiltered = MAFilter(img, support, imgShow, imgType)

%Generate a matrice of one whose total sum of elements is equal to one
K = ones(support) / support^2;
%Apply the filter
imgFiltered = conv2(img,K,'same');

if(imgShow)
    figure
    subplot(3,2,1), imagesc(K), colormap gray, title(['MA filter with support ', num2str(support), 'x', num2str(support)])
    subplot(3,2,2), surf(K), colormap gray, title(['MA filter with support ', num2str(support), 'x', num2str(support)])
    subplot(3,2,3), imagesc(img), colormap gray, title([imgType, ' noisy image'])
    subplot(3,2,4), imagesc(imgFiltered), colormap gray, title({'smoothing by averaging'; ['of the ', imgType, ' noisy image']})
    subplot(3,2,5), imhist(uint8(img),256), ylim([0, 1500]), title([imgType, ' noisy image histogram'])
    subplot(3,2,6), imhist(uint8(imgFiltered),256), ylim([0, 1500]), title({['filtered ', imgType]; ' noisy image histogram'})
end

end