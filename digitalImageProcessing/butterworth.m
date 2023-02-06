clear; close all;
Image=im2double(imread('blood.tif'));
[M,N]=size(Image);
figure;imshow(Image); 
title('Orginal Image');

% DFT transformation
Image_FD=fft2(Image);
% shift
Image_FD=fftshift(Image_FD);

% DFT with padding 
Image_FD=fft2(Image,2*M, 2*N);

%% 2a third order Butterworth high pass
[U,V]=meshgrid(-N:1:N-1,-M:1:M-1);
Do=30;
order=3;%third order
D=sqrt(U.^2+V.^2);
   
% high pass filter design
BW_HPF=1./(1+(Do./D).^(2*order));
% shift
BW_HPF=ifftshift(BW_HPF);
% inverse DFT to spatial domain
Image_R=ifft2(BW_HPF.*Image_FD);
Image_HP=Image_R(1:M, 1:N);
figure; imshow(abs(Image_HP),[]);colorbar;
title('2a: Butterwoth high pass');

%% 2b Low Pass then High pass Butterworths
[U,V]=meshgrid(-N:1:N-1,-M:1:M-1);
Do=60;
order=3;%third order
D=sqrt(U.^2+V.^2);
% low pass filter design
BW_LPF=1./(1+(D/Do).^(2*order));
% shift
BW_LPF=ifftshift(BW_LPF);
% inverse DFT to spatial domain
Image_R=ifft2(BW_LPF.*Image_FD);
Image_LP=Image_R(1:M, 1:N);
%High pass filter
Do=30;
BW_HPF=1./(1+(Do./D).^(2*order));
% DFT of low pass with padding 
Image_FDLP=fft2(Image_LP,2*M, 2*N);
%shift
BW_HPF=ifftshift(BW_HPF);
% inverse DFT to spatial domain
Image_R=ifft2(BW_HPF.*Image_FDLP);
Image_HP=Image_R(1:M, 1:N);
figure; imshow(abs(Image_HP),[]);colorbar;
title('2b: Butterworth low/high');
% mean square error
err = immse(Image_HP,Image);
fprintf('MSE for 2b = %.4f \n', err);

%% 2c Combining low and High pass BW. filters
[U,V]=meshgrid(-N:1:N-1,-M:1:M-1);
D=sqrt(U.^2+V.^2);
LDo=60;
HDo=30;
order=3;%third order
% filter design
BW_LPF=1./(1+(D/LDo).^(2*order));
BW_HPF=1./(1+(HDo./D).^(2*order));
%element by element multiplication of low and high pass filters 
Image_Filter=BW_LPF.*BW_HPF;
% shift
Image_Filter=ifftshift(Image_Filter);
% inverse DFT to spatial domain
Image_HLP=ifft2(Image_Filter.*Image_FD);
Image_R=Image_HLP(1:M, 1:N);

figure; imshow(abs(Image_R),[]);colorbar;
title('2c: Butterworth low/high');

% mean square error
err = immse(Image_R,Image);
fprintf('MSE for 2c = %.4f \n', err);
