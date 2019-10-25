x=1:10

if x(1) == 1
    'ok';
elseif x(10) == 10
    'ok';
else
    'not ok';
end

% non uguale si indica con la sintassi ~=
% il simbolo per il NOT è ~

while x(10) < 20
    x(10) = x(10) + 1
end