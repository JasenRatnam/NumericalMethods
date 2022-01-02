function [xr, error, iteration] = Newton(f, x0, tol)

%{
must be used with x as a a symbolic variable (syms x)
with divisions/multiplications/powers of x (.* ./ .^)
%}

syms x;
iteration = 0
xr = x0
error = inf;

while(error > tol)
    iteration = iteration + 1
    xr = xr - vpa(subs(f, x, xr)) / vpa(subs(diff(f), x, xr))
    error = abs(vpa(subs(f, x, xr))) / abs(vpa(subs(diff(f), x, xr)))
end
