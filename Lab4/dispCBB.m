<<<<<<< HEAD
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
=======
function [mX2,mY2] = dispCBB(mask, imgOrig, doPlot)

%Label the image to find connected elements
L = bwlabel(mask, 8);

%Car1
%Finding centroid coordinates
[rr, cc] = find(L == 1);
mY1 = mean(rr);
mX1 = mean(cc);
%Finding bounding box coordinates
minY1 = min(rr);
minX1 = min(cc);
maxY1 = max(rr);
maxX1 = max(cc);

%Car2
%The same as before
[rr, cc] = find(L == 2);
mY2 = mean(rr);
mX2 = mean(cc);

minY2 = min(rr);
minX2 = min(cc);
maxY2 = max(rr);
maxX2 = max(cc);


%% Plot
if(doPlot) 
    figure, sgtitle('Red car detection')
    subplot(1,2,1), imagesc(imgOrig), colormap hsv,  title('Original image')
    hold on
    plot(mX1,mY1,'*g');
    plot(mX2,mY2,'*g');
    rectangle('Position', [minX1, minY1, maxX1-minX1, maxY1-minY1], 'EdgeColor', [0, 1, 0]);
    rectangle('Position', [minX2, minY2, maxX2-minX2, maxY2-minY2], 'EdgeColor', [0, 1, 0]);
    hold off;
    subplot(1,2,2), imagesc(mask),    colormap gray,  title('Segmented image')
    hold on
    plot(mX1,mY1,'*g');
    plot(mX2,mY2,'*g');
    rectangle('Position', [minX1, minY1, maxX1-minX1, maxY1-minY1], 'EdgeColor', [0, 1, 0]);
    rectangle('Position', [minX2, minY2, maxX2-minX2, maxY2-minY2], 'EdgeColor', [0, 1, 0]);
    hold off;
end
>>>>>>> master
end