function F = EightPointsAlgorithmN(P1, P2)

%Normalize the points
[nP1, T1] = normalise2dpts(P1);
[nP2, T2]=normalise2dpts(P2);

%Number of correspondences
N = size(P1,2);

%% Fill the A matrix line by line
A = zeros(N,9);
for ii = 1 : N
   temp1 = nP2(1,ii) .* nP1(:,ii)';
   temp2 = nP2(2,ii) .* nP1(:,ii)';
   temp3 = nP2(3,ii) .* nP1(:,ii)';
    
   A(ii, :) = [temp1 temp2 temp3]; 
end

%% Select the solution
%Decompose the A matrix using SVD
[U, D, V] = svd( A );
%Compute the solution of the homogenous system
f = V(:,9);
%Reshape f in a 3x3 matrix
F = reshape(f, [3,3]);
F = F';

%% Correct F
%Decompose the F matrix using SVD
[U, D, V] = svd( F );
D(3,3) = 0;
F = U * D * V';

%% Denormalization
F = T2' * F * T1;

end