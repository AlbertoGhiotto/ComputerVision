function filtered = medianFilt(preFilt, side, imgShow)

filtered = medfilt2(preFilt,[side,side]);

if(imgShow)
    figure, subplot(2, 2, 1), imagesc(preFilt),colormap gray, title('Pre-filter image');
    subplot(2, 2, 2), imagesc(filtered),colormap gray, title(['Median filtered image ', num2str(side), 'x', num2str(side)]);
    subplot(2, 2, 3), imhist(uint8(preFilt), 256), title('Pre-filter histogram');
    subplot(2, 2, 4), imhist(uint8(filtered), 256), title('Filtered histogram');
end
end