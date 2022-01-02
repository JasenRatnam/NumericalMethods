1;

#{

Models:
  Linear relations
    y=a0+a1x
  Polynomial function
    y=a0+a1x+a2x^2
  Nonlinear model
  y=a0x^(a1)
  
regression:
  To adjust a physical law to experimental law
  Verify if an experiment can confirm a physical law
  To determine parameters based on a theoretical relationship 
  and experimental data
  Measurement of a resistor
  Machine learning
#}
clear
format long
output_precision(16)

x=[-1;2;3]
y=[3;2;1]
subplot (2, 1, 1)
plot(x,y)
m = length(x)


type = 1; #1=linear model, 2=exponential model, 3=power law model

if(type == 1)
  #y=a0+a1*x
  
elseif(type ==2)
  #{
  y=a0*e^(a1*x)
  Linearization:
    Multiply by ln
    ln(y) = ln(a0*e^(a1*x))=ln(a0)+a1*x
    ln(y) = ln(a0)+a1*x
    Y= ln(y)
    A0= ln(a0)
    X=x
    We can use a linear model to solve ln(y) = ln(a0)+a1*x data points 
   (xi, ln (yi))
    Exponential becomes linear when the natural log (ln) is computed
  #}
  y= log(y);
 
elseif(type ==3)
  #{
  y=a0*x^(a1)
  Linearization:
    Multiply by ln
    ln(y) = ln(a0*x^(a1))=ln(a0)+a1*ln(x)
    ln(y) = ln(a0)+a1*ln(x)
    Y= ln(y)
    A0= ln(a0)
    X=ln(x)
    We can use a linear model to solve ln(y) = ln(a0)+a1*ln(x) data points 
   (ln(xi), ln (yi))
    power law becomes linear when the natural log (ln) is computed
  #}
  y= log(y);
  x= log(x);
endif

#
#to get a1 and a0:
xy = x.*y
x2 = x.^2

a1 = (m*sum(xy)-sum(x)*sum(y))/(m*sum(x2)-(sum(x))^2);
a0 = (1/m)*sum(y)-a1*(1/m)*sum(x);
a0;
a1;

#{
a0=-2
a1=2.3
#}

if(type == 1)
  #y=a0+a1*x
  a0
  a1
  f = a0+a1*x;
  fx = @(x) a0+a1*x;
  disp(["y = ",num2str(a0)," + ",num2str(a1),"x"])  
elseif(type ==2)
  # y=a0*e^(a1*x)
    disp(["ln(y) = ",num2str(a0)," + ",num2str(a1),"X"])  
    a0 = exp(a0)
    a1
    y=exp(y)
    
   f=a0*exp(a1*x);
   fx = @(x) a0*exp(a1*x);
   disp(["y = ",num2str(a0)," *e^(",num2str(a1),"x)"])  
elseif(type ==3)
  # y=a0*x^(a1)
    disp(["ln(y) = ",num2str(a0)," + ",num2str(a1),"ln(x)"])  
    a0 = exp(a0)
    a1
    y=exp(y)
    x=exp(x)
   f=a0*x.^(a1);
   fx=@(x) a0*x.^(a1);
   disp(["y = ",num2str(a0)," *x^(",num2str(a1),")"]) 
endif

subplot (2, 1, 2)
plot(x,f)

#residual error
disp("Residual errors")
r= y - f
r= r.^2;

disp("Squared Error")
SE = sum(r)
#we wante the solution with minimum SE

disp("Mean Squared Error")
MSE = SE/m

disp("Root Mean Squared Error")
RMSE = sqrt(MSE)

disp("")
disp("y at given x:")
x0 = 1985;
y = fx(x0)






















