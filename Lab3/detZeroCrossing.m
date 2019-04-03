function edges = detZeroCrossing(imgOriginal, sd, sup, th, imgShow)

%Do the convolution between the original image and the LoG
convImg = filterLoG(imgOriginal, sd, sup, false);

[r, c] = size(convImg);
edges = zeros(r, c);

%Find columns zero-crossing
for k = 1:r %For each row
    for i = 1:c-1 %Check the zero-crossing between two adjacent columns
        if( (convImg(k, i) < 0 && convImg(k, i+1) > 0) || (convImg(k, i) > 0 && convImg(k, i+1) < 0) )
            %Check the threshold
            if( abs(convImg(k, i) - convImg(k, i+1)) > th)
                edges(k, i) = 1;
            end
        end
    end
end

%Find rows zero-crossing
for k = 1:c %For each column
    for i = 1:r-1 %Check the zero-crossing between two adjacent rows
        if( (convImg(i, k) < 0 && convImg(i+1, k) > 0) || (convImg(i, k) > 0 && convImg(i+1, k) < 0) )
            %Check the threshold
            if( abs(convImg(i, k) - convImg(i+1, k)) > th)
                edges(i, k) = 1;
            end
        end
    end
end

%Display the results
if(imgShow)
    figure, sgtitle('Edge detection with zero-crossing')
    subplot(1, 2, 1), imagesc(convImg), colormap gray, title(['Convoluted image, \sigma = ', num2str(sd), ', support = ', num2str(sup), 'x', num2str(sup)])
    subplot(1, 2, 2), imagesc(edges), colormap gray, title(['Edges detected, threshold = ', num2str(th)])
end

 

end