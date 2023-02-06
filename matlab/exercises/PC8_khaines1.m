%Kayla Haines
%CSC 4630/6630 PC8
%Due March 7 2021

%create test image and write to file
testim = zeros(256, 256, 3, 'uint8');
testim(1:128,:,1) = 255;
testim(:, 1:128, 2) = 255;
testim(64:196, 64:196, 3) = 255;
imshow(testim)
imwrite(testim,'testim.JPG')

img = imread('testim.JPG');
%check if image is grayscale
if(size(img,3) == 1)
    disp('Grayscale image detected. Please use colored')
    return
end
image(img);

b = 0; %ends loop when color_shift() is called
while(b == 0)
    %loops continuously until valid points are chosen
    outOfBounds = false;
    [MAXR, MAXC, MAXD] = size(img);
    title('select two points');
    %get points from user input
    [xpts,ypts] = ginput(2);
    rows = round(ypts);
    cols = round(xpts);
    %check if dimensions are within bounds
    if((min(rows) < 1) || (max(rows) > MAXR))
        outOfBounds = true; 
    end
    if((min(cols) < 1) || (max(cols) > MAXC))
        outOfBounds = true; 
    end
  
    if(~outOfBounds) %within bounds
        img = color_shift('testim.JPG',rows,cols);
        imshow(img);
        b = b + 1;
    else %out of bounds
        disp('Out of bounds. Please select a point within bounds.');
    end
end

