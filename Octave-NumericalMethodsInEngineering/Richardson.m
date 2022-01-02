1;
clear
format long
output_precision(16)


a=0;
b=pi;
f = @(x) cos(exp(x))
h=b-a
m=1

#order of truncation: 2 trapozeid, 4: simpson
q=2
#estimated truncation error
x = linspace(a,b,m+1); 

I1 = (h/2)*(2*sum(f(x))-f(a)-f(b))
#E = @(h2) abs((I(h2)-I(h1))/((h1/h2)^q-1))

 disp(["   h     integral apr     Estimated Error"])
 disp(["   ", num2str(h),"     ", num2str(I1),"        ", "N/A"])

 i=2;
 h1=h;
 TOL=10.^-10;
 do
    m=m*2;
    h2 = h1/2;
    x = linspace(a,b,m+1); 
    I2 = (h2/2)*(2*sum(f(x))-f(a)-f(b));
    
    E = abs((I2-I1)/((h1/h2)^q-1));
    disp(["   ", num2str(h2),"     ", num2str(I2),"        ", num2str(E)])
    h1 = h2;
    I1=I2;
    i++;
 until(E<TOL)
