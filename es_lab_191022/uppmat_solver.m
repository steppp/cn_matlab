function [x] = uppmat_solver(A, b)
%UPPMAT_SOLVER Calculate the soutions of the upper triangular matrix using
%the backwards substitution method.

n = length(b);
x = zeros(n, 1);

for j = n:-1:2
    x(j) = b(j) / A(j, j);
    
    % calculate the sum of the next elements in the matrix ahead-of-time
    b(1:j-1) = b(1:j-1) - A(1:j-1,j) * x(j);
end

x(1) = b(1) / A(1, 1);

end

