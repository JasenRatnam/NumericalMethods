1;
clear
format long
output_precision(16)

# Local truncation error in order 2 in the step size h
# Global truncation error in order 1 in the step size h

#beta  dy = -b*y
b=1;
#Global order
q=1;
#local order = 2
#dy/dt = f
f = @(t,y) b*(t);
#y(0)
y0 = 1;
#t e [0,1]
t0 = 0;
tf = 5;
h1 = 1;
h2 = h1/2;

n1=(tf-t0)/h1;

if(h1<(2/b))
  disp("The series wi is decreasing with i")
  disp("Good approximations")
elseif(h1>(2/b))
  disp("The series wi is increasing with i")
  disp("Bad approximations")
endif
  
  
  

w1 = [y0];
t1 = [t0];

for i = 1:n1
  w1 = [w1 ; w1(i)+h1*f(t1(i),w1(i))];
  t1 = [t1 ; t1(i)+h1];
endfor

t1
w1

plot(t1,w1)



n2=(tf-t0)/h2;

if(h2<(2/b))
  disp("The series wi is decreasing with i")
  disp("Good approximations")
elseif(h2>(2/b))
  disp("The series wi is increasing with i")
  disp("Bad approximations")
endif
  
  
  

w2 = [y0];
t2 = [t0];

for i = 1:n2
  w2 = [w2 ; w2(i)+h2*f(t2(i),w2(i))];
  t2 = [t2 ; t2(i)+h2];
endfor

t2
w2

plot(t2,w2)

E = abs((w2(n2+1)-w1(n1+1))/((h1/h2).^q-1))

disp(["y(", num2str(tf),") = ",num2str(w2(n2+1))," +- ",num2str(E)])


