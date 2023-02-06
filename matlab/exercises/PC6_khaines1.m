%Kayla Haines
%CSC 4630/6630 PC6
%Due Feb 21 2021

fname = 'exampledata.w6';
myfile = fopen(fname,'r');
[a, b] = fscanf(myfile, '%d ', 2);
%a(1) rows, a(2)columns
mymatrix = [];
for k = 1:a(2)
    x = fscanf(myfile, '%d ', a(1));
    mymatrix = [mymatrix x];
end
disp(mymatrix);
fclose(myfile);

copyfile exampledata.w6 exampledata.w6b
%ls -l
fname = 'exampledata.w6b';
myfile = fopen(fname,'a');
fprintf(myfile, '%d ', 1:5);
fclose(myfile);

%Pad matrix with zeros to make it square
fname = 'exampledata.w6';
myfile = fopen(fname,'r');
[a, b] = fscanf(myfile, '%d ', 2);
fname2 = 'exampledata.w6c';
myfile2 = fopen(fname2,'w');
mymatrix = [];
newmatrix = [];
for k = 1:a(2)
    x = fscanf(myfile, '%d ', a(1));
    mymatrix = [mymatrix x];
end
if (a(1) > a(2))%more rows than columns
    max = a(1);
    newmatrix = zeros(a(1),a(1));
    fprintf(myfile2, '%d %d ', a(1), a(1));
    for m = 1:a(1)
        for n = 1:a(2)
            newmatrix(m,n) = mymatrix(m,n);
        end
    end
elseif (a(1) < a(2))%more columns than rows
    max = a(2);
    newmatrix = zeros(a(2),a(2));
    fprintf(myfile2, '%d %d ', a(2), a(2));
    for m = 1:a(1)
        for n = 1:a(2)
            newmatrix(m,n) = mymatrix(m,n);
        end
    end
end
fclose(myfile);
%disp(newmatrix);

%print values to file
for m = 1:max
    for n = 1:max
        fprintf(myfile2, '%d ', newmatrix(n,m));
    end
end
fclose(myfile2);

%Test new file
fname2 = 'exampledata.w6c';
myfile2 = fopen(fname2,'r');
[a, b] = fscanf(myfile2, '%d ', 2);
mymatrix = [];
for k = 1:a(1)
    x = fscanf(myfile2, '%d ', a(1));
    mymatrix = [mymatrix x];
end
disp(mymatrix);
fclose(myfile2);
