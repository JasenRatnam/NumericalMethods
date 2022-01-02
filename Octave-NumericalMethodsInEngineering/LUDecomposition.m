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
#}
  
#Ax=b => Ux=d => LUx=Ld => Ax=Ld => Ld = b

#Useful where one has to solve several systems with the same 
#coefficient matrix A but different right-hand vector b

clear
format long
output_precision(16)

A=[3 -2 4;27 -19 41;-6 -2 29]    % Coefficient Matrix
b=[-4;-47;-72]

L=[1 0 0;0 1 0; 0 0 1]

n = length(A)
for j = 1:(n-1)
    for i = n:-1:j+1
        disp("Row elimination coefficent")
        m = A(i,j)/A(j,j)
        A(i,:) = A(i,:) - m*A(j,:)
        L(i,j)=m;
    end
end 

L
U=A

A=L*U

#do L*d=b to find d
#do Ux=d to find x
#verify AX=b
disp("")
disp("A = L*U")
disp("A*x = b")
disp("U*x = d")
disp("L*d = b")

d = L\b
x= U\d

Ax = A*x

#calculation of determinants
detL = det(L)
disp("det(L) is always 1 (sum of diagonal)")
detU = det(U)
disp("det(U) is sum of diagonals u11*u22*u33")

detLU = detL*detU
detLUDirect = det(L*U)
detA = det(A)
disp("det(A) = det(LU) = det(L)*det(U)")































