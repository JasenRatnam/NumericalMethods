1;
clear
format long
output_precision(16)


f = @(x) (1-cos(x))./x.^3;
m=6;
a=0;
b=pi/2;
h=(b-a)/m;
x=linspace(a+h/2,b-h/2,m);
I=h*sum(f(x))