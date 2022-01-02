1;
clear
format long
output_precision(16)

#Replace f(x) by another function that we can integrate

#quadrature formulas: sum from 0 to n ci*f(xi)

#Error of the quadrature formula:
#Space between y=f(x) and y=P(x)

#If including a and b:
# Closed Newton-Cotes formulas
#If excluding a and b:
# Open Newton-Cotes formulas

#True Error is actual result from integration - approximation

a=1;
b=3;

#composite intervals
m = 1000;

f = @(x) x.^2./(x.^3-exp(-x))
df = @(x) -x.^4-exp(-x).*x.^2-2.*exp(-x).*x./(x.^3-exp(-x)).^2
ddf = @(x) -8.6.*(-8.6.*exp(-4.3.*x.^2)*x.^2+exp(-4.3.*x.^2))
dddf = @(x) 15.689.*exp(-x).*sin(2.9.*x)+24.23.*exp(-x).*cos(2.9.*x)
ddddf = @(x) -85.956.*exp(-x).*sin(2.9.*x)+21.2681.*exp(-x).*cos(2.9.*x)

# 1: Trapezoid, 2: Simpson
type = 1
if(type ==1)
  h = (b-a)/m #step size
    
  x = linspace(a,b,m+1); 
  
  I = (h/2)*(2*sum(f(x))-f(a)-f(b))
  
  
  if(abs(ddf(a))>abs(ddf(b)))
    max = abs(ddf(a))
  elseif (abs(ddf(a))<abs(ddf(b)))
    max = abs(ddf(b))
  endif
  
  #The larger the interval, the larger the truncation error
  #degree of precision = 1
  if(m==1)
  
    E = abs(-(b-a)^3/12 * max)
  else
     E = abs(-(b-a)*h.^2/12 * max)
  endif
  
  IT = I+E

elseif(type == 2)
  h = (b-a)/(2*m)
  x1 = linspace(a+h,b-h,m);
  x2 = linspace(a+2*h,b-2*h,m-1);
    
  I = (h/3)*[f(a)+f(b)+ 4*sum(f(x1)) + 2*sum(f(x2))]
  
  if(abs(ddddf(a))>abs(ddddf(b)))
    max = abs(ddddf(a))
  elseif (abs(ddddf(a))<abs(ddddf(b)))
    max = abs(ddddf(b))
  endif
  
  #degree of precision = 3
  if(m==1)  
    E = abs(-((b-a)/2)^5/90 * max)
  else
    E = abs(-(b-a)*h.^4/180 * max)
  endif
  
  IT = I+E
  
 endif

