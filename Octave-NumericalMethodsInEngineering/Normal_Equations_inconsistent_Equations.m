1;

#{
  Curve fitting as set of inconsistent equations
  More equations than unknowns: inconsistent system of equations
  Cannot be solved
  At best, we can minimize the backward error
  Minimize ||Aa-b||

#}
clear
format long
output_precision(16)
#{
x = zeros(1, 34);
for i = 1:34
x(i) = i-1;
end
#}
x=[-2;-1;0;1];
y = [3;-2;2;4];

#f = @(x) a0+a1*x
A= [x.^0 exp(-x.^2) sin(x)]
b=y

#f = a0+a1*x
#want to Minimize ||Aa-b||

#r = y-f
#r= b-A*a

#A^T*A*a = A^T*b

ATA = A'*A
ATb = A'*b

#ATA * a = ATb
a = ATA\ATb

#r= b-A*a

Linear_r= b-A*a
Linear_r2 = Linear_r.^2
Linear_SE = sum(Linear_r2)
