Image = imread('rice.png');
Im1 = imnoise(Image,'gaussian',0,0.25);
Im2 = imnoise(Image,"salt & pepper",0.35);
Image=imread('rice.png');
%Sobel Gaussian Noise
H=[-1,-2,-1;0,0,0;1,2,1];% sobel Kernel
H1_v=conv2(Im1, H,'same');% get x direction
H1_h=conv2(Im1, H','same');% transpose of H to get y direction
H1_M=abs(H1_h)+abs(H1_v);%magnitude
%find maximum of matrix for rescale
m=H1_M(1);
for n=2:numel(H1_M)
  if H1_M(n)>m
   m=H1_M(n);
  end
end
result = uint8((H1_M / m) * 255);%rescale to 0-255
figure; imshowpair(Im1,result,'montage');
title('sobel gaussian noise');
%Sobel Salt & Pepper Noise
H1_v=conv2(Im2, H,'same');% get x direction
H1_h=conv2(Im2, H','same');% transpose of H to get y direction
H1_M=abs(H1_h)+abs(H1_v);%magnitude
%find maximum of matrix for rescale
m=H1_M(1);
for n=2:numel(H1_M)
  if H1_M(n)>m
   m=H1_M(n);
  end
end
result = uint8((H1_M / m) * 255);%rescale to 0-255
figure; imshowpair(Im2,result,'montage');
title('sobel salt & pepper noise');