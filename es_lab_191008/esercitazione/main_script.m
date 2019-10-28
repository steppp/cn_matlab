% =====  ES. 1  =====

% get L, the minimum exponent allowed using realmin
% in matlab, realmin is calculated as 2^L
L = log2(realmin)

% U is calculated as (2-eps) * 2^U
U = log2(realmax / (2 - eps))

% to obtain t, we use the definition of eps=2^(1-t)
t = 1 - log2(eps)

UFL = 2^L
OFL = (2-2^(1-t)) * 2^U


% =====  ES. 2  =====

% get eps using the definition fl(1 + eps) > 1
eps_calc = 1;

while 1+eps_calc/2 > 1
    eps_calc = eps_calc / 2;
end
    
eps_calc