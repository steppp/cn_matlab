function [x_calc, beta] = powmethod(A, x, t)
%POWMETHOD Executes the power method
%   Calculates the maximum eigenvalue and returns its associated
%   eigenvector

x_calc = x;
beta = 1;
y = A * x_calc;

n_iter = 0;

while n_iter < 10000 || t < abs(norm(y, Inf) - beta)
    y = A * x_calc;
    beta = norm(y, Inf);
    x_calc = y / beta;
    
    n_iter = n_iter + 1;
end

end

