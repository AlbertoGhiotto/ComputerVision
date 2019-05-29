function [bestF, consensus, outliers]=ransacF(P, th)
    ii = 0;
    iter = 100;
    N = size(P, 2);
    sin = [P(1:2, :); ones(1, N)];
    des = [P(3:4, :); ones(1, N)];
    bestF = zeros(3, 3);
    bestNInlier = 0;
    p = 0.999;
    consensus = [];
    outliers = [];
    while ii < iter
        perm = randperm(N);
        M = P(:, perm(1:8)); % select 8 random pairs
        X1 = [M(1:2, :); ones(1, 8)];
        X2 = [M(3:4, :); ones(1, 8)];
        F = EightPointsAlgorithm(X1, X2);
        residuals = testF(F, sin, des);
        nInlier = sum(residuals < th) / N; % current estimated inliers
        if(nInlier > bestNInlier) % if number of inliers grows
           bestNInlier = nInlier; % update of the fly the probability of having inliers
           bestF = F; % update the best fundamental matrix
           consensus = P(:, residuals < th); % inliers
           outliers = P(:, residuals >= th); % outliers
           iter = log(1 - p) / log(1 - bestNInlier.^8); % update the number of iterations needed
        end
        ii = ii + 1;
    end  
end


function [residual] = testF(F, sin, des)
    N = size(sin, 2);
    residual = zeros(N,1);
    for i = 1 : N
        %Epipolar line parameter
        L = F * sin(:,i);
        a = L(1);
        b = L(2);
        c = L(3);
        %Distance between points and the line
        residual(i) = abs( a * des(1,i) + b * des(2,i) + c ) / sqrt( a^2 + b^2 );
    end
end