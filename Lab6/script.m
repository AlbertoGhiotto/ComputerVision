clear all

%% Load the two sets of corresponding points 

% %Load the first set of points
P1i = load("./Mire/mire1.points");
P2i = load("./Mire/mire2.points");

%Load the second set of points
I1 = imread("./Mire/mire1.pgm", "pgm");
I2 = imread("./Mire/mire2.pgm", "pgm");

% P1i = load("./Rubik/rubik1.points");
% P2i = load("./Rubik/rubik2.points");
% 
% I1 = imread("./Rubik/rubik1.pgm", "pgm");
% I2 = imread("./Rubik/rubik2.pgm", "pgm");

if size(P1i,2) ~= 2 || size(P2i,2) ~= 2 || size(P1i,1) ~= size(P2i,1)
    error('pts must be both Nx2');
end

N = size(P1i, 1);

P1 = [P1i'; ones(1,N)];
P2 = [P2i'; ones(1,N)];

%Compute the fundamental matrix in two different ways
F1 = EightPointsAlgorithm(P1,P2);
F2 = EightPointsAlgorithmN(P1,P2);

%% Evaluation
% Test the fact that the epipolar constraint holds
disp('EPIPOLAR CONSTRAINT CHECKING WITH ORIGINAL POINTS');
[answer1, maxerror1] = checkEpConstraint(P1, P2, F1);
if (answer1 == 0)
    disp('The epipolar constrain (without norm) is NOT respected');
else
    disp('The epipolar constrain (without norm) is respected'); 
end
[answer2, maxerror2] = checkEpConstraint(P1, P2, F2);
if (answer2 == 0)
    disp('The epipolar constraint (with norm) is NOT respected');
else
    disp('The epipolar constraint (with norm) is respected'); 
end

%Visualize the correspondences along with the epipolar lines
visualizeEpipolarLines(I1, I2, F1, P1i, P2i)
visualizeEpipolarLines(I1, I2, F2, P1i, P2i)

%% Compute epipoles

% F1
%Compute the right epipole
[U, D, V] = svd(F1);
Er1 = U(:,3);
%Compute the left epipole
El1 = V(:,3);

% F2
%Compute the right epipole
[U, D, V] = svd(F2);
Er2 = U(:,3);
%Compute the left epipole
El2 = V(:,3);


%% Adding erroneous points

%Number of random points to be generated
n = 3;
maxRow = size(I1, 1);
maxCol = size(I1, 2);

%Generate random points
Perr1 = [floor(maxCol .* rand([1, n]) + 1); floor(maxRow .* rand([1, n]) + 1); ones(1, n)];
Perr2 = [floor(maxCol .* rand([1, n]) + 1); floor(maxRow .* rand([1, n]) + 1); ones(1, n)];

%Concatenate the random points to the original ones
Perr1 = [P1 Perr1];
Perr2 = [P2 Perr2];

%Compute the fundamental matrix 
F3 = EightPointsAlgorithmN(Perr1,Perr2);

%Check the epipolar constraint
disp('EPIPOLAR CONSTRAINT CHECKING WITH INVENTED POINTS:');
[answer3, maxerror3] = checkEpConstraint(Perr1, Perr2, F3);
if (answer3 == 0)
    disp('The epipolar constraint (with norm, no Ransac) is NOT respected');
else
    disp('The epipolar constraint (with norm, no Ransac) is respected'); 
end

%Visualize the correspondences along with the epipolar lines
visualizeEpipolarLines(I1, I2, F3, P1i, P2i)

%% Ransac

%Concatenates the correspondences (real and not) without the ones
P = [Perr1(1:2,:); Perr2(1:2,:)];

%Threshold to consider a point inlier
th = 10;
%Compute the fundamental matrix using ransac
[bestF, consensus, outliers] = ransacF(P, th);

%Check the epipolar constraint
[answer4, maxerror4] = checkEpConstraint(P1, P2, bestF);
if (answer4 == 0)
    disp('The epipolar constrain (with norm + Ransac) is NOT respected');
else
    disp('The epipolar constrain (with norm + Ransac) is respected'); 
end

%Visualize the correspondences along with the epipolar lines
visualizeEpipolarLines(I1, I2, bestF, P1i, P2i);

%% MATLAB function estimateFundamentalMatrix

fRANSAC = estimateFundamentalMatrix(Perr1(1:2,:)',...
    Perr2(1:2,:)','Method','RANSAC',...
    'NumTrials',2000,'DistanceThreshold', 0.1);

visualizeEpipolarLines(I1, I2, fRANSAC, P1i, P2i);

[answer5, maxerror5] = checkEpConstraint(P1, P2, bestF);
if (answer5 == 0)
    disp('The epipolar constrain (with norm) is NOT respected');
else
    disp('The epipolar constrain (with norm) is respected'); 
end