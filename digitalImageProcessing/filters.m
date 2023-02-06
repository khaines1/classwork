clear; close all; 
Image=imread('testpat2.tif');
Image = im2double(Image);
figure;imshow(Image); title('original image');
% blur image
kernel = fspecial('average', 9);
affectedImage = imfilter(Image,kernel,'conv','circular');
% add noise
affectedImage = imnoise(affectedImage,'gaussian',0,0.06);
figure;imshow(affectedImage); title('Noisy and Blured image')

%% a. Inverse filter
[M,N]=size(affectedImage);
H=fft2(kernel,M,N);
Gtemp=1./H; %inverse  filter 

Gtemp(abs(Gtemp)>10)=10.*sign(Gtemp(abs(Gtemp)>10));% saturate large values due to inversing of small values  
Im_rec=ifft2(Gtemp.*fft2(affectedImage));
figure;imshow(Im_rec,[]); title('a. Inverse filter restoration')

%% b. Weiner filter
% noise variance estimation 
 % for selecting a region to estimate noise variance 
    %[B]=roipoly(affectedImage);
    %B1=double(affectedImage(B));Nv=var(B1); 
    %disp(['variance of local area:',num2str(Nv)])
    %nsr = Nv/var(affectedImage(:));
nsr=0.05/var(affectedImage(:));
  
Im_rec1=deconvwnr(affectedImage, kernel,nsr);

figure;imshow(Im_rec1,[]);title('b. Weiner filter restoration')

%% c. radius cutoff inverse filter

% inverse filter 
Hf=fft2(H,M,N);
Gtemp=1./Hf; 
Gtemp(abs(Gtemp)>0.01)=0.01.*sign(Gtemp(abs(Gtemp)>0.01));

% circular ideal low pass filter
fc = 30; % Cut-off Frequency  
u = 0:(M-1); 
idx = find(u>M/2); 
u(idx) = u(idx)-M; 
v = 0:(N-1); 
idy = find(v>N/2); 
v(idy) = v(idy)-N; 
[V, U] = meshgrid(v, u); 
D = sqrt(U.^2+V.^2); 
H2 = double(D <= fc); 
G = H2.*fft2(affectedImage);

% shift low pass filter
G = ifftshift(G);
% multiplication to mask out inverse
Inverse = Gtemp.*G;

Im_rec = real(ifft2(double(Inverse))); 
figure; imshow(Im_rec,[]); title('c. radius cutoff inverse');