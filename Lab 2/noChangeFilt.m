function imgFiltered = noChangeFilt(img, support, show)

%Initizalize the filter
K = zeros(support);
[rr, cc] = size(K);
%Central pixel coordinates
midX = ceil(cc / 2);
midY = ceil(rr / 2);
%Set the the central pixel to 1
K(midY, midX) = 1;

%Apply the filtering
imgFiltered = conv2(img, K, 'same');

if(show)
    figure
    subplot(1,2,1), imagesc(img), colormap gray, title('Original')
    subplot(1,2,2), imagesc(imgFiltered), colormap gray, title('Filtered')
end

end
