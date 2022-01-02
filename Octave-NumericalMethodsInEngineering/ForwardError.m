# Prevent Octave from thinking that this
# is a function file:
1;
#aka  absolute error
clear
format long
output_precision(16)

f = @(x) (2*x-1).^2
xr=0.48

df = @(x) 4*(2*x-1)

forwardError= abs(f(xr))/abs(df(xr))

#if r is avaible use this:
#
r = 0.5
forwardError = abs(r-xr)
#}



disp("--------------------------------------------")
#if given matrix and xr and r:
A=[3 2 7;-2 4 -5;1 0 4]
b= [-82;79;-45]
xr = [-7.3;0;-8.5]
r= A\b       #[4;3;5]
R=norm(r,inf)

FE=r-xr
forwardError = norm(FE,inf)
disp("")
disp("Relative forward error")
relativeForwardError= forwardError/R