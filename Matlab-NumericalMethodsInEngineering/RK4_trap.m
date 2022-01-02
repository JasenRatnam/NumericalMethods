function [t, w] = RK4_trap(f, t0, y0, h, n)

%{
n is the number of points we want to evaluate after IVs

if used with a single ODE:
    must be used with f initialized before call with f = @(t, y) ... 
    with divisions/multiplications/powers of y (.* ./ .^)

if used in a system:
    must be used with z initialized before call as an array of functions
    with divisions/multiplications/powers of y (.* ./ .^) as follows:

    z = @(t, y) [..., ..., ...];

    variables y1, y2, ... are written as y(1), y(2), ...

    y0 must be initialized as an array containing the IVs in order
%}

w = [y0];
t = [t0];
k1 = zeros(1, length(y0));
for i = 1:length(k1)
    k1(i) = NaN;
end
k2 = k1;
k3 = k1;
k4 = k1;

for i = 1:n
    k1 = [k1 ; f(t(i), w(i,:))];
    k2 = [k2 ; f(t(i)+h/2, w(i,:)+k1(i+1,:)*h/2)];
    k3 = [k3 ; f(t(i)+h/2, w(i,:)+k2(i+1,:)*h/2)];
    k4 = [k4 ; f(t(i)+h, w(i,:)+k3(i+1,:)*h)];
    w = [w ; w(i,:)+h/6*(k1(i+1,:)+ 2*k2(i+1,:) + 2*k3(i+1,:) + k4(i+1,:))];
    t = [t ; t(i)+h];
end

VarNames = {'t', 'k1', 'k2', 'w'};
for i = 1:length(y0)
    T = table(t(:,1), k1(:,i), k2(:,i), w(:,i), 'VariableNames', VarNames)
end