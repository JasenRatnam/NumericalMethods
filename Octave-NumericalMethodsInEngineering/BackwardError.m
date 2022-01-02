# Prevent Octave from thinking that this
# is a function file:
1;

clear
format long
output_precision(16)

#if given function and xr
f = @(x) 2+cos(exp(x)-2)-exp(x)
xr=1.00767372

fxr=f(xr)


backwardsError=abs(fxr)


disp("--------------------------------------------")

#if given amtrix and xr:
A=[5 -3 2;1 4 -1;-4 5 0]
b= [4;-2;5]
xr = [2.9;5.7;1.6]
B=norm(b,inf)
BE=A*xr-b
backwardError = norm(BE,inf)
disp("")
disp("Relative backward error")
relativeBackwardError= backwardError/B