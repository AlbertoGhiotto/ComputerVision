function [mean_hue, sigma] = hue_id2(img_hsv, xvl, yvl, xvu, yvu)

%Consider only the hue values of the region of interest in the image
red_rectangle = img_hsv(yvl:yvu, xvl:xvu, 1);
[rr,cc] = size(red_rectangle); 

sumsin = 0.0;
sumcos = 0.0;

for ii = 1 : rr
    for jj = 1 : cc
        value = red_rectangle(ii,jj);
        value = value/(1-0)*(3.14-0)+0;
        sumsin = sumsin + sin( value );
        sumcos = sumcos + cos( value );
    end
end
mean_hue = atan2(sumsin, sumcos);
mean_hue = mean_hue/(3.14-0)*(1-0)+0;

end