function [outputArg1,outputArg2] = lrpiv_solver(inputArg1,inputArg2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


% LR FACTORIZATION WITH PIVOTING
tic();
% get upper and lower triangular matrices
[L_piv, U_piv, P] = lu(A);                  % get L, U and the permutation matrix P
y_piv = lowmat_solver(L_piv, P * b);        % solve Ly = Pb
x_piv_sol = uppmat_solver(U_piv, y_piv)     % solve Ux = y
t_lr_piv = toc()
end

