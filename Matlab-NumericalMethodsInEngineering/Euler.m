function [t, w] = Euler(f, t0, y0, h, n)

%{
must be used with f initialized before call with f = @(t, y) ... 
with divisions/multiplications/powers of y (.* ./ .^)

n is the number of points we want to evaluate after IVs
%}

w = [y0];
t = [t0];

for i = 1:n
    w = [w ; w(i,:) + h*f(t(i), w(i,:))];
    t = [t ; t(i) + h];
end

VarNames = {'t', 'w'};
for i = 1:length(y0)
    T = table(t(:,1), w(:,i), 'VariableNames', VarNames)
end