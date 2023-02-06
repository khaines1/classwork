Image = imread('chestXray-dark.tif');
%figure,subplot(1,2,1);imshow(Image)
%subplot(1,2,2);imhist(Image)

%Histogram equilization
imeq = histeq(Image);
%figure,subplot(1,2,1);imshow(imeq)
%subplot(1,2,2);imhist(imeq)

%gama
gamma=0.5;
j=imadjust (imeq,[],[],gamma);
%figure,subplot(1,2,1);imshow(j)
%subplot(1,2,2);imhist(j)
%figure; imshow(j); title('clear x-ray');
figure; imshowpair(Image,j,'montage');
title('clear x-ray')

