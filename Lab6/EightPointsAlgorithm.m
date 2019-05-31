function F = EightPointsAlgorithm(P1, P2)

%Number of correspondences
N = size(P1,2);

%% Fill the A matrix line by line
A = zeros(N,9);
for ii = 1 : N
   temp1 = P2(1,ii) .* P1(:,ii)';
   temp2 = P2(2,ii) .* P1(:,ii)';
   temp3 = P2(3,ii) .* P1(:,ii)';
    
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

end