Inp=imread('cameraman.tif');
    figure,imshow(Inp);axis on
    [M,N]=size(Inp);
    rstep=45.2;cstep=134.8;
    tform=[1,0,rstep;0,1,cstep;0,0,1];
    inv(tform);
        for row=1:M
            for col =1:N
                New_Coor=tform*[row,col,1]';
                Row_new=round(New_Coor(1));
                Col_new=round(New_Coor(2));
                Outp(Row_new,Col_new)=Inp(row,col);
            end
        end
        Outp(Outp==0)=256;
        figure,imshow(Outp);axis on
