%{
f = @(x) (100 * (x(2) - x(1).^2).^2 + (1 - x(1)).^2);
grad = @(x) [(400*x(1).^3 + 2*x(1) - 2 - 400*x(1)*x(2)), (200*x(2) - 200*x(1).^2)];
x0 = [0, 0];
t1 = 1e-9;

x = gradient(f, grad, x0, t1);
%}

f = @(x, y) 100 * (y - x .^ 2) .^2 + (1 - x) .^ 2;
[X, Y] = meshgrid(-2:0.2:2);
Z = f(X, Y);

surf(X, Y, Z);


f = @(x) 100 * (x(2) - x(1) .^ 2) .^2 + (1 - x(1)) .^ 2;
df = @(x) [100 * 2 * (x(2) - x(1) .^ 2) * (-2 * x(1)) - 2 * (1 - x(1)) 100 * 2 * (x(2) - x(1) .^ 2)];
iter_max = 1000;

% Errore relativo e passo
[x_star, err, alpha, ~] = GradientDescent(f, df, [0.5 0.5], [1 1], iter_max, 1e-6);
figure;
hold on;
title("Gradient descent - Relative error");
xlabel("Iteration");
ylabel("Relative error");
plot(err);
hold off;

figure;
hold on;
title("Gradient descent - Descent rate (moving average)");
xlabel("Iteration");
ylabel("Rate");
plot(movmean(alpha, length(alpha) / 10));
hold off;
iter = 0;
% Numero di iterazioni variando il punto iniziale
iter_max = 100000;
i = 1;
arr = -20:1:20;
for k = arr
    j = [k k];
    [~, ~, ~, iter(i)] = GradientDescent(f, df, j, [1 1], iter_max, 1e-6);
    i = i + 1;

end
figure;
hold on;
title(["Gradient descent iterations required"; "Starting from differents points along the y = x line"]);
xlabel("Point coordinates");
ylabel("Iterations");
plot(arr, iter);
hold off;

iter = 0;

% Numero di iterazioni variando il criterio di tolleranza
iter_max = 10000;
i = 1;
arr = -13:-1;
for k = arr
    [~, ~, ~, iter(i)] = GradientDescent(f, df, [0.5 0.5], [1 1], iter_max, power(10, k));
    i = i + 1;
end
figure;
hold on;
title(["Gradient descent iterations required"; "Varying the tolerance criterium"]);
xlabel("Log tolerance");
ylabel("Iterations required");
plot(iter, arr);
hold off;
