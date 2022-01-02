function E = Richardson(I1, I2, h1, h2, q)

%{
must be used with f initialized before call with f = @(x) ... 
with divisions/multiplications/powers of x (.* ./ .^)

q is the order of truncation of the rule used
%}

E = abs((I2 - I1) / ((h1/h2)^q - 1));