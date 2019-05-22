function [I2] = inverseMappingNoBI(I1, H)

I2 = zeros(size(I1));

for rr=1:size(I1,1)
    for cc=1:size(I1,2)
        
        coords = inv(H)*[cc rr 1]';
        
        coords = coords./coords(3);
        new_row = coords(2);
        new_col = coords(1);

        x = round(new_col);
        y = round(new_row);
        
        if ( y > 0) && (y < size(I1,1)) && (x > 0) && (x < size(I1,2))
            I2(rr,cc,:) = I1(y,x,:);
        end
    end
end