%Kayla Haines
%CSC 4630/6630 PC11
%Due Apr 4 2021
n = 5.491853096329675;
for x=1:100
    if (x < n^2)
        g(x) = -1;
    elseif (x > sqrt(n*1e+03))
        g(x) = 1;
    else
        if ((x >= 44) && (x <= 46))
            disp(sprintf(' x is %d', x));
        end
        m = 2^n - x;
        g(x) = x/m;
    end
end