% program1.m
%
% Author: Kayla Haines
% Account: khaines1@student.gsu.edu
% CSc 4630/6630 Program #1
%
% Due date: Feb 14 2021
%
% Description:
% Repeatedly prompts user with the option to 
% convert miles to kilometers or 
% kilometers to miles until they choose to exit.
% Will round result to two decimal places.
% One mile is approximated to be 1.609 kilometers.
%
% It will accept any decimal value
% but also imaginary and negative numbers.
%
% Input:
% User inputs a string 
% coresponding to one of the prompted options.
%
% Output:
% kilometers converted from miles
% or miles converted from kilometers.
%
% Usage:
% kilometers = miles_to_km(userInput)
% miles = km_to_miles(userInput)
% 

%Promt the user with their options
disp('type m2k to convert miles to kilometers');
disp('type k2m to convert kilometers to miles');
disp('type x to quit program');
%loop until users chooses to exit
k = 0;%counter increases to 1 when 'x' is entered
while k < 1
    disp(' ')
    prompt = 'Please enter your choice: ';
    %save user's input as a string
    choice = input(prompt,'s');
    % determine which option was chosen 
    % and perform appropriate action
    if(strcmp(choice,'m2k')) %miles to kilometers
        userInput = input('number to convert: ');
        miles_to_km(userInput);       
    elseif(strcmp(choice,'k2m')) %kilometers to miles
        userInput = input('number to convert: ');
        km_to_miles(userInput);
    elseif(strcmp(choice,'x')) %quit
        k = k + 1; %increase counter by 1 to exit loop
    else %the user did not enter a valid chouce
        disp('Invalid option')
    end
end
disp('Quitting') %Program has met end condition

%function definitions
function kilometers = miles_to_km(userInput)
    kilometers = userInput * 1.609;
    if(isnan(kilometers)) %check if result is a number 
        disp('result is not a number');
    else %display result
        disp(sprintf('%.2f miles converts to %.2f kilometers',userInput,kilometers));
    end
end

function miles = km_to_miles(userInput)
    miles = userInput / 1.609;
    if(isnan(miles)) %check if result is a number
        disp('result is not a number');
    else %display result
        disp(sprintf('%.2f kilometers converts to %.2f miles',userInput,miles));
    end
end