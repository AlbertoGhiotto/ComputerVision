function imgFiltered = MAFilter(img, support, imgShow)

%Generate a matrice of one whose total sum of elements is equal to one
K = ones(support) / support^2;
%Apply the filter
imgFiltered = conv2(img,K,'same');

if(imgShow)
    figure
    subplot(2,2,1), imagesc(K),colormap gray,title('MA filter')
    subplot(2,2,2),surf(K),colormap gray,title('MA filter')
    subplot(2,2,3),imagesc(imgFiltered),colormap gray,title('smoothing by averaging')
    subplot(2,2,4), imhist(uint8(imgFiltered),256), title('filtered image histogram')
end

end