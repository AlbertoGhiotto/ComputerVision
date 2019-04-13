function dispCBB(mask, imgOrig, doPlot)

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
    subplot(1,2,1), imagesc(imgOrig), colormap hsv,  title('Original image')
    hold on
    plot(mX1,mY1,'*g');
    plot(mX2,mY2,'*g');
    rectangle('Position', [minX1, minY1, maxX1-minX1, maxY1-minY1], 'EdgeColor', [0, 1, 0]);
    rectangle('Position', [minX2, minY2, maxX2-minX2, maxY2-minY2], 'EdgeColor', [0, 1, 0]); 
    subplot(1,2,2), imagesc(mask),    colormap gray,  title('Segmented image')
    hold on
    plot(mX1,mY1,'*g');
    plot(mX2,mY2,'*g');
    rectangle('Position', [minX1, minY1, maxX1-minX1, maxY1-minY1], 'EdgeColor', [0, 1, 0]);
    rectangle('Position', [minX2, minY2, maxX2-minX2, maxY2-minY2], 'EdgeColor', [0, 1, 0]);
end
end