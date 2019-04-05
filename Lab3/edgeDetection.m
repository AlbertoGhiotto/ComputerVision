function edges = edgeDetection(imgOriginal, sd, sup, th, imgShow)

%Do the convolution between the original image and the LoG
filteredImg = filterLoG(imgOriginal, sd, sup, false);

[r, c] = size(filteredImg);
edges = zeros(r, c);

%% Scan columns for zero-crossing
for k = 1:r %For each row
    for i = 1:c-1 %Check the zero-crossing between two adjacent columns
        if( (filteredImg(k, i) < 0 && filteredImg(k, i+1) > 0) || (filteredImg(k, i) > 0 && filteredImg(k, i+1) < 0) )
            %Check the threshold
            if( abs(filteredImg(k, i) - filteredImg(k, i+1)) > th)
                edges(k, i) = 1;
            end
        %It is really unlikely that the value of a pixel is exactly zero but let's
        %check also for the cases {+0-} and {-0+}
        elseif (filteredImg(k, i) == 0 && (imgFiltered(k, i-1) * imgFiltered(k, i+1) < 0))
            if ( abs(imgFiltered(k, i-1) - imgFiltered(k, i+1)) / 2 > threshold)
                edges(k,i) = 1;
            end
        end
    end
end

%% Scan rows for zero-crossing
for k = 1:c %For each column
    for i = 1:r-1 %Check the zero-crossing between two adjacent rows
        if( (filteredImg(i, k) < 0 && filteredImg(i+1, k) > 0) || (filteredImg(i, k) > 0 && filteredImg(i+1, k) < 0) )
            %Check the threshold
            if( abs(filteredImg(i, k) - filteredImg(i+1, k)) > th)
                edges(i, k) = 1;
            end
        %It is really unlikely that the value of a pixel is exactly zero but let's
        %check also for the cases {+0-} and {-0+}
        elseif (filteredImg(i, k) == 0 && (imgFiltered(i-1, k) * imgFiltered(i+1, k) < 0))
            if ( abs(imgFiltered(i-1, k) - imgFiltered(i+1, k)) / 2 > threshold)
                edges(i,k) = 1;
            end
        end
    end
end


%% Display the results
if(imgShow)
    figure, sgtitle('Edge detection with LoG')
    subplot(1, 2, 1), imagesc(filteredImg), colormap gray, title(['Convoluted image, \sigma = ', num2str(sd), ', support = ', num2str(sup), 'x', num2str(sup)])
    subplot(1, 2, 2), imagesc(edges), colormap gray, title(['Edges detected, threshold = ', num2str(th)])
end

end