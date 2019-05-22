clc;
clear all;
close all;

I1 = imread('../imagesHomog/SET5_01.jpg'); % put the first image here
I2 = imread('../imagesHomog/SET5_03.jpg'); % put the second image here

%Number of points to be selected
N = 8;

disp('Choose 8 points...');
figure, imshow(I1), title('Select 8 points'), hold on;
X1 = zeros(N,2);
for i = 1 : N
    X1(i,:) = ginput(1);
    plot(X1(i,1), X1(i,2), 'sr');
    text(X1(i,1)-20, X1(i,2)-20, sprintf('%d',i));
end

disp('Choose the corresponding 8 points on the other image ...');
figure, imshow(I2), title('Select 8 points'), hold on;
X2 = zeros(N,2);
for i = 1 : N
    X2(i,:) = ginput(1);
    plot(X2(i,1), X2(i,2), 'sr');
    text(X2(i,1)-20, X2(i,2)-20, sprintf('%d',i));
end
P = [X1'; X2'];

%Threshold to distinguish between inliers and outliers
th = 3;
[bestH, consensus, outliers]=ransacH(P, th);

% inverse mapping
I3 = inverseMapping(I1, bestH);
figure, imshow(uint8(I3)), title('Inverse mapping');

Im = (double(I2)+double(I3))/2.;
figure, imshow(uint8(Im)), title('Average image');



