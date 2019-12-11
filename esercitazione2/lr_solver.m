function [t, sol, C] = lr_solver(A, n)
%lr_solver Solves a linear system using lr factorization
%   A = matrix associated to the linear system
%   n = size of the problem
%   returns t = elapsed time
%   returns sol = solutions vector
%   returns cond = condition number of the matrix
x = zeros(n, 1) + 1;
b = A * x;

% GET CONDITION NUMBER
C = cond(A);

% LR FACTORIZATION
tic();
tmp = gauss_elim(A);
U = triu(tmp);                          % get upper tri. mat.
L = eye(size(A, 1)) + tril(tmp, -1);	% get lower tri. mat. and add the main diagonal
y = lowmat_solver(L, b);                % solve for Ly = b
sol = uppmat_solver(U, y);              % get the solution by solving Ux = y
t = toc();

end

