function imgFiltered = transFilt(img, support, show)

%Initizalize the filter
K = zeros(support);
[rr, cc] = size(K);
%Central pixel coordinates
midY = ceil(rr / 2);
%Set the the pixel in mid-height right to 1
K(midY, cc) = 1;

%Apply the filtering
imgFiltered = conv2(img, K, 'same');

if(show)
    figure
    subplot(1,2,1), imagesc(img), colormap gray, title('Original')
    subplot(1,2,2), imagesc(imgFiltered), colormap gray, title('Translated by filtering')
end

end