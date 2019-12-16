% set up problem data
f = @(x) exp(x) - x^2;
t1 = 10^-9;
t2 = t1;
a = -1;
b = 1;
xStar = -0.7034674;

% compute the solution
% with bisection method
x_b = bisection(a, b, f, t1, t2);

figure
plot(abs(x_b - xStar));
grid on
title('Metodo di Bisezione');
xlabel('iterazione');
ylabel('errore assoluto');

% with newton method
g = @(x) x - f(x)/(exp(x) - 2*x);
x_n = newton(1, g, t1, t2);

figure
plot(abs(x_n - xStar));
grid on
title('Metodo di Newton');
xlabel('iterazione');
ylabel('errore assoluto');

% plot the data
figure
fplot(f, [a, b]);

hold on
grid on
plot(x_n(end), f(x_n(end)), 'b*');
