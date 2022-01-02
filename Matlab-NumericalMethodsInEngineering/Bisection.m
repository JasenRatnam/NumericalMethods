function [xr, error, iteration] = Bisection(f, a, b, tol)

%{
must be used with f initialized before call with f = @(x) ... 
with divisions/multiplications/powers of x (.* ./ .^)
%}

iteration = -1;
error = inf;

while(error > tol)
    iteration = iteration + 1
    xr = (a + b) / 2
    error = abs(b - a) / 2
    if((f(a) * f(xr)) < 0)
        b = xr;
    else
        a = xr;
    end
end

