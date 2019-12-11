function [outputArg1,outputArg2] = untitled5(inputArg1,inputArg2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% CHOLESKY FACTORIZATION
tic();
[U_chol, p] = chol(A);
if p == 0                                   % A must be simmetric and positive definite
    y_chol = lowmat_solver(U_chol', b);
    x_chol_sol = uppmat_solver(U_chol, y_chol)
    t_chol = toc()
else
    t_chol = toc();
end

end

