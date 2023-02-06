% program2.m
%
% Author: Kayla Haines
% Account: khaines1@student.gsu.edu
% CSc 4630/6630 Program #2
%
% Due date: March 7, 2021
%
% Description:
% Opens data file temp_test.txt,
% finds value pairs,
% and writes them to a new file, temp_test.csv
%
% Input:
% temp_test.txt
%
% Output:
% temp_test.csv
%
% Usage:
% out = translateToFile(tline); 
%

%open file
fname = 'temp_test.txt';
myfile = fopen(fname);
fname2 = 'temp_test.csv';
myfile2 = fopen(fname2,'w');
%loop through all lines and call translateToFile() when necessary
while 1
    tline = fgetl(myfile);
    if ~ischar(tline), break, end
    if(numel(tline) == 0)
        %do nothing
    elseif(tline(1) == '1')
        translateToFile(tline,myfile2);
    end
end
fclose(myfile);
fclose(myfile2);
function out = translateToFile(tline,file) 
    %column 5 = mash-tun value. column 15 = HLT value
    c = strsplit(tline);%create cell of current line
    %convert strings of target cells to double
    mash = str2double(c(5));
    HLT = str2double(c(15));
        %disp(sprintf('%.1f, %.1f',mash,HLT))
    %print value pairs to target file
    fprintf(file,'%.1f, %.1f\n',mash,HLT);
end
