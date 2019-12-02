function [x] = lowmat_solver(A, b)
%LOWMAT_SOLVER Calculate the soutions of the lower triangular matrix using
%the forward substitution method.

n = length(b);
x = zeros(n, 1);

for j = 1:n-1
    x(j) = b(j) / A(j, j);
    
    % calculate the sum of the next elements in the matrix ahead-of-time
    b(j+1:n) = b(j+1:n) - A(j+1:n, j) * x(j);
end

x(n) = b(n) / A(n, n);

end

