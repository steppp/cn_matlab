% =====  ES. 1  =====

% get L, the minimum exponent allowed using realmin
% in matlab, realmin is calculated as 2^L
L = log2(realmin)

% realmax is calculated as (2-eps) * 2^U
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
e_mach = eps


% =====  ES. 3  =====

n_pi = 1:100;
pi_calc = ones(100, 1);

for i = n_pi
    sign = -1;
    for j = 1:i*100
        pi_calc(i) = pi_calc(i) + (sign * 1/(j*2 + 1));
        sign = sign * -1;
    end
end

err_pi = abs((pi_calc .* 4 - pi) ./ pi)
%plot(n_pi, err_pi)

% =====  ES. 4  =====

ex = 1:16;
n_e = 10.^ex;
e_calc = (1 + 1./n_e).^n_e;
e = exp(1);
loglog(n_e, abs((e - e_calc) / e ))

