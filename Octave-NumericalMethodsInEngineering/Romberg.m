function [R, E] = Romberg(f, a, b, h, it)

%{
must be used with f initialized before call with f = @(x) ... 
with divisions/multiplications/powers of x (.* ./ .^)
%}

R = zeros(it); E = zeros(1, it);

for k = 1:it
    for i = k:it
        if k == 1
            R(i,k) = Trapezoid(f, a, b, (b-a)/(h/2^(i-1)));
        else
            R(i,k) = (2^(2*(k-1))*R(i, k-1) - R(i-1,k-1)) / (2^(2*(k-1))-1);
        end
    end
end

for k = 1:it
    E(k) = abs((R(it, k) - R(it-1,k)) / (2^(2*k) - 1));
end