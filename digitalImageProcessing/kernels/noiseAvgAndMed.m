Image = imread('rice.png');
Im1 = imnoise(Image,'gaussian',0,0.25);
Im2 = imnoise(Image,"salt & pepper",0.35);

%3x3 average
kernelSize = 3;
kernel = ones(kernelSize, kernelSize) / kernelSize ^ 2;
newIm1 = imfilter(Im1, kernel, 'same');
figure; imshowpair(Im1,newIm1,'montage');
title('3x3 Average gaussian');
newIm2 = imfilter(Im2, kernel, 'same');
figure; imshowpair(Im2,newIm2,'montage');
title('3x3 Average salt & pepper');
err = immse(newIm1, Im1);
fprintf('\n The mean-squared error F1 is %0.4f\n', err);
err = immse(newIm2, Im2);
fprintf('\n The mean-squared error F2 is %0.4f\n', err);
%9x9 average
kernelSize = 9;
kernel = ones(kernelSize, kernelSize) / kernelSize ^ 2;
newIm1 = imfilter(Im1, kernel, 'same');
figure; imshowpair(Im1,newIm1,'montage');
title('9x9 Average gaussian');
newIm2 = imfilter(Im2, kernel, 'same');
figure; imshowpair(Im2,newIm2,'montage');
title('9x9 Average salt & pepper');
err = immse(newIm1, Im1);
fprintf('\n The mean-squared error F3 is %0.4f\n', err);
err = immse(newIm2, Im2);
fprintf('\n The mean-squared error F4 is %0.4f\n', err);
%3x3 Median
newIm1=medfilt2(Image,[3,3]); 
figure; imshowpair(Im1,newIm1,'montage');
title('3x3 Median gaussian');
newIm2=medfilt2(Im2,[3,3]); 
figure; imshowpair(Im2,newIm2,'montage');
title('3x3 Median salt & pepper');
err = immse(newIm1, Im1);
fprintf('\n The mean-squared error F5 is %0.4f\n', err);
err = immse(newIm2, Im2);
fprintf('\n The mean-squared error F6 is %0.4f\n', err);
%9x9 Median
newIm1=medfilt2(Image,[9,9]); 
figure; imshowpair(Im1,newIm1,'montage');
title('9x9 Median gaussian');
newIm2=medfilt2(Im2,[9,9]); 
figure; imshowpair(Im2,newIm2,'montage');
title('9x9 Median salt & pepper');
err = immse(newIm1, Im1);
fprintf('\n The mean-squared error F7 is %0.4f\n', err);
err = immse(newIm2, Im2);
fprintf('\n The mean-squared error F8 is %0.4f\n', err);