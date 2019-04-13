function dispCBB(seg, doPlot)

prop = regionprops(seg, 'Area','Centroid','BoundingBox');
xc=floor(prop(1).Centroid(1));
yc=floor(prop(1).Centroid(2));
ul_corner_width=prop(1).BoundingBox;

%To display the results
if(doPlot)
    figure,imagesc(seg),colormap gray,title('detected object')
    hold on
    plot(xc,yc,'*r')
    rectangle('Position',ul_corner_width,'EdgeColor',[1,0,0])
end

end