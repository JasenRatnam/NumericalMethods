1;

#{
||x||2 = sqrt(x1^2 + x2^2 + ... xn^2)
    norm(x,2) -- default same as norm(x)
||x||p = prt(x1^p + x2^p + ... xn^p)
    norm(x,p)
||x||inf = maximum absolute value of x vector
    Element in vector with highest absolute value
    norm(x,inf)
#}

#{

x=[-2; 4; -8; 3; 5]
disp("Euclidean norm")
norm(x)
disp("p-norm")
norm(x,1)
disp("INF-norm")
norm(x,inf)

#}
clear
format long
output_precision(16)

r= [4;3]
xr= [3;5]
A= [3 2;-1 2]
b= [18;2]

FE=r-xr
forwardError = norm(FE,inf)

BE=A*xr-b
backwardError = norm(BE,inf)

R=norm(r,inf)
B=norm(b,inf)

disp("Relative forward error")
relativeFE= forwardError/R

disp("Relative backward error")
relativeBE= backwardError/B

disp("Error magnification factor M")
M= relativeFE/relativeBE