clear; clc;

x = zeros(1, 24);
for i = 1:24
x(i) = 1/24*(i-1);
end

y = [15 16 15 15 15 14 14 13 13 14 13 14 15 16 18 20 21 21 21 20 19 17 16 15];
At = [zeros(1, 24) + 1; sin(2*pi.*x); cos(2*pi.*x)];
A = transpose(At);

left = At * A;
right = At * transpose(y);

a = left\right;
a0 = a(1)
a1 = a(2)
a2 = a(3)

r = y - (a0 + a1.*sin(2*pi.*x) + a2.*cos(2*pi.*x));
RMSE = rms(r)