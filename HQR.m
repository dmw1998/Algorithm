function [Q, R] = HQR(A)
[m, n] = size(A);
R = A;
Q = eye(m);
k = min(m-1,n);

for i = 1:k
    [R(i:m,i:n), u] = HZero(R(i:m,i:n));
    Q(1:m,i:m) = Q(1:m,i:m) - (2/norm(u))*Q(1:m,i:m)*(u*u');
end
end