function imgRotated = rotate(imgGray, theta)

%Dimensions of the image
[rr,cc]=size(imgGray);

%Indeces of the centre of the image
midX = (cc + 1) / 2;
midY = (rr + 1) / 2;

[X, Y] = meshgrid(1 : cc, 1 : rr);
%Inverse of the transformation
Xc = (X - midX) * cos(theta) + (Y - midY) * sin(theta);
Yc = -(X - midX) * sin(theta) + (Y - midY) * cos(theta);
%Re-center the image 
Xn = Xc + midX;
Yn = Yc + midY;

%Interpolation
imgRotated = griddata(X,Y,double(imgGray),Xn,Yn,'linear');

end