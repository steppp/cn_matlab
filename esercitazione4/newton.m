function [x] = newton(x0, g, t1, t2)
    i = 1;
    x(i) = x0;
    convergence = false;
    while ~convergence
        i = i + 1;
        x(i) = g(x(i-1));
        convergence = abs((x(i-1) - x(i)) / x(i-1)) < t1;
end
