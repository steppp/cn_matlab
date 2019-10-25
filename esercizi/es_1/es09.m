LOW_B = -2;
UPP_B = 2;

A = LOW_B + (UPP_B - LOW_B) .* rand(4)

main_diag = diag(A)

s = size(A, 1);
anti_diag = A(s:s-1:end-1)'
