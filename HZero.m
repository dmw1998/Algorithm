function [A, u] = HZero(A)
[m, ~] = size(A);
x = A(:, 1);
col_max = max(abs(x));

u = x/col_max;
if u(1) >= 0
    u(1) = u(1) + norm(u);
else
    u(1) = u(1) - norm(u);
end

u_norm = norm(u);
if u_norm ~= 0
    beta = 2/(u'*u);
else
    beta = 0;
end

Hu = eye(m) - beta*(u*u');

A = Hu*A;
end