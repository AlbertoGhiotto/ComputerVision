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

%To display the results
if(doPlot)
    %Find vertex for rectangle 1
    [r1, c1] = find(lab == car1);
    min_r1 = min(r1);
    max_r1 = max(r1); 
    min_c1 = min(c1);
    max_c1 = max(c1);
    %Find coordinates of the first centrode
    xc1 = floor((min_c1+max_c1)/2);
    yc1 = floor((min_r1+max_r1)/2);
    
    %Find vertex for rectangle 2
    [r2, c2] = find(lab == car2);
    min_r2 = min(r2);
    max_r2 = max(r2); 
    min_c2 = min(c2);
    max_c2 = max(c2);
    %Find coordinates of the second centrode
    xc2 = floor((min_c2+max_c2)/2);
    yc2 = floor((min_r2+max_r2)/2);
    
    %Display all
    figure, sgtitle('Red cars detected in...')
    
    subplot(1, 2, 1), imagesc(imgOrig), title('...original image')
    hold on;
    %Display the first box
    plot(xc1,yc1,'*r')
    rectangle('Position', [min_c1, min_r1, max_c1-min_c1, max_r1-min_r1], 'EdgeColor', [1, 0, 0])
    %Display the second box
    plot(xc2,yc2,'*r')
    rectangle('Position', [min_c2, min_r2, max_c2-min_c2, max_r2-min_r2], 'EdgeColor', [1, 0, 0])
    hold off;
    
    subplot(1, 2, 2), imagesc(seg), colormap gray, title('...segmented image')
    hold on;
    plot(xc1,yc1,'*r')
    rectangle('Position', [min_c1, min_r1, max_c1-min_c1, max_r1-min_r1], 'EdgeColor', [1, 0, 0])
    plot(xc2,yc2,'*r')
    rectangle('Position', [min_c2, min_r2, max_c2-min_c2, max_r2-min_r2], 'EdgeColor', [1, 0, 0])
    hold off;
end
end