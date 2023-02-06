%% 1
clear;close all;
Image = imread("butterfly.gif");
%Dialation
se = strel('disk',2);
dilated = imdilate(Image,se);
%figure, imshow(Image,[]), figure, imshow(dilated,[])  

%Erosion
se = strel('rectangle',[6,6]);
eroded = imerode(dilated,se);
%figure; imshow(eroded,[])

%Opening
se = strel('disk',3);
opened = imopen(Image,se);
figure; 
subplot(2,2,1); imshow(Image,[]); title('Original')
subplot(2,2,2); imshow(dilated,[]); title('Dialation');
subplot(2,2,3); imshow(eroded,[]); title('Erosion');
subplot(2,2,4); imshow(opened,[]); title('Opening');

%% 2
Image = imread("fork.gif");
se = strel("disk",7);
%Internal Boundary(A - (A-B))
eroded = imerode(Image,se);
I=Image - eroded;
%figure; imshow(X,[]);title('internal boundary ');

%External Boundary((A+B)-A)
dilated = imdilate(Image,se);
E=dilated - Image;
%figure; imshow(X,[]);title('external boundary ');

%Morphoological Boundary((A+B)-(A-B))
M = dilated - eroded;
figure;
subplot(2,2,1); imshow(Image,[]); title('Original')
subplot(2,2,2); imshow(I,[]); title('Internal Bound.');
subplot(2,2,3); imshow(E,[]); title('External Bound.');
subplot(2,2,4); imshow(M,[]); title('Morphological Bound.');

%% 3
Image = imread("tire.tif");
[M,N] = size(Image);
%Global thresholding

%Put image in vector form
vimage = Image(:);
%Using mean as initial threshold
t = mean(vimage);
c=1; T(c)=t;
%obtain index of the gray-level above t
j = find(vimage<T(c));
%obtain index of the gray-level below t
i = find(vimage>=T(c));
%obtain average value of gLevel-above and gLevel-below t
m1 = mean(vimage(j));
m2 = mean(vimage(i));
%new threshold
T(c+1) = floor((m1+m2)/2);
c=c+1;
%condition to terminate process
while T(c-1)~=T(c)
    j=find(vimage<T(c));
    i=find(vimage>=T(c));
    m1=mean(vimage(j));
    m2=mean(vimage(i));
    T(c+1)=floor((m1+m2)/2); %new threshold
    c=c+1;
end
OT=T(c); %optimum threshold
%obtain binary image using t
bimage = imbinarize(reshape(vimage,[M,N]),OT/255);%level in the range [0,1]
%display the images in same graph
figure;
subplot(2,2,1); imshow(Image,[]); title('Gray-level Image');
subplot(2,2,2); imhist(Image); title('Image Histogram');
subplot(2,2,3); imshow(bimage,[]); title('Binary Image');
