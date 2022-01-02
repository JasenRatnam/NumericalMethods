1;
clear
format long
output_precision(16)

# 1: Trapezoid-RK2  2:midpoint-RK2 3:RK4
type = 1

#beta  dy = -b*y
b=1;

#dy/dt = f
f = @(t,y) b*((1+y.^2)./2);
#y(0)
y0 = 1;
#t e [0,1]
t0 = 0;
tf = 1;
h = 0.2;
h2 = h/2;

n = (tf-t0)/h;
n2 = (tf-t0)/h2;
n2= int32(n2);
n= int32(n);
w = [y0];
t = [t0];
k1 = [0];
k2 = [0];
k3 = [0];
k4 = [0];

w2 = [y0];
t2 = [t0];
k12 = [0];
k22 = [0];
k32 = [0];
k42 = [0];

if(type ==1)
  #Global order
  q=2;
  disp("ti    k1       k2       wi    ")
  disp([num2str(t),"      N.A.    N.A.    ", num2str(w)])
  for i = 1:n
    t = [t ; t(i)+h];
    k1 = [k1 ; f(t(i),w(i))];
    k2 = [k2 ; f(t(i)+h,w(i)+k1(i+1)*h)];
    w = [w ; w(i)+h*(1/2*k1(i+1)+1/2*k2(i+1))];
    disp([num2str(t(i+1)),"   ",num2str(k1(i+1)),"   ",num2str(k2(i+1)),"   ", num2str(w(i+1))])
  endfor
  disp("")
  
  output = [t,k1,k2,w]
  
  disp("ti    k1       k2       wi    ")
  disp([num2str(t2),"      N.A.    N.A.    ", num2str(w2)])
  for i = 1:n2
    t2 = [t2 ; t2(i)+h2];
    k12 = [k12 ; f(t2(i),w2(i))];
    k22 = [k22 ; f(t2(i)+h2,w2(i)+k12(i+1)*h2)];
    w2 = [w2 ; w2(i)+h2*(1/2*k12(i+1)+1/2*k22(i+1))];
    disp([num2str(t2(i+1)),"   ",num2str(k12(i+1)),"   ",num2str(k22(i+1)),"   ", num2str(w2(i+1))])
  endfor
  disp("")
  
  output = [t2,k12,k22,w2]
  
 elseif(type ==2)
  #Global order
  q=2;
  disp("ti    k1       k2       wi    ")
  disp([num2str(t),"      N.A.    N.A.    ", num2str(w)])
  for i = 1:n
    t = [t ; t(i)+h];
    k1 = [k1 ; f(t(i),w(i))];
    k2 = [k2 ; f(t(i)+h/2,w(i)+k1(i+1)*h/2)];
    w = [w ; w(i)+h*k2(i+1)];
    disp([num2str(t(i+1)),"   ",num2str(k1(i+1)),"   ",num2str(k2(i+1)),"   ", num2str(w(i+1))])
  endfor
  disp("")
  
  output = [t,k1,k2,w]
  
  disp("ti    k1       k2       wi    ")
  disp([num2str(t2),"      N.A.    N.A.    ", num2str(w2)])
  for i = 1:n2
    t2 = [t2 ; t2(i)+h2];
    k12 = [k12 ; f(t2(i),w2(i))];
    k22 = [k22 ; f(t2(i)+h2/2,w2(i)+k12(i+1)*h2/2)];
    w2 = [w2 ; w2(i)+h2*k22(i+1)];
    disp([num2str(t2(i+1)),"   ",num2str(k12(i+1)),"   ",num2str(k22(i+1)),"   ", num2str(w2(i+1))])
  endfor
  disp("")
  
  output = [t2,k12,k22,w2]
  
 elseif(type == 3)
    #Global order
  q=4;
  disp("ti    k1       k2       k3       k4       wi    ")
  disp([num2str(t),"      N.A.    N.A.    N.A.    N.A.    ", num2str(w)])
  for i = 1:n
    t = [t ; t(i)+h];
    k1 = [k1 ; f(t(i),w(i))];
    k2 = [k2 ; f(t(i)+h/2,w(i)+k1(i+1)*h/2)];
    k3 = [k3 ; f(t(i)+h/2,w(i)+k2(i+1)*h/2)];
    k4 = [k4 ; f(t(i)+h,w(i)+h*k3(i+1))];
    w = [w ; w(i)+h/6*(k1(i+1)+2*k2(i+1)+2*k3(i+1)+k4(i+1))];
    disp([num2str(t(i+1)),"   ",num2str(k1(i+1)),"   ",num2str(k2(i+1)),"   ",num2str(k3(i+1)),"   ",num2str(k4(i+1)),"   ", num2str(w(i+1))])
  endfor
  disp("")
  
  output = [t,k1,k2,k3,k4,w]
  
  disp("ti    k1       k2       k3       k4       wi    ")
  disp([num2str(t2),"      N.A.    N.A.    N.A.    N.A.    ", num2str(w2)])
  for i = 1:n2
    t2 = [t2 ; t2(i)+h2];
    k12 = [k12 ; f(t2(i),w2(i))];
    k22 = [k22 ; f(t2(i)+h2/2,w2(i)+k12(i+1)*h2/2)];
    k32 = [k32 ; f(t2(i)+h2/2,w2(i)+k22(i+1)*h2/2)];
    k42 = [k42 ; f(t2(i)+h2,w2(i)+h2*k32(i+1))];
    w2 = [w2 ; w2(i)+h2/6*(k12(i+1)+2*k22(i+1)+2*k32(i+1)+k42(i+1))];
    disp([num2str(t2(i+1)),"   ",num2str(k12(i+1)),"   ",num2str(k22(i+1)),"   ",num2str(k32(i+1)),"   ",num2str(k42(i+1)),"   ", num2str(w2(i+1))])
  endfor
  disp("")
  
  output = [t2,k12,k22,k32,k42,w2]
 
 endif 
 
 
  E = abs((w2(n2+1)-w(n+1))/((h/h2).^q-1))
  disp(["y(", num2str(tf),") = ",num2str(w2(n2+1))," +- ",num2str(E)])