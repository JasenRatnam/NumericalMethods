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

#}

clear
format long
output_precision(16)

X = [1; 2; 3;4]
Y = [-5.5;-5.9;10.3;-6.7]
plot(X,Y)
m = length(X)
n=m;
#{
Pm-1(x)=   b0
          +b1(x-x1)
          +b2(x-x1)(x-x2)
          + ...
          +bm-1(x-x1) ... (x-xm-1)
          
#P2(x)= b0+b1(x-x1)+b2(x-x1)(x-x2)

Degree of m-1, contains m model parameters bm-1
#}

disp("")
disp("P2(x)= b0+b1(x-x1)+b2(x-x1)(x-x2)")
disp("")

D = zeros(n,n);
D(:,1) = Y';
for j=2:n,
  for k=j:n,
      D(k,j) = (D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1));
  end
end
C = D(n,n);
for k=(n-1):-1:1,
  C = conv(C,poly(X(k)));
  m = length(C);
  C(m) = C(m) + D(k,k);
end

C
disp("      f[xi]                 f[xi,xi+1]           f[xi,xi+1,xi+2]")
D
b= diag(D)

#P2(x)= b(1)+b(2)(x-x(1))+b(3)(x-x(1))(x-x(2))
disp(["P2(x) = ",num2str(b(1))," + ",num2str(b(2)),"(x- ",num2str(X(1)),") + ",num2str(b(3)), "(x- ",num2str(X(1)), ")(x- ",num2str(X(2)), ")"])  

P2 = @(x) b(1)+ b(2)*(x-X(1)) + b(3)*(x-X(1))*(x-X(2))
x0=6
P2x0=P2(x0)  
