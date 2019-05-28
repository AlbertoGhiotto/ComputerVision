function [F] = EightPointsAlgorithmN(P1, P2) 

%Normalize the points using the provided function
[nP1, T1] = normalise2dpts(P1);
[nP2, T2] = normalise2dpts(P2);

%Write down the matrix A
[coord, nPoints] = size(P1);
A = zeros(nPoints, 9);

%Fill the matrix A with the proper points
for i=1:nPoints
    A(i, 1) = P2(1, i)*P1(1, i);
    A(i, 2) = P2(1, i)*P1(2, i);
    A(i, 3) = P2(1, i);
    A(i, 4) = P2(2, i)*P1(1, i);
    A(i, 5) = P2(2, i)*P1(2, i);
    A(i, 6) = P2(2, i);
    A(i, 7) = P1(1, i);
    A(i, 8) = P1(2, i);
    A(i, 9) = 1;    
end

%Compute the SVD decomposition of A  
[U, D, V]= svd(A);

%Select as solution the last column of V
[vRow, vCol] = size(V);
f = V(:, vCol);

%Reshape column vector f so to obtain a matrix F 
F = reshape(f, [3, 3])';

%Use again svd to decompose the matrix
[U, D, V] = svd(F);

%Set D(3,3)=0
D(3, 3) = 0;

%Recompute the final F
F = U * D * V';

%De-normalize the resulting F 
F = (T2')*F*T1;

end