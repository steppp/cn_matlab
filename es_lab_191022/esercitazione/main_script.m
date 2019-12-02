% GENERATE LINEAR SYSTEM
n = 15;
A = randn(n);
%A = hilb(n);
%A = ones(n) + eye(n) + eye(n) * 0.001
x = zeros(n, 1) + 1;
b = A * x;

% GET CONDITION NUMBER
C = cond(A)


% LR FACTORIZATION
tic();
tmp = gauss_elim(A);
U = triu(tmp);                              % get upper tri. mat.
L = eye(size(A, 1)) + tril(tmp, -1);        % get lower tri. mat. and add the main diagonal
y = lowmat_solver(L, b);                    % solve for Ly = b
x_sol = uppmat_solver(U, y)                 % get the solution by solving Ux = y
t_lr = toc()


% LR FACTORIZATION WITH PIVOTING
tic();
% get upper and lower triangular matrices
[L_piv, U_piv, P] = lu(A);                  % get L, U and the permutation matrix P
y_piv = lowmat_solver(L_piv, P * b);        % solve Ly = Pb
x_piv_sol = uppmat_solver(U_piv, y_piv)     % solve Ux = y
t_lr_piv = toc()


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
