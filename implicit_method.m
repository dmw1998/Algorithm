function T = implicit_method(lambda, t, delta_t)
n = t/delta_t + 1;
T(1,1) = 100;
T(1,2:5) = 0;
T(1,6) = 50;

A(1,1) = 1;
A(6,6) = 1;

for j = 2:n
    b = T(j-1,:)';
    
    for i = 2:5
        A(i,i-1) = -lambda;
        A(i,i) = 1 + 2*lambda;
        A(i,i+1) = -lambda;
    end
    
    x = A\b;
    T(j,:) = x;
end 

end