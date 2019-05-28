<<<<<<< HEAD
function mask = edgeDetection(img, sigma, support, threshold, doPlot)

%Filter the original image with the second derivative of a Gaussian
imgFiltered = filterLoG(img, sigma, support, doPlot);
%Initialise the matrix whitch will represent the image of the edges
mask = zeros(size(imgFiltered));


%% Scan rows for zero-crossing

for i = 1 : size(imgFiltered, 1) 
    for j = 2 : size(imgFiltered, 2) - 1
        %If a change of sign has happened between two adjacent pixels in the filtered image then
        %set the corresponding pixels in the edge image to 1
        if ( (imgFiltered(i, j) > 0 && imgFiltered(i, j + 1) < 0) || (imgFiltered(i, j) < 0 && imgFiltered(i, j + 1) > 0) )
            if ( abs(imgFiltered(i,j) - imgFiltered(i, j + 1)) > threshold)
                mask(i,j) = 1;
                %mask(i,j+1) = 1;
            end
        %If a pixel  in the filtered image has zero value then set to one
        %the corresponding pixel in the edge image
        elseif (j ~= 1 && imgFiltered(i, j) == 0 && (imgFiltered(i, j-1) * imgFiltered(i, j+1)) < 0)
            if ( abs(imgFiltered(i, j - 1) - imgFiltered(i, j + 1)) / 2 > threshold)
                mask(i,j) = 1;
=======
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
>>>>>>> master
            end
        end
    end
end

<<<<<<< HEAD

%% The same as before for columns

for j = 1 : size(imgFiltered, 2)
    for i = 2 : size(imgFiltered, 1) - 1
        if ( (imgFiltered(i, j) > 0 && imgFiltered(i + 1, j) < 0) || (imgFiltered(i, j) < 0 && imgFiltered(i + 1, j) > 0) )
           if ( abs(imgFiltered(i,j) - imgFiltered(i + 1, j)) > threshold)
                mask(i,j) = 1;
                %mask(i+1,j) = 1;
           end
        elseif (i ~= 1 && imgFiltered(i, j) == 0 && (imgFiltered(i - 1, j) * imgFiltered(i + 1, j)) < 0)
           if ( abs(imgFiltered(i - 1, j) - imgFiltered(i + 1, j)) / 2 > threshold)
                mask(i,j) = 1;
=======
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
>>>>>>> master
            end
        end
    end
end

<<<<<<< HEAD
%% Edge detection using the MATLAB function

mask2 = edge(img, 'log');

%% Plot

if (doPlot)
    figure
    subplot(1,2,1), imagesc(mask),colormap gray, title(['Edge detection using an LoG with standard deviation \sigma=', num2str(sigma)])
    subplot(1,2,2), imagesc(mask2),colormap gray, title('Edge detection using the MATLAB function')
end

end
=======

%% Display the results
if(imgShow)
    figure, sgtitle('Edge detection with LoG')
    subplot(1, 2, 1), imagesc(filteredImg), colormap gray, title(['Convoluted image, \sigma = ', num2str(sd), ', support = ', num2str(sup), 'x', num2str(sup)])
    subplot(1, 2, 2), imagesc(edges), colormap gray, title(['Edges detected, threshold = ', num2str(th)])
end

end
>>>>>>> master
