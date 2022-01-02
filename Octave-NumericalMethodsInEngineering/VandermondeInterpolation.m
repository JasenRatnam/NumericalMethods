1;

#{
  Have a data set made of data points
  Adjust the parameter of the model to represent the data points as closely 
  as possible
  Curve fitting
  m parameters a for m data points

  Interpolating polynomial:
  Pm-1(x)=a0+a1x+a2x^2+...+am-1x^(m-1)

  Vandermonde matrix:

  Y = X * a
#}

clear
format long
output_precision(16)

x = [1; 2; 4]
y = [7;14.9;40.3]

plot(x,y)

m = length(x)
#Pm-1(x)=a0+a1x+a2x^2+...+am-1x^(m-1)
disp("P2(x)=a0+a1x+a2x^2")
disp("")

A = [x.^0 x.^1 x.^2]
b=y

a = A\b


disp(["P2(x) = ",num2str(a(1))," + ",num2str(a(2)),"x + ",num2str(a(3)), "x^2"])  

p = @(x) a(1)+a(2)*x+a(3)*x^2

x0=3
px0 = p(x0)