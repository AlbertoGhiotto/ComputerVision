function filtered = movAverFilt(preFilt, side, imgShow)

K = ones(side)/(side*side);
filtered = conv2(preFilt, K, 'same');

%figure,plot(A(40,:),'r'),hold on,plot(outc(40,:),'b'),plot(outm(40,:),'g')

if(imgShow)
    figure, subplot(2, 2, 1), imagesc(preFilt),colormap gray, title('Pre-filter image');
    subplot(2, 2, 2), imagesc(filtered),colormap gray, title(['Moving average filtered image ', num2str(side), 'x', num2str(side)]);
    subplot(2, 2, 3), imhist(uint8(preFilt), 256), title('Pre-filter histogram');
    subplot(2, 2, 4), imhist(uint8(filtered), 256), title('Filtered histogram');
    
    figure, subplot(1, 2, 1), imagesc(K), title(['Moving average filter (', num2str(side), 'x', num2str(side), ')']);
    subplot(1, 2, 2), surf(K), title(['Moving average filter (', num2str(side), 'x', num2str(side), ')']);
end
end