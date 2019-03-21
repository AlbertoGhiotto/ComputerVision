function imgFiltered = sharpeningFilter(img, support, imgShow)

%Initizalize the filter K1 as a filter which simply double the value of all
%the pixel
K1 = zeros(support);
[rr, cc] = size(K1);
%Central pixel coordinates
midX = ceil(cc / 2);
midY = ceil(rr / 2);
%Set the central pixel to 2
K1(midY, midX) = 2;
%Initialize the filter K2 as a moving average filter
K2 = ones(support) / (support ^ 2);
%Define the final filter which will be applied
K = K1 - K2;

%Apply the filtering
imgFiltered = conv2(img, K, 'same');

if(imgShow)
    figure
    subplot(1,2,1), imagesc(img), colormap gray, title('Original')
    subplot(1,2,2), imagesc(imgFiltered), colormap gray, title('Filtered')
end

end