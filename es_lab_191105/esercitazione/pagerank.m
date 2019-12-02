n = 5;
v = (zeros(1, n) + 1)';
A1 = [0 0 1 1; 1 0 0 0; 1 1 0 1; 1 1 0 0];
A2 = [0 1 0 1 1; 0 0 1 1 1; 1 0 0 1 0; 0 0 0 0 1; 0 0 1 0 0;];
 
[ev, max_eigval] = powmethod(A2, v, 1e-8)
normalized_ev = ev / sum(ev)

e = eig(A2)