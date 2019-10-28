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


% =====  ES. 3  =====

n_pi = 2000;
pi_calc = 1;
sign = -1;

for i = 1:n_pi
    pi_calc = pi_calc + (sign * 1/(i*2 + 1));
    sign = sign * -1;
end

abs(pi_calc * 4 - pi)


% =====  ES. 4  =====

n_e = 10000000;
e_calc = (1 + 1/n_e)^n_e
%e = exp(1)

