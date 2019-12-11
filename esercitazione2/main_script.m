% DEFINE RANDOM VARIABLES
n_rand_min = 10;
n_rand_max = 1000;
n_hilb_min = 2;
n_hilb_max = 15;
n_sp_min = 50;
n_sp_max = 5000;

n_min = n_rand_min;
n_max = n_rand_max;

% GENERATE LINEAR SYSTEM
%A = hilb(n);
%A = ones(n) + eye(n) + eye(n) * 0.001
interval = 1:100;
t = interval;
n = interval;
C = interval;
err = interval;

for i=interval
    ni = i*10
    A = randn(ni);
    [ti, sol, Ci] = lr_solver(A, ni);
    t(i) = ti;
    n(i) = ni;
    C(i) = Ci;
    x = zeros(ni, 1) + 1;
    err(i) = norm(sol - x, 2) / norm(x, 2);
end

semilogy(n, (err - min(err)) / max(err - min(err)), "r", n, (t - min(t)) / max(t - min(t)), "b", n, (C - min(C)) / max(C - min(C)), "k")