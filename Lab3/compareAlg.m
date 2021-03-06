function compareAlg(imgOriginal, sd, sup, th, imgShow)

zc = edgeDetection(imgOriginal, sd, sup, th, false);
e = edge(imgOriginal, 'log');

%Display the results
if(imgShow)
    figure, sgtitle('Comparison')
    subplot(1, 2, 1), imagesc(zc), colormap gray, title({'"edgeDetection()" function'; ['with \sigma=', num2str(sd), 'and threshold=', num2str(th)]})
    subplot(1, 2, 2), imagesc(e), colormap gray, title('"edge()" function')
end

end