function imgRotTransl = rotoTransl(imgGray, theta, tx, ty, imgShow)

%Dimensions of the image
[rr,cc]=size(imgGray);

%Indexes of the centre of the image
midX = (cc + 1) / 2;
midY = (rr + 1) / 2;

[X, Y] = meshgrid(1 : cc, 1 : rr);
%Inverse of the transformation
Xc = (X - midX) * cos(theta) + (Y - midY) * sin(theta);
Yc = -(X - midX) * sin(theta) + (Y - midY) * cos(theta);
%Re-center the image 
Xn = Xc + midX - tx;
Yn = Yc + midY - ty;

%Interpolation
imgRotTransl = griddata(X,Y,double(imgGray),Xn,Yn,'linear');

if(imgShow)
    figure,imagesc(imgRotTransl),colormap gray, title('Rotation and translation in sequence')
end

end