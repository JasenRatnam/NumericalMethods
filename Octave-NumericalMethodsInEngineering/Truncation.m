function E = Truncation(f, a, b, q, mode, h)

%{
must be used with f initialized before call with f = @(x) ... 
with divisions/multiplications/powers of x (.* ./ .^)

q is the order of truncation of the rule used

mode 1 uses the single version, while mode 2 uses the composite version

no need to input h in the call if mode 1 is used
%}
syms x
switch mode
    case 1
        switch q
            case 2
                E1 = (b-a)^3 / 12 .* diff(diff(f(x)));
            case 4
                E1 = ((b-a) / 2)^5 / 90 .* diff(diff(diff(diff(f(x)))));
        end
    case 2
        switch q
            case 2
                E1 = (b-a)*h^2 / 12 .* diff(diff(f(x)));
            case 4
                E1 = (b-a)*h^4 / 180 .* diff(diff(diff(diff(f(x)))));
        end
end

y = linspace(a, b, (b-a)*100);
E2 = zeros(1, length(y));
for i = 1:length(E2)
    E2(i) = vpa(subs(E1, x, y(i)));
end
E = max(abs(E2));