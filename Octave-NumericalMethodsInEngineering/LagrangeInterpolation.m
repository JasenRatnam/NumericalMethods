1;

#{
  Have a data set made of data points
  Adjust the parameter of the model to represent the data points as closely 
  as possible
  Curve fitting
  m parameters a for m data points

  Interpolating polynomial:
  Pm-1(x)=a0+a1x+a2x^2+...+am-1x^(m-1)

  Sum of products of monomials
  
  Less prone to round-off eros
  Slower to evaluate
  
  Lagrange polynomials:
  Li(x) = 1 for x=xi
          0 for x=xj for j!=i
  Pm-1(xi) = yi 
#}


clear
format long
output_precision(16)

x = [-3.2;2.5;9.7]
y = [9.1;5;9.8] #ln(x)
Y = @(x) log(x);
#y = Y(x)
# x0 represents the target to be interpolated
x0=4.7;

m = length(x)
disp("")

#{
Pm-1(x)=  L1(x)y1
          +L2(x)y2
          +L3(x)y3
          + ...
          +Lm-1(x)ym

Pm-1(xi) = yi
          
P2(x)=  L1(x)y1 + L2(x)y2 + L3(x)y3

conditions:
  1)
      Li must have m-1 roots: x= xjfor all data points except xi
      Li(x)is a product of (x-x1)*(x-x2), etc., until (x-xm)
          Excluding (x-xi)
  2)
      must evaluate to 1

#}
P = 0;
Lx = zeros(m,1);
Ln = zeros(m,1);
Li = zeros(2,1);
z=1;
P2= [""];
B= zeros(2,1);
for j = 1 : m
    L = 1;
    k=1;
    a= [""];
    A= [""];
    for i = 1 : m
        if i~=j
            b = ["((x0- ", num2str(x(i)), ")/( " ,num2str(x(j))," - ", num2str(x(i)), "))"];
            c = ["*(x0- ", num2str(x(i)), ")"];
            B(k) = (x0-x(i));
            A =  strcat(A,c);      
            a = strcat(a,"*",b);
            L = L * (x0-x(i))/(x(j)-x(i));
            Li(k) =(x(j)-x(i));
            k++;
        end
    end
    Lx(j) = 1/(Li(1)*Li(2));
    Ln(j) = 1/(Li(1)*Li(2))*B(1)*B(2);
    LJ = strcat("1",a)
    LJ = strcat(num2str(Lx(j)),A)
    P2 = strcat(P2," + [",LJ,"]*",num2str(y(j)));
    Pi=L*y(j);
    P = P + Pi;
    a= [""];
    disp("")
    z++;
end 

P2
disp("")
disp("P at point x0 given")
P
disp("\nLagrange coefficents")
Ln
disp("")

disp("if function given for y, Error using interpolating polynomial")
yx = Y(x0)
E = abs(yx-P)
disp("")


disp("if function given for y, Error without using interpolating polynomial")
#E = |f(x0)-P2(x0)| <=((x0-x1)(x0-x2)(x0-x3))/3!  * f^(3)(c)   
#1<c<6, somewhere in data set, f^3: third derivaitve

disp("Upperbound error")
dddf = @(x)2/(x^3);  #max of 2/x^3 at x=1 dfff=2
#maximum value of 2 is obtained when x =1
E =((x0-x(1))*(x0-x(2))*(x0-x(3)))/factorial(m)*2 











