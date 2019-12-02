function [A] = gauss_elim(A)
%GAUSS_ELIM Implements the Gaussian elimination algorithm
%   Upper triangular matrix corresponds to the upper triangular matrix U,
%   lower triangular matrix corresponds to the lower triangular matrix L
%   minus the main diagonal which has all elements equal to 1.

n = size(A, 1);

for k = 1:n-1
    if abs(A(k, k)) > eps
        A(k+1:n, k) = A(k+1:n, k) / A(k, k);
        A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n);
    end
end

