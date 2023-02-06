Image = imread('rice.png');
Im1 = imnoise(Image,'gaussian',0,0.25);
Im2 = imnoise(Image,"salt & pepper",0.35);
%Roberts Gaussian Noise
H=[-1,0;0 1];%Robert Kernel
H1_v=conv2(Im1, H,'same');% get x direction
H1_h=conv2(Im1, H','same');% transpose of H to get y direction
H1_F=sqrt(H1_v.^2+H1_h.^2);% norm/ amplitude /magnitude  
%find maximum of matrix for rescale
m=H1_F(1);
for n=2:numel(H1_F)
  if H1_F(n)>m
   m=H1_F(n);
  end
end
result = uint8((H1_F / m) * 255);%rescale to 0-255
figure; imshowpair(Im1,result,'montage');
title('Roberts gaussian noise');
%Roberts Salt & Pepper Noise
H1_v=conv2(Im2, H,'same');% get x direction
H1_h=conv2(Im2, H','same');% transpose of H to get y direction
H1_F=sqrt(H1_v.^2+H1_h.^2);% norm/ amplitude /magnitude  
%find maximum of matrix for rescale
m=H1_F(1);
for n=2:numel(H1_F)
  if H1_F(n)>m
   m=H1_F(n);
  end
end
result = uint8((H1_F / m) * 255);%rescale to 0-255
figure; imshowpair(Im2,result,'montage');
title('Roberts salt & pepper noise');