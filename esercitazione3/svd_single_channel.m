function [Ap, e_rel, c] = svd_single_channel(A, n_lo, n_hi)
%SVD_SINGLE_CHANNEL Computes the svd approximation of a single channel in an image
%   Detailed explanation goes here
nRows = size(A, 1);
nCols = size(A, 2);

if nargin == 1
    n_lo = 0;
    n_hi = floor(min(nRows, nCols) / 10);
elseif nargin == 2
    n_hi = n_lo;
    n_lo = 0;
end

% perform SVD factorization
[U, S, V] = svd(A);

% adjust matrix rank
% remove singular values > n_hi
S(n_hi+1:end, :) = 0;
S(:, n_hi+1:end) = 0;
% remove singular values < n_lo if n_lo ~= 0
if n_lo > 0
    S(1:n_lo, :) = 0;
    S(:, 1:n_lo) = 0;
end

% get the approximation
Ap = U * S * V';

% compute the relative error and compression factor
e_rel = norm(A - Ap, 2) / norm(A);
c = (n_hi - n_lo) * (1/nRows + 1/nCols);

end

