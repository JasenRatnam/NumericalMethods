1;

#{
U matrix is computed using the naive Gauss elimination algorithm
    U=T3T2T1A;  A=T1-1T2-1T3-1U
L matrix is obtained by filling the coefficients used to execute the 
individual Gauss elimination steps into the right places

Not all matrix can be decomposed into such product

If the naive Gauss elimination step cannot be performed on a system Ax=b, 
then there is no LU decomposition of A

A = LU
L:lower diagonal
U: upper diagonal
P: permutation matrix_type
  Matrix consisting of all zeros, except for a single 1 in every row and column
  The identity matrix is always a permutation matrix

#}

#Adds the pivoting step in the Gauss elimination algorithm with
#partial pivoting

clear
format long
output_precision(16)

A=[1 2 3;2 5 3; 1 0 8]    % Coefficient Matrix
b=[5;3;17]

P=[1 0 0;0 1 0; 0 0 1]

[L U P]=lu(A)

#Start from 
# A*x = b => U*x = d
# L*U*x = L*d => P*A*x = L*d
# L*d = P*b

#{
Decompose A into PA=LU
Compute d by solving Ld=Pb by forward substitution
Compute x by solving Ux=d by back substitution
#}

#{
  LU = PA
  Ax = b
  PAx = Pb
  LUx = Pb
  L*U*x = L*d => P*A*x = L*d
  L*d = P*b
  Ux = d
#}

disp("LU = PA")
      disp("Ax = b")
      disp("PAx = Pb")
      disp("LUx = Pb")
      disp("L*U*x = L*d => P*A*x = L*d")
      disp("L*d = P*b")
      disp("Ux = d")

Pb = P*b
d=L\Pb 

x=U\d

