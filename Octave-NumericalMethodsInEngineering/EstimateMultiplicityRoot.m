# Prevent Octave from thinking that this
# is a function file:
1;
clear
format long
output_precision(16)

f = @(x) x.^4+14.2*x.^3+47.21*x.^2-22.72*x+2.56

ezplot(f, [-10,10])
disp("In PLOT: if goes trough x-axis: m is odd, if touches x-axis: m is even")
disp("")
r=-7.31862
df = @(x) 4*x.^3+3*14.2*x.^2+2*47.21*x-22.72

ddf = @(x) 3*4*x.^2+2*3*14.2*x+2*47.21
dddf = @(x) 2*3*4*x+2*3*14.2
ddddf = @(x) 2*3*4


disp("m=0")
fx=f(r)
disp("m=1")
dfx=df(r)
disp("m=2")
ddfx=ddf(r)
disp("m=3")
dddfx=dddf(r)
disp("m=4")
ddddfx=ddddf(r)

#fourth root
m=1
#{
m must be estimated if true r is not needed
Plotting function
Deciding if the root is of odd or even multiplicity based on the plot
Evaluating the various derivatives in the estimation xrof the root and 
evaluate if the root is multiple or not
The number of dervitive with big number is the root type
#}

disp("The number of dervitive of with first non-zero number is the root type")
#fx=f(xr)
#Ea=abs(xr-r) = |m!f(xr)/f^m(xr)|^(1/m)
Ea=abs(factorial(m)*fx/dfx)^(1/m)
disp("Correct digits is the exponant")

