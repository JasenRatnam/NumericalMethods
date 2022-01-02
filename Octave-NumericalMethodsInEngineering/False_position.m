function [xc, error, iteration] = False_position(f, a, b, tol)

%{
must be used with f initialized before call with f = @(x) ... 
with divisions/multiplications/powers of x (.* ./ .^)
%}

iteration = -1;
error = inf;

while(error > tol)
    iteration = iteration + 1
    xc = (a*f(b) - b*f(a)) / (f(b)-f(a))
    error = abs(b - a) / 2
    if((f(a) * f(xc)) < 0)
        b = xc;
    else
        a = xc;
    end
end
