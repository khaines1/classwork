%crops input image and swaps RGB 
%intended for colored images
function outImg = color_shift(img, rows, cols)
    img = imread(img);
    %crop
    outImg = img(min(rows):max(rows),min(cols):max(cols),:);
    %isolate the colors
    redValues = outImg(:,:,1);
    greenValues = outImg(:,:,2);
    blueValues = outImg(:,:,3);
    %swap colors: green to red, blue to green, red to blue
    outImg(:,:,1) = blueValues;
    outImg(:,:,2) = redValues;
    outImg(:,:,3) = greenValues;
end
