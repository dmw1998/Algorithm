function T = explicit_method(lambda, t, delta_t)
n = t/delta_t + 1;
T(1,1) = 100;
T(1,2:5) = 0;
T(1,6) = 50;

for j = 2:n
    T(j,1) = 100;
    T(j,6) = 50;
    for i = 2:5
    T(j,i) = T(j-1,i) + lambda*(T(j-1,i+1) - 2*T(j-1,i) + T(j-1,i-1));
    end
end 

end