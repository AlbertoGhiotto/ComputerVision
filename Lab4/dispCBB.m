function [min_r,max_r,min_c,max_c] = dispCBB(seg, doPlot)

%Label the image to find connected elements
[lab,numLab] = bwlabel(seg, 8);

car1 = 0; %Label of first car
car2 = 0; %Label of second car
%numLab = max(lab(:)); %Number of objects detected

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
    %Segmented image
    %figure('units','normalized','outerposition',[0 0 1 1]); %Open the image full screen
    figure, imagesc(seg), colormap gray, title('Red cars detected')
    hold on;
    %Find vertex for rectangle 1
    [r, c] = find(lab == car1);
    min_r = min(r);
    max_r = max(r); 
    min_c = min(c);
    max_c = max(c);
    %Find coordinates of the first centrode
    xc = floor((min_c+max_c)/2);
    yc = floor((min_r+max_r)/2);
    %Display the first box
    plot(xc,yc,'*r');
    rectangle('Position', [min_c, min_r, max_c-min_c, max_r-min_r], 'EdgeColor', [1, 0, 0]);

    %Find vertex for rectangle 2
    [r, c] = find(lab == car2);
    min_r = min(r);
    max_r = max(r); 
    min_c = min(c);
    max_c = max(c);
    %Find coordinates of the second centrode
    xc = floor((min_c+max_c)/2);
    yc = floor((min_r+max_r)/2);
    %Display the second box
    plot(xc,yc,'*r');
    rectangle('Position', [min_c, min_r, max_c-min_c, max_r-min_r], 'EdgeColor', [1, 0, 0]);
end
end