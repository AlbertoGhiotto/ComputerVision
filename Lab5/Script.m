close all;

% To print or not the images
imgShow = true;

% Load all the images form the memory
img1 = imread('ur_c_s_03a_01_L_0376.png', 'png');
img2 = imread('ur_c_s_03a_01_L_0377.png', 'png');
img3 = imread('ur_c_s_03a_01_L_0378.png', 'png');
img4 = imread('ur_c_s_03a_01_L_0379.png', 'png');
img5 = imread('ur_c_s_03a_01_L_0380.png', 'png');
img6 = imread('ur_c_s_03a_01_L_0381.png', 'png');


%% Part 1 (Template matching)

%First template selection
%Top-left vertex
xvl = 685; 
yvl = 352;
%Bottom-right vertex
xvu = 774;
yvu = 430;

%Convert to gray scale
img1gray = rgb2gray(img1);
%Take the part of the image of interest
template = img1gray(yvl:yvu, xvl:xvu, :);
figure, imagesc(template), title('Template [89x78]'), colormap gray

corrDetection(img1, template, imgShow);
corrDetection(img2, template, imgShow);
corrDetection(img3, template, imgShow);
corrDetection(img4, template, imgShow);
corrDetection(img5, template, imgShow);
corrDetection(img6, template, imgShow);


%% Part 2 (Computational comparisons)

%Start a timer
t = cputime;
corrDetection(img1, template, imgShow);
%Time elapsed
e = cputime - t;
X = sprintf('The computational time for a template 89x78 is %d', e);
disp(X);

%Second template selection
%Upper-left vertex
xvl = 675; 
yvl = 342;
%Bottom-right vertex
xvu = 784;
yvu = 440;
template = img1gray(yvl:yvu, xvl:xvu, :);
figure, imagesc(template), title('Template [109x98]'), colormap gray

%Start a timer
t = cputime;
corrDetection(img1, template, imgShow);
%Time elapsed
e = cputime - t;
X = sprintf('The computational time for a template 109x98 is %d', e);
disp(X);

% corrDetection(img2, template, imgShow);
% corrDetection(img3, template, imgShow);
% corrDetection(img4, template, imgShow);
% corrDetection(img5, template, imgShow);
% corrDetection(img6, template, imgShow);

%Third template selection
%Upper-left vertex
xvl = 665; 
yvl = 332;
%Bottom-right vertex
xvu = 794;
yvu = 450;
template = img1gray(yvl:yvu, xvl:xvu, :);
figure, imagesc(template), title('Template [129x118]'), colormap gray

%Start a timer
t = cputime;
corrDetection(img1, template, imgShow);
%Time elapsed
e = cputime - t;
X = sprintf('The computational time for a template 129x118 is %d', e);
disp(X);

% corrDetection(img2, template, imgShow);
% corrDetection(img3, template, imgShow);
% corrDetection(img4, template, imgShow);
% corrDetection(img5, template, imgShow);
% corrDetection(img6, template, imgShow);