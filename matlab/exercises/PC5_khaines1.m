%Kayla Haines
%CSC 4630/6630 PC5
%Due Feb 14 2021

%Part 1: create add all elements of myarray to mystruct
disp('part 1');
for m=1:length(myarray)
      mystruct(m).name = myarray{m,1};
      mystruct(m).max = myarray{m,2};
end
mystruct(5).name
mystruct(5).max

%Part 2: find sum of all max values
disp('part 2');
sum = 0;
for k = 1:12
    sum = sum + mystruct(k).max;
end
disp(sprintf('Sum is %d', sum))

%Part 3: using class defined in calclass.m
%help calclass
disp('part 3');
mycalendar = calclass();
disp(mycalendar.getName(5));
disp(mycalendar.getNumber(5));
