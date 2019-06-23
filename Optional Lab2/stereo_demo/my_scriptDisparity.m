% UNCOMMENT THE APPROPRIATE SLICE OF CODE TO TEST NEW EXAMPLES

% I1=imread('stereo_pairs/rds_L.jpg'); 
% I2=imread('stereo_pairs/rds_R.jpg'); 
% d=[-6 10];

% I1=imread('stereo_pairs/parkmeter.l.jpg'); 
% I2=imread('stereo_pairs/parkmeter.r.jpg'); 
% d=[2 18];

% I1=imread('stereo_pairs/corridor_l_original.jpg'); 
% I2=imread('stereo_pairs/corridor_r_original.jpg'); 
% d=[2 18];

 I1=imread('../stereo_pairs/Dino_L.png'); 
 I2=imread('../stereo_pairs/Dino_R.png'); 
 d=[-32 16];


if (size(I1,3)==3)
  I1=rgb2gray(I1);
  I2=rgb2gray(I2);
end

% Display the images after rectification.
figure; imshowpair(I1,I2,'ColorChannels','red-cyan');
title('Images');

W = 12;

[disparityMap, consistency] = my_disparity_final(I1, I2, W, d(1), d(2)); 

marker_idx = (disparityMap == -realmax('single'));
disparityMap(marker_idx) = min(disparityMap(~marker_idx));
 
% Show the disparity map. Brighter pixels indicate objects which are
% closer to the camera.
figure; imshow(mat2gray(disparityMap));
colormap jet; colorbar;