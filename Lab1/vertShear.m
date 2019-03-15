function imgVertSheared = vertShear(imgGray, sv)

%Dimensions of the image
[rr,cc]=size(imgGray);

[X, Y] = meshgrid(1 : cc, 1 : rr);
%Inverse of the transformation
Xc = X - sv * Y;
Yn = Y;
%Center the image
Xn = Xc + sv * rr / 2;

%Interpolation
imgVertSheared = griddata(X,Y,double(imgGray),Xn,Yn,'linear');

end