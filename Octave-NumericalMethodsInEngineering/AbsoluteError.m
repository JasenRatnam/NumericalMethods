#Measure distance between real solution and approximate solution
#Capital E for absolute

1;
clear
format long
output_precision(16)

#approximate solution:
xr = 0.567143470743

f = @(x) x.^2-2*x.*exp(-x)+exp(-2*x)
fd = @(x) 2*x-2*(exp(-x)+exp(-2*x))

#Ea = |xr-r| = f(xr)/f'(xr)
Ea = abs(f(xr)/fd(xr))

#{
#real solution
r= 5.5

#absolute error:
Ea=abs(xr-r)
#}