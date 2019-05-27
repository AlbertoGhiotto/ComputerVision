%% Load the two sets of corresponding points 

%Load the first set of points
P = load('Mire/Mire1.points')';
P1 = [P; ones(1, length(P))];

%Load the second set of points
P = load('Mire/Mire2.points')';
P2 = [P; ones(1, length(P))];

%Load the two images
img1 = imread('Mire/Mire1.pgm');
img2 = imread('Mire/Mire2.pgm');

%% Estimate the fundamental matrix

F1 = EightPointsAlgorithm(P1, P2);
F2 = EightPointsAlgorithmN(P1, P2);

%% Visualize the results and estimate F

%Check (P2'*F*P1 = 0) holds for all points (both with and without normalization)
disp('EPIPOLAR CONSTRAINT CHECKING WITH ORIGINAL POINTS');
checkEpipConstr(P1, P2, F1, F2);

%Visualize the stereo pairs with epipolar lines of the corresponding points 
visualizeEpipolarLines(img1, img2, F1, P1(1:2, :)', P2(1:2, :)');

%Finding the epipoles
[U, W, V] = svd(F1);
left_epip = V(:, length(V));
right_epip = U(:, length(U));

%% OPTIONAL
%Generate some random points 
maxRow = 576; 
maxCol = 768;
nPt = 5; %Number of invented points
P1err = [floor(maxCol .* rand([1, nPt]) + 1); floor(maxRow .* rand([1, nPt]) + 1); ones(1, nPt)];
P2err = [floor(maxCol .* rand([1, nPt]) + 1); floor(maxRow .* rand([1, nPt]) + 1); ones(1, nPt)];

%Add the invented points to the correpondences
P1err = [P1 P1err];
P2err = [P2 P2err];

%Estimate the new fundamental matrix
F1err = EightPointsAlgorithm(P1err, P2err);
F2err = EightPointsAlgorithmN(P1err, P2err);

%Check epipolar constraint with the invented points
disp('EPIPOLAR CONSTRAINT CHECKING WITH INVENTED POINTS:');
checkEpipConstr(P1err, P2err, F1err, F2err);
