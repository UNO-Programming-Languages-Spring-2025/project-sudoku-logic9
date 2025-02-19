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

% Define subgrid mapping formula
subgrid(X,Y,G) :- subgrid_size(N), X = 1..N, Y = 1..N, G = 1 + (((X-1) / N) * N + (Y-1) / N).

% Each 2×2 subgrid must have distinct numbers
:- sudoku(X1,Y1,N), sudoku(X2,Y2,N), subgrid(X1,Y1,G), subgrid(X2,Y2,G), 
   X1 != X2, Y1 != Y2.

% Predefined clues
sudoku(X,Y,N) :- initial(X,Y,N).


#show sudoku/3.