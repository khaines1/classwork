function button_callback(obj,ignore,num)
    global img;
    global img_handle;
    global startRow;
    global startCol;
    global moveVal;
    global showVal; 
    
    if(num == 1) %move let
        if(startRow - moveVal < 0)
            disp('Cannot move further left');
        else
            startRow = startRow - moveVal;
            axes(img_handle);
            imshow(img(startRow:startRow+showVal, startCol:startCol+showVal, :));
            disp('moved left');
        end
    elseif(num == 2) %move right
        if(startRow + moveVal > showVal)
            disp('Cannot move further right');
        else
            startRow = startRow + moveVal;
            axes(img_handle);
            imshow(img(startRow:startRow+showVal, startCol:startCol+showVal, :));
            disp('moved right');
        end
    elseif(num == 3) %move up
        if(startCol + moveVal > showVal)
            disp('Cannot move further up');
        else
            startCol = startCol + moveVal;
            axes(img_handle);
            imshow(img(startRow:startRow+showVal, startCol:startCol+showVal, :));
            disp('moved up');
        end
    else %move down
        if(startCol - moveVal < 0)
            disp('Cannot move further down');
        else
            startCol = startCol - moveVal;
            axes(img_handle);
    imshow(img(startRow:startRow+showVal, startCol:startCol+showVal, :));
            disp('moved down');
        end
    end
    %axes(img_handle);
    %imshow(img(startRow:startRow+showVal, startCol:startCol+showVal, :));
end