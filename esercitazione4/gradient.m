function [x] = gradient(f, grad, x0, t1)
    maxit = 200;
    c = 1/4;
    k = 1;
    x = x0;
    grad_x0 = grad(x0);
    disp(grad_x0);
    convergence = false;

    while ~convergence & k < maxit
        alpha = 1;
        next = true;
        p = grad(x(k, :));
        disp(p);
        j = 0;

        while next & j < maxit
            alpha = alpha / 2;
            next = (f(x(k, :) + alpha * p) > f(x(k, :)) - c * alpha * p' * p);
            j = j + 1;
            disp(j);
            
            disp(alpha);
        end

        k = k + 1;
        x(k, :) = x(k-1, :) - alpha * p;

        convergence = (norm(grad(x(k, :)), 2) / norm(grad_x0, 2)) < t1;
    end

end
