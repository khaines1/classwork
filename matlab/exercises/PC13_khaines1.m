%Kayla Haines
%CSC 4630/6630 PC13
%Due Apr 18 2021

% find maximum coupon savings from N stores
%global coupons;
global comparisons;
comparisons = 0;

N = 6; % number of stores
total = 0;
coupons = randi(100,N,N);
coupons = zeroDiagonals(coupons,N); % zero the diagonals
% find best route, visit each store
% n stores 
% ignore store row if already traveled to, 

% row 1 is default starting row
%row = [0,coupons(1,:)];
row = coupons(1,:);
visited = zeros(1,N); % boolean to keep track of visited stores
                        % change to one if visited
for k = 1:N % loop through rows
    %for h = 1:N *loop through columns???
%visited(k) = 1;
    best = findBestDeal(N,row); % store to visit
    row = [coupons(best(1),:)]; % best(2) is column used, find coresponding row
    total = total + best(2);
end

disp(sprintf('Total savings: $%d',total));
disp(sprintf('Total comparisons: %d',comparisons));
%findBestDeal(coupons, next, visited)
function best = findBestDeal(N,row)
    global comparisons
    % loop through row to determine which store to move to
    best = 0;
    %row(1) = [];
    %row = row(2,:);
    % loop through columns
    for k = 1:N
        comparisons = comparisons + 1;
        if(row(k) > best)
            best = [k,row(k)]; % store highest coupon value
        end  
    end
end

function m = zeroDiagonals(matrix,N)
    % change values in diagonal to 0
    m = matrix;
    for k = 1:N
        for h = 1:N
            if(k == h)
                m(k,h) = 0;
            end
        end
    end
end

function findFirstStore()
% search matrix and find best starting move
end
