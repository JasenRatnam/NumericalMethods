1;
clear
format long
output_precision(16)

point = 3
a=1
b=3
f = @(x) x.^2.*log(x)

[q, ier, nfun, err] = quad (f, a,b,0)

