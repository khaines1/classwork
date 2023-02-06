clear; close all;
Image = imread('baboon256.tif');

%% 1.
% coefficients in level 1
% wavelet decopositon  
[c,s] = wavedec2(Image,2,'haar');
% wavelet reconstrucion 
h = wrcoef2('h',c,s,'haar',1); % level 1 horizontal  
v = wrcoef2('v',c,s,'haar',1); % level 1 vertical 
d = wrcoef2('d',c,s,'haar',1); % level 1 diagnal  
a = wrcoef2('a',c,s,'haar',1); % level 1 approximate 
% plot images
figure;
subplot(2,2,1);imshow((a),[]),title('lv.1 approximate coef.')
subplot(2,2,2);imshow((h),[]),title('lv.1 horizontal coef.')
subplot(2,2,3);imshow((v),[]),title('lv.1 vertical coef.')
subplot(2,2,4);imshow((d),[]),title('lv.1 diagonal coef.')

% coefficients in level 2
% wavelet reconstrucion in level 2
h = wrcoef2('h',c,s,'haar',2); % level 2 horizontal 
v = wrcoef2('v',c,s,'haar',2); % level 2 vertical
d = wrcoef2('d',c,s,'haar',2); % level 2 diagnal  
a = wrcoef2('a',c,s,'haar',2); % level 2 approximate 
% plot images
figure;
subplot(2,2,1);imshow((a),[]),title('lv.2 approximate coef.')
subplot(2,2,2);imshow((h),[]),title('lv.2 horizontal coef.')
subplot(2,2,3);imshow((v),[]),title('lv.2 vertical coef.')
subplot(2,2,4);imshow((d),[]),title('lv.2 diagonal coef.')

%% 2.
% add gaussian noise
image1 = imnoise(uint8(Image),"gaussian",0,0.05);
figure;
subplot(1,2,1);imshow((Image),[]),title('original image')
subplot(1,2,2);imshow((image1),[]),title('image with gauss. noise')

% coefficients in level 1
% wavelet decopositon  
[c,s] = wavedec2(image1,2,'haar');
% wavelet reconstrucion 
h = wrcoef2('h',c,s,'haar',1); % level 1 horizontal  
v = wrcoef2('v',c,s,'haar',1); % level 1 vertical 
d = wrcoef2('d',c,s,'haar',1); % level 1 diagnal  
a = wrcoef2('a',c,s,'haar',1); % level 1 approximate 
% plot images
figure;
subplot(2,2,1);imshow((a),[]),title('lv.1 approximate coef.')
subplot(2,2,2);imshow((h),[]),title('lv.1 horizontal coef.')
subplot(2,2,3);imshow((v),[]),title('lv.1 vertical coef.')
subplot(2,2,4);imshow((d),[]),title('lv.1 diagonal coef.')

% coefficients in level 2
% wavelet reconstrucion in level 2
h = wrcoef2('h',c,s,'haar',2); % level 2 horizontal 
v = wrcoef2('v',c,s,'haar',2); % level 2 vertical
d = wrcoef2('d',c,s,'haar',2); % level 2 diagnal  
a = wrcoef2('a',c,s,'haar',2); % level 2 approximate 
% plot images
figure;
subplot(2,2,1);imshow((a),[]),title('lv.2 approximate coef.')
subplot(2,2,2);imshow((h),[]),title('lv.2 horizontal coef.')
subplot(2,2,3);imshow((v),[]),title('lv.2 vertical coef.')
subplot(2,2,4);imshow((d),[]),title('lv.2 diagonal coef.')

%% 3.
b = wdencmp('gbl',image1,'db2',3,250,'h',1);
figure; 
subplot(2,2,1);imshow((Image),[]),title('original image')
subplot(2,2,2);imshow((image1),[]),title('noisey image')
subplot(2,2,3);imshow((b),[]),title('wavelet denoised image')
