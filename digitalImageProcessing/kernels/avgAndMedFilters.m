Image = imread('rice.png');
%3x3 average
kernelSize = 3;
kernel = ones(kernelSize, kernelSize) / kernelSize ^ 2;
newImage = imfilter(Image, kernel, 'same');
figure; imshowpair(Image,newImage,'montage');
title('3x3 Average');
err = immse(newImage, Image);
fprintf('\n The mean-squared error F1 is %0.4f\n', err);
%9x9 average
kernelSize = 9;
kernel = ones(kernelSize, kernelSize) / kernelSize ^ 2;
newImage = imfilter(Image, kernel, 'same');
figure; imshowpair(Image,newImage,'montage');
title('9x9 Average');
err = immse(newImage, Image);
fprintf('\n The mean-squared error F2 is %0.4f\n', err);
%3x3 Median
newImage=medfilt2(Image,[3,3]); 
figure; imshowpair(Image,newImage,'montage');
title('3x3 Median')
err = immse(newImage, Image);
fprintf('\n The mean-squared error F3 is %0.4f\n', err);
%9x9 Median
newImage=medfilt2(Image,[9,9]); 
figure; imshowpair(Image,newImage,'montage');
title('9x9 Median')
err = immse(newImage, Image);
fprintf('\n The mean-squared error F4 is %0.4f\n', err);