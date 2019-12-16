function [halfs] = bisection(a, b, F, t1, t2)
    i = 1;
    halfs(i) = 1;
    flag = F(a) .* F(b) < 0;

    if flag
        while abs(F(halfs(i))) > t1 | abs(b - a) > t2
            i = i + 1;
            c = a + (b - a) / 2;

            if sign(F(c)) ~= sign(F(a))
                b = c;
            else
                a = c;
            end

            halfs(i) = c;
        end
    end
end

