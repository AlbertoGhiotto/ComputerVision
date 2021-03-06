function [answer, maxerror] = checkEpConstraint(P1, P2, F)
%% This function return false if the epipolar constraint doesn't hold for some points

N = size(P1, 2);
answer = true;
th = 0.1;
maxerror = 0; %For calibration of th purpose

%Check the epipolar constraint for each point (th threshold of tolerance)
for ii = 1 : N
    result = P2(:,ii)' * F * P1(:,ii);
    if abs(result) > th
        answer = false;
        maxerror = abs(result);
        break;
    end
    if abs(result) > maxerror
        maxerror = abs(result);
    end
end

end