% DEFINE RANDOM VARIABLES
n_rand_min = 10;
n_rand_max = 1000;
n_hilb_min = 2;
n_hilb_max = 15;
n_sp_min = 50;
n_sp_max = 5000;

n_min = n_rand_min;
n_max = n_rand_max;

interval = n_sp_min:n_sp_max;
t = interval;
n = interval;
C = interval;
err = interval;

pt = interval;
pC = interval;

for i=interval
    %ni = i*10
    ni = i * 1;

    % GENERATE LINEAR SYSTEM
    %A = randn(ni);
    %A = hilb(ni);
    A = diag(ones(1, n-1), -1);
    A = A + diag(ones(1, n-1), 1);
    A = A + (eye(n) * 2.001);
    [B, d] = spdiags(A);

    %{
    [ti, sol, Ci] = lr_solver(A, ni);
    t(i) = ti;
    n(i) = ni;
    C(i) = Ci;
    x = zeros(ni, 1) + 1;
    err(i) = norm(sol - x, 2) / norm(x, 2);
    
    [pti, psol, pCi] = lrpiv_solver(A, ni);
    pt(i) = pti;
    pC(i) = pCi;

    [ti, sol, Ci] = chol_solver(A, ni);

    t(i) = ti;
    n(i) = ni;
    C(i) = Ci;
    x = zeros(ni, 1) + 1;
    err(i) = norm(sol - x, 2) / norm(x, 2);
    %}

end

%semilogy(n, err, "r", n, t, "b", n, C, "k")
%semilogy(n, (err - min(err)) / max(err - min(err)), "r", n, (t - min(t)) / max(t - min(t)), "b", n, (C - min(C)) / max(C - min(C)), "k")
