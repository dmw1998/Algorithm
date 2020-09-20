function T = Crank_Nicolson(lambda, t, delta_t)
n = t/delta_t + 1;
T(1,1) = 100;
T(1,2:5) = 0;
T(1,6) = 50;

A(1,1) = 1;
A(6,6) = 1;
b(1,1) = 100;
b(6,1) = 50;

for j = 2:n
     for i = 2:5
        A(i,i-1) = -lambda;
        A(i,i) = 2*(1+lambda);
        A(i,i+1) = -lambda;
        b(i,1) = lambda*T(j-1,i-1) + 2*(1-lambda)*T(j-1,i) + lambda*T(j-1,i+1);
    end
    T(j,:) = A\b;
end 

end