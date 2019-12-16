function nodes = ChebyshevNodes(a, b, n)
nodes = zeros(n);
    for i = 1:n
        nodes(i) = (a + b) / 2 + (b - a) * cos ((2 * i + 1) * pi / (2 * (n + 1)));
    end