% GENERATE LINEAR SYSTEM
A = randn(5);
x = [1 1 1 1 1]';
b = A * x;

% GET CONDITION NUMBER
C = cond(A)

% LR FACTORIZATION
tmp = gauss_elim(A);
U = triu(tmp)                               % get upper tri. mat.
L = eye(size(A, 1)) + tril(tmp, -1)         % get lower tri. mat. and add the main diagonal
y = lowmat_solver(L, b);                    % solve for Ly = b
x_sol = uppmat_solver(U, y)                 % get the solution by solving Ux = y

% LR FACTORIZATION WITH PIVOTING
% get upper and lower triangular matrices
[L_piv, U_piv, P] = lu(A)                   % get L, U and the permutation matrix P
y_piv = lowmat_solver(L_piv, P * b);        % solve Ly = Pb
x_piv_sol = uppmat_solver(U_piv, y_piv)     % solve Ux = y

% CHOLESKY FACTORIZATION
[x_chol, p] = chol(A);
if p == 0
    x_chol    
end
