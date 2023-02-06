clear; close all;
Image=imread('chestXray-dark.tif');
[M,N]=size(Image);
figure; imshow(Image);
title('Original Image');

[U,V]=meshgrid(-N:1:N-1,-M:1:M-1);
D = sqrt(U.^2 + V.^2);
% filter design
% Butterworth high pass filter
Do=0.1;
order=1;%third order
BW_HPF=1./(1+(Do./D).^(2*order));
% high emphasis filter
k1=0.5;
k2=0.75;
High_emp=k1+k2*BW_HPF; %High frequency emphasis filter
% DFT transformation with padding
Image_FD=fft2(Image,2*M,2*N);
% shift
High_emp=ifftshift(High_emp);
% multiplication 
Image_FD=High_emp.*Image_FD;
% inverse DFT to spatial domain
Image_R=uint8(ifft2(Image_FD));
Image_R=Image_R(1:M, 1:N);
% equalize histogram to enhance contrast
Image_R=histeq(Image_R);
figure; imshow(Image_R);
title('High Emphasis Filter');