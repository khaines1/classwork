%Kayla Haines
%CSC 4630/6630 PC12
%Due Apr 11 2021
global rCount;
global colTwo;
global PE;
% copy contents of file into matrix
dataMatrix = csvread("ref_hydro_data.csv");
rCount = size(dataMatrix,[1]); % total amount of rows
cCount = size(dataMatrix,[2]); % total amount of columns
colOne = dataMatrix(1:rCount,1);
colTwo = dataMatrix(1:rCount,2);
colThree = dataMatrix(1:rCount,3);
colFour = dataMatrix(1:rCount,4);

% arrays for storing result of each correction formula
uf = [];
wf = [];
vf = [];

% get OG and FG from file,
% columns 1 and 4 respectively
for k = 1:rCount
    OG = colOne(k); % get col 1 value
    FG = colFour(k); % get col 4 value
 
    % Must set x and y first.
    x = OG;
    y = FG;

    c = [ 1.001843, 0.002318474, 0.000007775, ...
             0.000000034, 0.00574, 0.00003344, 0.000000086 ];
    d = [ 1.0000, -0.0044993, 0.00027581, ...
            -0.0000072800, 0.011774, -0.0012717, 0.000063293 ];

    % u,w,and v need values from columns 1 and 4
    % there is an error in column 4
    % u,w,and v are formulas that can fix error
    % find which one best predicts value in column 2 or 3
    u = -0.002349 * x + 0.006276 * y + 1;
    uf = [uf,u];

    w = c(1) - c(2) * x - c(3) * x^2 - c(4) * x^3 ...
            + c(5) * y + c(6) * y^2 + c(7) * y^3;
    wf = [wf,w];

    v = d(1) + d(2) * x + d(3) * x^2 + d(4) * x^3 ...
            + d(5) * y + d(6) * y^2 + d(7) * y^3;
    vf = [vf,v];

    %disp(sprintf('%s %7.4f ', 'method 1', w));
    %disp(sprintf('%s %7.4f ', 'method 2', v));
    %disp(sprintf('%s %7.4f ', 'method 3', u));
    
end

% calculate total error for u,w,and v
% ignore worst one for each  and recalculate total error
% plot results

% calculat total error for each formula
% error above 0.001 is significant
totalError(uf);
ute = PE;
uError = sum(PE)/length(PE);
disp(sprintf('formula u total error is: %.4f',uError));
totalError(wf);
wte = PE;
wError = sum(PE)/length(PE);
disp(sprintf('formula w total error is: %.4f',wError));
totalError(vf);
vte = PE;
vError = sum(PE)/length(PE);
disp(sprintf('formula v total error is: %.4f',vError));
% plot all on same figure
% u is blue, w red, v green
xval = 1:21;
plot(xval,ute,'b',xval,wte,'r',xval,vte,'g');
title('Error blue: u, red: w, green: v');

% ignore worst error for each
% by looking at the contents of PE array while debugging, 
    % row 19 is worst error for u
    % row 19 is worst error for w
    % row 16 is worst error for v
    
disp('Removed worst error for each');
rCount = rCount - 1;
tempColTwo = colTwo;

colTwo(19) = [];
uf(19) = [];
totalError(uf);
ute = PE;
uError = sum(PE)/length(PE);
disp(sprintf('formula u total error is: %.4f',uError));

wf(19) = [];
totalError(wf);
wte = PE;
wError = sum(PE)/length(PE);
disp(sprintf('formula w total error is: %.4f',wError));
colTwo = tempColTwo;

colTwo(16) = [];
vf(16) = [];
totalError(vf);
vte = PE;
vError = sum(PE)/length(PE);
disp(sprintf('formula v total error is: %.4f',vError));

figure;
xval = 1:20;
plot(xval,ute,'b',xval,wte,'r',xval,vte,'g');
title('Error after adjusting blue: u, red: w, green: v');

function PE = totalError(col)
% Calculates total error.
% first finds percent error for each column entry,
% stores in array,then calculates average.
% PE = (|accepted value – experimental value| \ accepted value) x 100%.
global rCount;
global colTwo;
global PE;
PE = [];
    for k = 1:rCount
        x = abs(colTwo(k) - col(k)) / colTwo(k);
        PE = [PE,x];
    end
    
end
