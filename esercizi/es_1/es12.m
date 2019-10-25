A = [3 7 -4 12; -5 9 10 2; 6 13 8 11; 15 5 4 1]

% minimo elemento di ogni colonna di A trasposto
min_el = min(A')

% massimo elemento di A
MAX_EL = max(A, [], 'all')