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

%First template evaluation
%Top-left vertex
xvl = 685; 
yvl = 352;
%Bottom-right vertex
xvu = 774;
yvu = 430;

compTime(yvl, yvu, xvl, xvu, img1 );

%Second template evaluation
%Top-left vertex
xvl = 675; 
yvl = 342;
%Bottom-right vertex
xvu = 784;
yvu = 440;

compTime(yvl, yvu, xvl, xvu, img1 );

%Third template evaluation
%Top-left vertex
xvl = 665; 
yvl = 332;
%Bottom-right vertex
xvu = 794;
yvu = 450;

compTime(yvl, yvu, xvl, xvu, img1 );

