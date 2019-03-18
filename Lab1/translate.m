function imgTranslated = translate(imgGray, tx, ty, imgShow)

%Dimensions of the image
[rr,cc]=size(imgGray);

[X, Y] = meshgrid(1 : cc, 1 : rr);
%Inverse of the transformation
Xn = X - tx;
Yn = Y - ty;

%Interpolation
imgTranslated = griddata(X,Y,double(imgGray),Xn,Yn,'linear');

if(imgShow)
    figure,imagesc(imgTranslated),colormap gray, title('Backward translation')
end

end