f = @(x) 1 ./ (1 + power(x, 2));

a = -5;
b = 5;
len = b - a;
nmin = 3;
nmax = 15;
int_plot = a:0.01:b;

figure;
hold on;
grid on;
title(["Runge function"; "Lagrange interpolation on Chebyshev nodes"]);
plot (int_plot, f(int_plot));

i = 1;
for n = nmin:4:nmax
    i = i + 1;
    int_interpolate = ChebyshevNodes(a, b, n);
    Lagr = @(x) lagrange(int_interpolate, f(int_interpolate), x);
    plot(int_plot, arrayfun(Lagr, int_plot));
end
hold off;
