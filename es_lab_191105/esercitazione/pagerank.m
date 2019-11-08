v = [1 1 1 1]';
A = [0 0 1 1; 1 0 0 0; 1 1 0 1; 1 1 0 0];
 
[ev, max_eigval] = powmethod(A, v, 1e-8)
