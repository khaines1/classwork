%Kayla Haines
%CSC 4630/6630 PC3
%Due Jan 31 2021

%% part 1
% plot a cos function
x = 0:99;
signal = cos(2*pi*x/20);
plot(signal);
pause(1);
plot(x,signal,'r*:');
axis('tight');
% label the axis
xlabel('sample number');
ylabel('cos(2{\pi}x/20)');
% title
str=sprintf('Example signal with %d values', length(x));
title(str);

%% part 2
% Get 2 numbers from user and compare them
disp('');
disp('Start of part 2');
disp('');
for k = 0:3 % loop will run 4 times
    % prompt user for two integers then find which is greater
    first = input('Enter an integer: ');
    second = input('Enter another integer: ');
    relation = first > second;
    switch relation
        case 0
            if(first == second)
                disp('They are equal');
            else
                disp('Second is greater');
            end
        case 1
            disp('First is greater');
    end
    % Check if user input is even, store boolean values
    first_even = (mod(first,2) == 0);
    second_even = (mod(second,2) == 0);
    % See if both are even
    if(first_even && second_even)
        disp('Both are even');
    elseif(~first_even && ~second_even)
        disp('Both are odd');
    elseif(first_even || second_even)
        disp('One is even; the other is odd');
    end
end
