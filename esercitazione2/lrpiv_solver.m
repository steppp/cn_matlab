function [t, sol, C] = lrpiv_solver(A, n)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
x = zeros(n, 1) + 1;
b = A * x;

% GET CONDITION NUMBER
C = cond(A);

% LR FACTORIZATION WITH PIVOTING
tic();
% get upper and lower triangular matrices
[L, U, P] = lu(A);              % get L, U and the permutation matrix P
y = lowmat_solver(L, P * b);    % solve Ly = Pb
sol = uppmat_solver(U, y);      % solve Ux = y
t = toc();
end

