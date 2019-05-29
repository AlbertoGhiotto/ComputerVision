function [] = checkEpipConstr(P1, P2, F1, F2)

epipCons = zeros(1, length(P1));
epipConsNorm = zeros(1, length(P1));

for i=1:length(P1) %For all the points...
    %... check the epipolar constraint
    epipCons(1, i) = (P2(:, i)') * F1 * P1(:, i); %without normalization
    epipConsNorm(1, i) = (P2(:, i)') * F2 * P1(:, i); %with normalization
end

threshold = 0.07;
if(abs(epipCons) <= threshold)
   disp('The epipolar constraint (without norm) is respected'); 
else
    disp('The epipolar constraint (without norm) is NOT respected');
end


if(abs(epipConsNorm(i)) <= (1 + threshold))
   disp('The epipolar constraint (with norm) is respected'); 
else
    disp('The epipolar constraint (with norm) is NOT respected');
end


end