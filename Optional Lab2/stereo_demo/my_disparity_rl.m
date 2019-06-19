function D = my_disparity_rl(I1,I2, W, dmin, dmax)

midW = round(W/2);

%Matrix containing the disparity for each pixel
D = zeros( size(I2) );
% For each pixel in I1
for i = ( 1 + midW ) : ( size(I2, 1) - midW )
    for j = (1 + midW) : ( size(I2, 2) - midW ) 
        if( (j+dmin-midW) > 1 && (j+dmax+midW) < size(I1,2))
            % Select a patch of size W around (i,j) in I1
            N2 = I2( (i-midW) : (i+midW), (j-midW) : (j+midW) );
            % Array containing the SSD distance for each disparity in the range
            SSD = zeros(1, (dmax - dmin) );
            % For each disparity in the range
            for d = dmin : dmax 
                % Select a patch of size W around (i,j+d) in I1
                N1 = I1( (i-midW) : (i+midW), (j + d - midW) : (j + d + midW) );
                SSD(d-dmin+1) = my_ssd(N1,N2);
            end
            % Assign to D(i,j) the index corresponding to the maximum value of SSD  
            [~, index] = max(SSD);
            D(i,j) = index + dmin;
        end
    end
end
    
end