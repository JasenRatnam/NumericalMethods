1;

#Error magnification factor M:
#M=forward errorbackward error1|f'(xr)|
#Factor which amplifies an initial input error
#Output error is the input error time the error magnification factor

#The larger M is the larger forward error is compared to backward error
clear
format long
output_precision(16)

forwardError=6.408247422680421e-01
backwardError=  2.486400000000003

f = @(x)x^2-11*x+24
xr=3.56

df = @(x) 2*x-11

M=forwardError/backwardError
M=1/abs(df(xr))

#if M>>1 its bad