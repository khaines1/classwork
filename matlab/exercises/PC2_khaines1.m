%Kayla Haines
%CSC 4630/6630 PC2
%Due Jan 23 2021
x = 3;
disp('If statement');
%simple if statement
if(x > 5)
    disp('x is greater than 5');
else
    disp('x is less than or equal to 5');
end
disp('For loop');
%for loop
for k = 0:1
    disp(sprintf('%d divided by %d = %.4f',k,x,k/x));
end

disp('While count down');
%while loop
k = x;
disp('Starting countdown');
disp(k);
while(k > 1)
    k = k - 1;
    disp(k);
end
%Switch statement
 m = mod(x,3);
 switch m
    case 0
        disp(sprintf('%d mod 3 is 0',x));
    case 1
        disp(sprintf('%d mod 3 is 1',x));
    case 2
        disp(sprintf('%d mod 3 is 2',x));
    case 3
        disp(sprintf('%d mod 3 is 3',x));
end
%Assert and try catch
disp('Assert test');
disp('Try and catch');
    try
        assert(x > 5)
        disp('The assert(x > 5) succeeded');
    catch
        disp('Looks like x is not greater than five');
    end


