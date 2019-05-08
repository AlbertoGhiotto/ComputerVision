function compTime(yvl, yvu, xvl, xvu, img )

imgShow = false;
imgGray = rgb2gray(img);

template = imgGray(yvl:yvu, xvl:xvu);
x = abs(xvl-xvu);
y = abs(yvl-yvu);
% figure, imagesc(template), title(['Template [', num2str(x) , 'x' , num2str(y) , ']']), colormap gray

%Start a timer
N = 10;

t = cputime;

 for i=1:N  % Make N cycle and average the result in order to have more precision
     corrDetection(img, template, imgShow);
 end
     
%Time elapsed
e = (cputime - t)/N;
X = sprintf(['The computational time for a template ', num2str(x) , 'x' , num2str(y) , ' is %d'], e);
disp(X);


end

