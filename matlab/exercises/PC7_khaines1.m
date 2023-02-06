%Kayla Haines
%CSC 4630/6630 PC7
%Due Feb 28 2021

function [result] = PC7_khaines1(N)
    if(floor(N/10) == 0)
        result(1) =  mod(N,10);
        %disp('end condition reached');
        %disp(result);
    else    
        m = floor(N/10);
        result = [N-m*10 PC7_khaines1(m)];
        %disp('one step closer...');
        %disp(result);
    end
    disp(result);
end
