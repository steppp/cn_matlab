A = [1 2 3; 4 5 6; 7 8 9]

% dim di A
size(A)

% numero di elementi di A
numel(A)

B = [A(3,:); A(2,:); A(1,:)]

x = B(:,1)

y = B(3,:)'

A = [A(:,1) A(:,3)]