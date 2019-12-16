f = @(x) exp(x);
k = 1:16;
h = 10.^(-k);

df = @(x) (f(x + h) - f(x)) ./ h;
exp_d = df(1);

% get the relative errors
exp_err = abs((exp_d - exp(1)) ./ exp(1));

% get the loglog graph
loglog(h, exp_err)

% get the minimum error and check it against eps
h_min = min(exp_err)
e_mach = eps

