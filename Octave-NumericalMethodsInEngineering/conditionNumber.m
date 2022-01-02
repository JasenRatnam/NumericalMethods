1;
clear
format long
output_precision(16)

#{

The largest expected error magnification factor when solving Ax=bis 
 given by the conditioning number of the coefficient matrix A
M <= cond(A) = ||A||inf * ||A^-1||inf

Matrix norm:
  ||A||inf = maximum absolute row sum
  Sum up every row absolute values, choose row with highest value
#}



A= [2 2 -1;-1 3 5;-2 -4 4]
b= [3;1;-7]
xr = [-1;1; 8]
r= A\b
digitsWanted = 12
#r= [1;0]

fe = norm((r-xr),inf)
Relativefe = fe/norm(r,inf)

be = norm((A*xr-b),inf)
Relativebe = be/norm(b,inf)

disp("norm of matrix A")
normA = norm(A,inf)

disp("magnification factor M")
M = Relativefe/Relativebe

disp("cond of matrix A: The largest expected error magnification factor when solving Ax=b")
disp("M=")
condA = cond(A,inf)
M = condA

#Smallest possible error ||deltar||inf expected when solving the system Ax=b

#||delatr||/||r|| = M x emach
#emach = 10^-16
#can never get a solution better than 16-d = 16- log10 M digits

disp("lose of digits")
loseDigits = log10(M)
loseDigitsRound = ceil(log10(M))

numberOfSignificantDigits = 16 - loseDigitsRound

digitsNeeded = digitsWanted+loseDigitsRound