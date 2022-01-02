1;
clear
format long
output_precision(16)
% Data
x_data = [5 10 15]
y_data = [19.4 18.7 18.2]

% Polynomial fit
p = polyfit(x_data, y_data, 2)

% Plot
N = 42;
x = linspace(x_data(1), x_data(end), N);
y = polyval(p, x);
plot(x,y); legend('Nice plot');