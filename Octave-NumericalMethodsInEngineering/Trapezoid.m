function I = Trapezoid(f, a, b, m)

%{
must be used with f initialized before call with f = @(x) ... 
with divisions/multiplications/powers of x (.* ./ .^)
%}

x = linspace(a, b, m+1);
h = (b-a)/m;

I = h/2 * (2*sum(f(x)) - f(a) - f(b));