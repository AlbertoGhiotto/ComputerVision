function [D, consistency] = my_disparity_final(I1,I2, W, dmin, dmax)

midW = round(W/2);

% Compute left-right disparity
Dlr = my_disparity(I1,I2, W, dmin, dmax);
Drl = my_disparity(I2,I1, W, -dmax, -dmin);
% Compute right-left disparity
% Drl = my_disparity_rl(I1,I2, W, dmin, dmax);

% Consistency between disparity maps from left to right and from right to
% left
consistency = ones(size(Dlr));

% for i = ( 1 + midW ) : ( size(I1, 1) - midW )
%     for j = (1 + midW) : ( size(I1, 2) - midW ) 
for i = 1 : size(I1, 1)
    for j = 1 : size(I1, 2) 
        %Is important to check only the pixel which have been filled by the
        %function my_disparity
        if( j+Dlr(i,j) >= dmax+midW+1 && j+Dlr(i,j) <= size(I2,2)+dmin-midW)
            if(Dlr(i,j) ~= -Drl(i,j+Dlr(i,j)))
                consistency(i,j) = 0;
            end
        end
    end
end

D = Drl;

end