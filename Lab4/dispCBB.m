function dispCBB(seg, imgOrig, doPlot)

%Label the image to find connected elements
lab = bwlabel(seg, 8);

car1 = 0; %Label of first car
car2 = 0; %Label of second car
numLab = max(lab(:)); %Number of objects detected

%Find label correposponding to the two cars
for i=1:numLab
    temp = length(find(lab == i));
    if(temp > car1)
       car2 = car1;
       car1 = i; 
    elseif((temp > car2)&&(temp<car1))
       car2 = i; 
    end
end

%Display the results
if(doPlot)
    %Find vertex for rectangle 1
    [r1, c1] = find(lab == car1);
    min_r1 = min(r1);
    max_r1 = max(r1); 
    min_c1 = min(c1);
    max_c1 = max(c1);
    
    %Find the centroid 1
    pix = 0; %Number of pixel to 1
    xc1 = 0; %X coordinate of the centroid 1
    yc1 = 0; %Y coordinate of the centroid 1
    for i=min_r1:max_r1
        for k=min_c1:max_c1
            if(seg(i, k) == 1)
                xc1 = xc1 + k;
                yc1 = yc1 + i;
                pix = pix + 1;
            end
        end
    end
    xc1 = floor(xc1/pix);
    yc1 = floor(yc1/pix);
    
    %Find vertex for rectangle 2
    [r2, c2] = find(lab == car2);
    min_r2 = min(r2);
    max_r2 = max(r2); 
    min_c2 = min(c2);
    max_c2 = max(c2);
    
    %Find the centroid 2
    pix = 0; %Number of pixel to 1
    xc2 = 0; %X coordinate of the centrode 2
    yc2 = 0; %Y coordinate of the centrode 2
    for i=min_r2:max_r2
        for k=min_c2:max_c2
            if(seg(i, k) == 1)
                xc2 = xc2 + k;
                yc2 = yc2 + i;
                pix = pix + 1;
            end
        end
    end
    xc2 = floor(xc2/pix);
    yc2 = floor(yc2/pix);
    
    %Display all
    figure, sgtitle('Red cars detected:')
    subplot(1, 2, 1), imagesc(imgOrig), title('Original image')
    hold on;
    %Display the first box
    rectangle('Position', [min_c1, min_r1, max_c1-min_c1, max_r1-min_r1], 'EdgeColor', [1, 0, 0])
    %Display the second box
    rectangle('Position', [min_c2, min_r2, max_c2-min_c2, max_r2-min_r2], 'EdgeColor', [1, 0, 0])
    %Display the centroids
    plot(xc1,yc1,'*r'), plot(xc2,yc2,'*r')
    hold off;
 
    subplot(1, 2, 2), imagesc(seg), colormap gray, title('Segmented image')
    hold on;
    %Display the first box
    rectangle('Position', [min_c1, min_r1, max_c1-min_c1, max_r1-min_r1], 'EdgeColor', [1, 0, 0])
    %Display the second box
    rectangle('Position', [min_c2, min_r2, max_c2-min_c2, max_r2-min_r2], 'EdgeColor', [1, 0, 0])
    %Display the centroids
    plot(xc1,yc1,'*r'), plot(xc2,yc2,'*r')
    hold off;
end
end