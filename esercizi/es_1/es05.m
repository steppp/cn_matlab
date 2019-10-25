A = ones(5);

for i=2:5
    for j=2:5
        A(i,j) = A(i-1, j) + A(i, j-1);
    end
end

A
A(1:4, 3)
A(:,3)
A(1:4,[2,4])

A=A([2, 3, 4, 5],:)
A=A(:,[2, 3, 3, 4, 5])