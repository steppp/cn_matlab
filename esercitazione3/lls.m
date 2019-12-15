% get problem data
D = get_static_dataset();
n = 2;
useSVD = false;

x = D(:, 1);
Y = D(:, end);

% get A
m = size(D, 1);

% extract relevant columns from the input matrix
A = [ones(m, 1)];

% a_ij = x_i ^ j for i = 1...m, j = 0...n
for i=2:n+1
    A(:, i) = x .^ (i-1);
end

alpha = 0;

if useSVD   % SVD FACTORIZATION
    [U, S, V] = svd(A);

    sRows = size(S, 1);
    sCols = size(S, 2);

    min_sizeS = min(sRows, sCols);
    S = S(1:min_sizeS, :);
    S = S(:, 1:min_sizeS);

    pseudoS = inv(S);
    pseudoS(min_sizeS+1:sCols, :) = zeros(sCols - min_sizeS, min_sizeS);
    pseudoS(:, min_sizeS+1:sRows) = zeros(min_sizeS, sRows - min_sizeS);

    alpha = V * pseudoS * U' * Y;
    disp(alpha);
else        % NORMAL EQUATION SYSTEM
    % compute the solution using mldivide
    alpha = mldivide(A' * A,  A' * Y);
    disp(alpha);

    X = A*alpha;
end

% plot the polynomial
figure
plotInterval = [min(x) * 0.9, max(x) * 1.1];

fplot(@(x) alpha(1) + ...
    alpha(2) * x ...
    + alpha(3) * (x^2) ...
    , plotInterval, '-r');
%{
    + alpha(4) * (x^3) ...
    + alpha(5) * (x^4) ...
    + alpha(6) * (x^5) ...
    %}

modeString = 'SISTEMA DELLE EQUAZIONI LINEARI';
if useSVD
    modeString = 'SVD';
end

t = sprintf('LLS per n = %d con %s', n, modeString);
title(t)
grid on
hold on

% plot the dataset 
plot(D(:, 1), D(:, 2), 'b*')
