<<<<<<< HEAD
close all;

img1 = imread('ur_c_s_03a_01_L_0376.png', 'png');
img2 = imread('ur_c_s_03a_01_L_0377.png', 'png');
img3 = imread('ur_c_s_03a_01_L_0378.png', 'png');
img4 = imread('ur_c_s_03a_01_L_0379.png', 'png');
img5 = imread('ur_c_s_03a_01_L_0380.png', 'png');
img6 = imread('ur_c_s_03a_01_L_0381.png', 'png');

doPlot = false;

if (doPlot)
   figure, imagesc(img1), title('Original Image') 
   figure, imagesc(img2), title('Original Image')
   figure, imagesc(img3), title('Original Image')
   figure, imagesc(img4), title('Original Image')
   figure, imagesc(img5), title('Original Image')
   figure, imagesc(img6), title('Original Image')
end

img_hsv = convertAndShow(img1, doPlot);
convertAndShow(img2, doPlot);
convertAndShow(img3, doPlot);
convertAndShow(img4, doPlot);
convertAndShow(img5, doPlot);
convertAndShow(img6, doPlot);


prova = img_hsv(:,:,1);
sky_rect = img_hsv(30:185, 573:728,1);

%% Color segmentation

%Coordinates of the two opposite vertices of the reference rectangle in 
%which to detect the mean hue value and it standard deviation
%Upper-left vertex
xvl = 705; 
yvl = 380;
%Bottom-right vertex
xvu = 716;
yvu = 401;

%Identify mean value and standard deviation of the hue values in the chosen
%region
%hue = hue_id2(img_hsv, xvl, yvl, xvu, yvu)
[hue, sigma] = hue_id(img_hsv, xvl, yvl, xvu, yvu);
%Segmentation of the image based on the desired hue value and the standard
%deviation
figure
mask = img_seg(img1, hue, sigma, true);
getframe;
mask = img_seg(img2, hue, sigma, true);
getframe;
mask = img_seg(img3, hue, sigma, true);
getframe;
mask = img_seg(img4, hue, sigma, true);
getframe;
mask = img_seg(img5, hue, sigma, true);
getframe;
mask = img_seg(img6, hue, sigma, true);

=======
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

% Print the original (main)image
figure, imagesc(img1), title('Original image')

%% Part 1 - Display the images with the different color domains

convertAndShow(img1, imgShow);
convertAndShow(img2, imgShow);
convertAndShow(img3, imgShow);
convertAndShow(img4, imgShow);
convertAndShow(img5, imgShow);
convertAndShow(img6, imgShow);

%% Part 2 - Select red car area and compute mean and standard deviation
%Coordinates of the two opposite vertices of the reference rectangle in 
%which to detect the mean hue value and it standard deviation

%Upper-left vertex
xvl = 705; 
yvl = 380;
%Bottom-right vertex
xvu = 716;
yvu = 401;

[hue, sd] = hueID(img1, xvl, yvl, xvu, yvu, imgShow);

%% Part 3 - Segment all the other images using 'm' and 'sd'

imgShow = false; %Unnecessary at this stage
is1 = colorSeg(img1, hue, sd, imgShow);
is2 = colorSeg(img2, hue, sd, imgShow);
is3 = colorSeg(img3, hue, sd, imgShow);
is4 = colorSeg(img4, hue, sd, imgShow);
is5 = colorSeg(img5, hue, sd, imgShow);
is6 = colorSeg(img6, hue, sd, imgShow);

%% Part 4 - Display centroid and bounding box in the segmented images

imgShow = true; %Final result of red car detection
dispCBB(is1, img1, imgShow);
dispCBB(is2, img2, imgShow);
dispCBB(is3, img3, imgShow);
dispCBB(is4, img4, imgShow);
dispCBB(is5, img5, imgShow);
dispCBB(is6, img6, imgShow);


%% Comparison for lab 5

t = cputime;
imgShow = false; %Unnecessary at this stage
is1 = colorSeg(img1, hue, sd, imgShow);
[mX,mY] = dispCBB(is1, img1, imgShow);
e = (cputime - t);
X = sprintf(['The computational time is %d'], e);
disp(X);
X = sprintf(['The pixel found is [', num2str(mX), ',', num2str(mY),']']);
disp(X)
>>>>>>> master
