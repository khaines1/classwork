
clear; close all; 
Image=im2double(imread('testpattern512.tif'));
[M,N]=size(Image);
figure;imshow(Image); 
title('Orginal Image');
%% 1a Ideal low pass filter
% DFT transformation
Image_FD=fft2(Image);

% DFT with padding 
Image_FD=fft2(Image,2*M, 2*N);

%Filter design 
[U,V] = meshgrid(-N:1:N-1,-M:1:M-1);
Uc=50; Vc=150; %cutoff frequency

U= U>-Uc & U<Uc;
V= V>-Vc & V<Vc ;

Ideal=U.*V;

% shift filter 
LP_Filter=ifftshift(Ideal);
%figure; mesh(U,V,LP_Filter);title ('ideal 2D low pass filter');

% multiplication 
Image_filtered=Image_FD.*LP_Filter;

% inverse DFT to spatial domain
Image_R=ifft2(Image_filtered);
%figure; imshow(Image_R,[]);title (['filtered image with cutoff frequency ',num2str( fcutoff)]);

Image_R=Image_R(1:M, 1:N);
figure; imshow(Image_R,[]);title ('1a: Ideal Low Pass');

%% 1b Gaussian low pass
[U,V]=meshgrid(-N:1:N-1,-M:1:M-1); % get for even number, -N/2: 0: N/2-1 for odd number -(N-1)/2: 0: (N-1)/2

Do=50;% sigma cutoff frequency
Uo=6;
% filter design
Gau_F=exp(-(Uo^2*(U.^2+V.^2))/(2*Do^2));
% shift
Gau_F=ifftshift(Gau_F);
% inverse DFT to spatial domain
Image_R=ifft2(Gau_F.*Image_FD);
Image_R=Image_R(1:M, 1:N);
figure; imshow(Image_R,[]);title ('1b: Gaussian Low Pass');
% mean square error
err = immse(Image_R,Image);
fprintf('MSE for 1b = %.4f \n', err);

%% 1c fith order Butterworth high pass
[U,V]=meshgrid(-N:1:N-1,-M:1:M-1);
Do=150;
order=5;%fith order
D=sqrt(U.^2+V.^2);
   
% filter design
BW_HPF=1./(1+(Do./D).^(2*order));
% shift
BW_HPF=ifftshift(BW_HPF);
% inverse DFT to spatial domain
Image_R=ifft2(BW_HPF.*Image_FD);
Image_R2=Image_R(1:M, 1:N);
figure; imshow(abs(Image_R2),[]);colorbar;
title('1c: Butterworth High Pass');
% mean square error
err = immse(Image_R2,Image);
fprintf('MSE for 1c = %.4f \n', err);
 