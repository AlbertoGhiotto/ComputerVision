function imgHorizSheared = horizShear(imgGray, sh, imgShow)

%Dimensions of the image
[rr,cc]=size(imgGray);

[X, Y] = meshgrid(1 : cc, 1 : rr);
%Inverse of the transformation
Xn = X;
Yc = Y - sh * X;
%Center the image
Yn = Yc + sh * cc / 2;

%Interpolation
imgHorizSheared = griddata(X,Y,double(imgGray),Xn,Yn,'linear');

if(imgShow)
    figure,imagesc(imgHorizSheared),colormap gray, title('Shear (horizontal)')
end

end