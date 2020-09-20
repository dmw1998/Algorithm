delta_t = [10, 5, 2, 1, 0.5, 0.2];
lambda = 0.835*delta_t/2^2;
t = 10;

for i = 1:6
    T1 = explicit_method(lambda(i), t, delta_t(i));
    T2 = implicit_method(lambda(i), t, delta_t(i));
    T3 = Crank_Nicolson(lambda(i), t, delta_t(i));
    m = length(T1(:,2));
    result(i,:) = [delta_t(i), lambda(i), T1(m,2), T2(m,2), T3(m,2)];
end


fprintf ("delta_t    lambda       Explicit     Implicit    Crank-Nicolson \n")
for i = 1:6
    format = ' %4.1f     %4.6f       %4.2f        %4.2f         %4.2f \n';
    fprintf(format, result(i,:))
end