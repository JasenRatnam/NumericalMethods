1;
clear
format long
output_precision(16)

# 1:Euler 2: Trapezoid-RK2  3:RK4
type = 3

# More than one unknown function
# N unknown functions yi(t)

function z=f(t,y)
  z(1) = y(2);
  z(2) = (t.^3.*log(t)-2.*y(1)+2.*t.*y(2))./(t.^2);
endfunction

#y(t0)
y0 = [-1 2];
#t e [0,1]
t0 = 2;
tf = 3;
ee = [];
hn=[];
for i=1:1
  
#{  
n = 10.^i;
n2 = 2*10.^i;
h = 5/n;
h2 = 5/n2;
hn = [hn;h2];
#}

#
h = 0.25;
h2 = h/2;
n = (tf-t0)/h;
n2 = (tf-t0)/h2;
hn = [hn;h2];
n2= int32(n2);
n= int32(n);
#}

w = [y0];
w2 = [y0];
t = [t0];
t2 = [t0];
if(type ==1)
  #Global order
  q=1;
  
  for i = 1:n
    w = [w ; w(i,:)+h*f(t(i),w(i,:))];
    t = [t ; t(i)+h];
    
  endfor

  disp("          ti                       wi1                    wi2")
  output = [t,w];
  disp(output)
  
  for i = 1:n2
    w2 = [w2 ; w2(i,:)+h2*f(t2(i),w2(i,:))];
    t2 = [t2 ; t2(i)+h2];
    
  endfor

  disp("          ti                       wi1                    wi2")
  output = [t2,w2];
  disp(output)
elseif (type ==2)
  #Global order
  q=2;
  
  for i = 1:n
    t = [t ; t(i)+h];
    k1 = f(t(i),w(i,:));
    k2 = f(t(i)+h,w(i,:)+k1*h);
    w = [w ; w(i,:)+h/2*(k1+k2)];
  endfor
  
  disp("          ti                       wi1                    wi2")
  output = [t,w];
  disp(output)
  
  for i = 1:n2
    t2 = [t2 ; t2(i)+h2];
    k1 = f(t2(i),w2(i,:));
    k2 = f(t2(i)+h2,w2(i,:)+k1*h2);
    w2 = [w2 ; w2(i,:)+h2/2*(k1+k2)];
  endfor
  
  disp("          ti                       wi1                    wi2")
  output = [t2,w2];
  disp(output)
  
elseif (type ==3)
     #Global order
  q=4;
  for i = 1:n
    t = [t ; t(i)+h];
    k1 = f(t(i),w(i,:));
    k2 = f(t(i)+h/2,w(i,:)+k1*h/2);
    k3 = f(t(i)+h/2,w(i,:)+k2*h/2);
    k4 = f(t(i)+h,w(i,:)+h*k3);
    w = [w ; w(i,:)+h/6*(k1+2*k2+2*k3+k4)];
    
  endfor  
  
  disp("          ti                       wi1                    wi2")
  output = [t,w];
  disp(output)
  disp("")
  
   for i = 1:n2
    t2 = [t2 ; t2(i)+h2];
    k1 = f(t2(i),w2(i,:));
    k2 = f(t2(i)+h2/2,w2(i,:)+k1*h2/2);
    k3 = f(t2(i)+h2/2,w2(i,:)+k2*h2/2);
    k4 = f(t2(i)+h2,w2(i,:)+h2*k3);
    w2 = [w2 ; w2(i,:)+h2/6*(k1+2*k2+2*k3+k4)];
  endfor  
  
  disp("          ti                       wi1                    wi2")
  output = [t2,w2];
  disp(output)
  disp("")
  
endif  
E = abs((w2(n2+1,1)-w(n+1,1))/((h/h2).^q-1))

disp(["y1(", num2str(tf),") = ",num2str(w2(n2+1,1))," +- ",num2str(E)])
  
E2 = abs((w2(n2+1,2)-w(n+1,2))/((h/h2).^q-1))
  disp(["y2(", num2str(tf),") = ",num2str(w2(n2+1,2))," +- ",num2str(E2)])
  
  ee = [ee; E E2]  
  hn
endfor


loglog(hn,ee,"linewidth",3)
set(gca,"fontsize",26)
title ({"loglog() plot"});
xlabel ("h");
ylabel ("error");
