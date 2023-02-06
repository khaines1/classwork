%Kayla Haines
%CSC 4630/6630 PC4
%Due Feb 7 2021

%display a 2x2 of zeros and 3x3 matrix of ones
disp(zeros(2,2))
disp(ones(3,3))
%matrix dimensions
MAXR = 10;
MAXC = 10;
rng(7)%seed 7
%matrix with random intergers btw 1 and 100
randMatrix = randi(100,MAXR,MAXC);
size(randMatrix)
%Multiply random matrix by identity matrix
%using reg. multiplication and element by element multiplication
identMatrix = eye(MAXR);%identity matrix with MAXR dimentions    
multi = randMatrix * identMatrix
elByEl =randMatrix .* identMatrix
diagonals = randMatrix .* identMatrix;%for finding diagonal values
disp("Regular matrix multiplication with identity did not change the matrix");
disp("element by element kept the diagonal. All other values became 0");

%Print different sections of the random matrix
M = 3;
N = 4;
disp(sprintf('First %dx%d rows and columns',M,N))
first = randMatrix(1:M,1:N);
disp(first)
disp(sprintf('Last %dx%d rows and columns',M,N))
last = randMatrix(MAXR-(M-1):MAXR, MAXC-(N-1):MAXC);
disp(last)
disp(sprintf('Middle %dx%d rows and columns',M,N))
%find middle by deleting alternating ends of rows and cols
middle = randMatrix;
rowSize = MAXR;
colSize = MAXC;
while(rowSize > M)
    middle(1,:) = [];%remove row
    rowSize = size(middle,1);
    if(rowSize > M)
        middle(rowSize,:) = [];%remove row
    end
end
while(colSize > N)
    middle(:,1) = [];%remove col
    colSize = size(middle,2);
    if(colSize > N)
        middle(:,colSize) = [];%remove col
    end
end
disp(middle)

%find the diagonals
disp("Values along the diagonal")
mystr = 'diagonls are: '; 
n = numel(randMatrix);
for k = 1:n
    if(diagonals(k) > 0)
            mystr = sprintf('%s %d', mystr, diagonals(k));
    end
end
disp(mystr);
disp("Same values if run multiple times");
disp("because of the seed value");

