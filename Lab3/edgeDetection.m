function mask = edgeDetection(img, sigma, support, threshold, doPlot)

%Filter the original image with the second derivative of a Gaussian
imgFiltered = filterLoG(img, sigma, support, doPlot);
%Initialise the matrix whitch will represent the image of the edges
mask = zeros(size(imgFiltered));


%% Scan rows for zero-crossing

for i = 1 : size(imgFiltered, 1) 
    for j = 1 : size(imgFiltered, 2) - 1
        %If a change of sign has happened between two adjacent pixels in the filtered image then
        %set the corresponding pixels in the edge image to 1
        if ( (imgFiltered(i, j) > 0 && imgFiltered(i, j + 1) < 0) || (imgFiltered(i, j) < 0 && imgFiltered(i, j + 1) > 0) )
            if ( (imgFiltered(i,j) - imgFiltered(i, j + 1)) > threshold)
                mask(i,j) = 1;
                mask(i,j+1) = 1;
            end
        %If a pixel  in the filtered image has zero value then set to one
        %the corresponding pixel in the edge image
        elseif (imgFiltered(i, j) == 0 && (imgFiltered(i, j-1) * imgFiltered(i, j+1) < 0))
            if ( (imgFiltered(i, j - 1) - imgFiltered(i, j + 1)) / 2 > threshold)
                mask(i,j) = 1;
            end
        end
    end
end


%% The same as before for columns

for j = 1 : size(imgFiltered, 2)
    for i = 1 : size(imgFiltered, 1) - 1
        if ( (imgFiltered(i, j) > 0 && imgFiltered(i + 1, j) < 0) || (imgFiltered(i, j) < 0 && imgFiltered(i + 1, j) > 0) )
           if ( (imgFiltered(i,j) - imgFiltered(i + 1, j)) > threshold)
                mask(i,j) = 1;
                mask(i+1,j) = 1;
            end
        elseif (imgFiltered(i, j) == 0 && (imgFiltered(i - 1, j) * imgFiltered(i + 1, j) < 0))
           if ( (imgFiltered(i - 1, j) - imgFiltered(i + 1, j)) / 2 > threshold)
                mask(i,j) = 1;
            end
        end
    end
end

%% Edge detection using the MATLAB function

mask2 = edge(img, 'log');

%% Plot

if (doPlot)
    figure
    subplot(1,2,1), imagesc(mask),colormap gray, title(['Edge detection using an LoG with standard deviation \sigma=', num2str(sigma)])
    subplot(1,2,2), imagesc(mask2),colormap gray, title('Edge detection using the MATLAB function')
end

end