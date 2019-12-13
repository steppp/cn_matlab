function [t, sol, C] = chol_solver(A, n)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

x = zeros(n, 1) + 1;
b = A * x;

%get condition number
C = cond(A);

% CHOLESKY FACTORIZATION
tic();
[U, p] = chol(A);
sol = 0;
t = 0;

if p == 0   % A must be simmetric and positive definite
    y = lowmat_solver(U', b);
    sol = uppmat_solver(U, y);
    t = toc();
end

