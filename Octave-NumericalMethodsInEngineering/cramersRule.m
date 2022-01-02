1;
clear
format long
output_precision(16)

A = [2 1 1; 1 -1 -1; 1 2 1]     % Coefficient Matrix
X = [3; 0; 0]

Ax = [3 1 1 ; 0 -1 -1;0 2 1 ] 
Ay = [2 3 1; 1 0 -1; 1 0 1]
Az = [2 1 3; 1 -1 0; 1 2 0]
detA=det(A)
x = det(Ax)/detA
y = det(Ay)/detA
z = det(Az)/detA