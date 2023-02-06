Image=imread('rice.png');
%Sobel Operation
H=[-1,-2,-1;0,0,0;1,2,1];% sobel Kernel
H1_v=conv2(Image, H,'same');% get x direction
H1_h=conv2(Image, H','same');% transpose of H to get y direction
%figure;
%imshowpair(abs(H1_h),abs(H1_v),'montage') %see horizontal vs vertical
H1_M=abs(H1_h)+abs(H1_v);%magnitude
%find maximum of matrix for rescale
m=H1_M(1);
for n=2:numel(H1_M)
  if H1_M(n)>m
   m=H1_M(n);
  end
end
result = uint8((H1_M / m) * 255);%rescale to 0-255
figure; imshowpair(Image,result,'montage');
title('sobel operation');