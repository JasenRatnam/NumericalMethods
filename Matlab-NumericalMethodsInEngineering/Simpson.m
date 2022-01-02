function I = Simpson(f, a, b, m)

%{
must be used with f initialized before call with f = @(x) ... 
with divisions/multiplications/powers of x (.* ./ .^)
%}

h = (b-a) / (2*m);
x1 = linspace(a+h, b-h, m);
x2 = linspace(a+2*h, b-2*h, m-1);

I = h/3 * (f(a) + f(b) + 4*sum(f(x1)) + 2*sum(f(x2)));