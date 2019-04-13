close all;

% To print or not the images
imgShow = false;

% Load all the images form the memory
img1 = imread('ur_c_s_03a_01_L_0376.png', 'png');
img2 = imread('ur_c_s_03a_01_L_0377.png', 'png');
img3 = imread('ur_c_s_03a_01_L_0378.png', 'png');
img4 = imread('ur_c_s_03a_01_L_0379.png', 'png');
img5 = imread('ur_c_s_03a_01_L_0380.png', 'png');
img6 = imread('ur_c_s_03a_01_L_0381.png', 'png');


% Print the original (main)image
%figure, imagesc(img1), title('Original image')

%% Part 1 - Display the images with the different color domains

convertAndShow(img1, imgShow);
convertAndShow(img2, imgShow);
convertAndShow(img3, imgShow);
convertAndShow(img4, imgShow);
convertAndShow(img5, imgShow);
convertAndShow(img6, imgShow);

%% Part 2 - Select red car area and compute mean and standard deviation

m = 0; %Mean 
sd = 0; %Standard deviation 

[m, sd] = paramArea(img1, imgShow);

%% Part 3 - Segment all the other images using 'm' and 'sd'

is1 = colorSeg(img1, m, sd, imgShow);
is2 = colorSeg(img2, m, sd, imgShow);
is3 = colorSeg(img3, m, sd, imgShow);
is4 = colorSeg(img4, m, sd, imgShow);
is5 = colorSeg(img5, m, sd, imgShow);
is6 = colorSeg(img6, m, sd, imgShow);

%% Part 4 - Display centroid and bounding box in the segmented images

dispCBB(is1, true);
dispCBB(is2, imgShow);
dispCBB(is3, imgShow); 
dispCBB(is4, imgShow);
dispCBB(is5, imgShow);
dispCBB(is6, imgShow);




