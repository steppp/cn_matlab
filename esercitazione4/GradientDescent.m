function [x_star, err, alpha, i] = GradientDescent(f, df, x, x_sol, iter_max, tol)
c = 0.1;
tau = 0.1;
m = norm(df(x)) * c;
i = 1;
cur_err = 1000;
bt_iter_max = 15;
while(cur_err > tol & i < iter_max)
    p = -df(x);
    t = - c * m;    
    cur_alpha = 1;
    j = 0;
    while (((f(x + cur_alpha * p) - f(x)) > c * cur_alpha * p' * p) & (j < bt_iter_max))
        j = j + 1;
        cur_alpha = tau * cur_alpha;
    end
    x = x + cur_alpha * p;
    cur_err = norm(x_sol - x) / norm(x_sol);
    err(i) = cur_err;
    alpha(i) = cur_alpha;
    i = i + 1;
end
x_star = x;
end
