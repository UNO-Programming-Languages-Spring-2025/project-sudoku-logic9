% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% Define the grid size
size(4).
subgrid_size(2).

% Possible numbers
num(1..4).

% Each cell must contain exactly one number
{ sudoku(X,Y,N) : num(N) } = 1 :- size(S), X=1..S, Y=1..S.

% Each row must have distinct numbers
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% Each column must have distinct numbers
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Predefined clues
sudoku(X,Y,N) :- initial(X,Y,N).

% Define subgrid mapping formula
subgrid(X, Y, G) :- subgrid_size(S), X=1..(S*S), Y=1..(S*S), G=1+(((X-1)/S)*S+(Y-1)/S).





#show subgrid/3.
#show sudoku/3.