function [a0, a1, r] = LSF(x, y)

m = length(x);

a1 = (m * sum(x .* y) - sum(x) * sum(y)) / (m * sum(x.^2) - sum(x)^2);
a0 = (sum(y) - a1 * sum(x)) / m;

r = y - (a0 + a1 .* x);
se = sum(r.^2)
rmse = rms(r)