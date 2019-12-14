function [Rr, Rg, Rb] = svd_all_channels(A, n_lo, n_hi)
%SVD_ALL_CHANNELS Computes the svd approximation of all color channels of an image

nRows = size(A, 1);
nCols = size(A, 2);

if nargin == 1
    n_lo = 0;
    n_hi = floor(min(nRows, nCols) / 10);
elseif nargin == 2
    n_hi = n_lo;
    n_lo = 0;
end

% split the three channels
Ar = A(:, :, 1);
Ag = A(:, :, 2);
Ab = A(:, :, 3);

% get the approximation of each channel
Rr = svd_single_channel(Ar, n_lo, n_hi);
Rg = svd_single_channel(Ag, n_lo, n_hi);
Rb = svd_single_channel(Ab, n_lo, n_hi);

