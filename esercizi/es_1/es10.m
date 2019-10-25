A = [1 2 3];
A(2,:) = A(1,:)/10;
A(3,:) = A(1,:)*10

B = [4 5 6];
B(2,:) = B(1,:)/10;
B(3,:) = B(1,:)*10

% somma e differenza di A e B
C = A+B
D = A-B

% prodotto e quoziente punto per punto di A e B
E = A.*B
F = A./B

% prodotto di A e B
G = A*B